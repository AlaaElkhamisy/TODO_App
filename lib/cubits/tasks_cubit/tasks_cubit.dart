import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:tasks/constants.dart';
import 'package:tasks/model/task_model.dart';

part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit() : super(TasksInitial());
  List<TaskModel>? tasks;
  fetchAllTasks() {
    var taskbox = Hive.box<TaskModel>(kTaskBox);
    tasks = taskbox.values.toList();
    emit(TasksSuccess());
  }

  // List<TaskModel>? getDoneTasks() {
  //   return tasks?.where((task) => task.isDone && !task.isArchived).toList();
  // }
  void markTaskAsDone(TaskModel task) {
    // Find the index of the task to update
    int index = tasks!.indexOf(task);
    if (index != -1) {
      // Update the task's isDone property
      tasks![index].isArchived = true; // Mark as done
      var taskBox = Hive.box<TaskModel>(kTaskBox);
      taskBox.putAt(index, tasks![index]); // Save the updated task in Hive
    }
  }

  void markTaskAsArchived(TaskModel task) {
    // Find the index of the task to update
    int index = tasks!.indexOf(task);
    if (index != -1) {
      // Update the task's isArchived property
      tasks![index].isDone = true; // Mark as done
      var taskBox = Hive.box<TaskModel>(kTaskBox);
      taskBox.putAt(index, tasks![index]); // Save the updated task in Hive
    }
  }

  void deleteTask(TaskModel task) {
    // Find the index of the task to delete
    int index = tasks!.indexOf(task);
    if (index != -1) {
      // Remove the task from the Hive box
      var taskBox = Hive.box<TaskModel>(kTaskBox);
      taskBox.deleteAt(index); // Delete the task from Hive

      // Emit the updated tasks
    }
  }
}
