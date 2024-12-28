import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:tasks/constants.dart';
import 'package:tasks/core/app_colors.dart';
import 'package:tasks/model/task_model.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskInitial());
  Color color = AppColors.mainColor;
  addTask(TaskModel task) async {
    task.color = color.value;
    emit(AddTaskLoading());
    try {
      var taskBox = Hive.box<TaskModel>(kTaskBox);
      await taskBox.add(task);
      emit(AddTaskSuccess());
    } catch (e) {
      emit(AddTaskFailure(e.toString()));
    }
  }
}
