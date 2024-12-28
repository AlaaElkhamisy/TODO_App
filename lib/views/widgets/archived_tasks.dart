import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/cubits/tasks_cubit/tasks_cubit.dart';
import 'package:tasks/model/task_model.dart';
import 'package:tasks/views/widgets/task_item.dart';

class ArchivedTasks extends StatefulWidget {
  const ArchivedTasks({super.key});

  @override
  State<ArchivedTasks> createState() => _ArchivedTasksState();
}

class _ArchivedTasksState extends State<ArchivedTasks> {
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
        List<TaskModel> archivedTasks =
            tasks.where((item) => !item.isArchived && item.isDone).toList();
        return archivedTasks.isEmpty
            ? Center(
                child: Text("Archived tasks empty"),
              )
            : ListView.builder(
                itemCount: archivedTasks.length,
                itemBuilder: (BuildContext context, int index) {
                  return TaskItem(task: archivedTasks[index]);
                },
              );
      },
    );
  }
}
