import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/cubits/tasks_cubit/tasks_cubit.dart';
import 'package:tasks/model/task_model.dart';
import 'package:tasks/views/widgets/task_item.dart';

class DoneTasks extends StatefulWidget {
  const DoneTasks({super.key});

  @override
  State<DoneTasks> createState() => _DoneTasksState();
}

class _DoneTasksState extends State<DoneTasks> {
  @override
  void initState() {
    BlocProvider.of<TasksCubit>(context).fetchAllTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksCubit, TasksState>(
      builder: (context, state) {
        List<TaskModel> tasks = BlocProvider.of<TasksCubit>(context).tasks!;

        // Filter the tasks to get only the done tasks
        List<TaskModel> doneTasks =
            tasks.where((item) => !item.isDone && item.isArchived).toList();
        return doneTasks.isEmpty
            ? Center(
                child: Text("Done list empty"),
              )
            : ListView.builder(
                itemCount: doneTasks.length,
                itemBuilder: (BuildContext context, int index) {
                  return TaskItem(task: doneTasks[index]);
                },
              );
      },
    );
  }
}
