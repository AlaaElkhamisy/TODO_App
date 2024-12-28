import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/cubits/tasks_cubit/tasks_cubit.dart';
import 'package:tasks/model/task_model.dart';
import 'package:tasks/views/widgets/delete_all_btn.dart';
import 'package:tasks/views/widgets/task_item.dart';

class Tasks extends StatefulWidget {
  const Tasks({super.key});

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
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

        return tasks.isEmpty
            ? Center(
                child: Text("All Tasks done"),
              )
            : Stack(alignment: Alignment.bottomRight, children: [
                ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Dismissible(
                      key: ValueKey(tasks[index]),
                      direction: DismissDirection.horizontal,
                      onDismissed: (_) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Task deleted Successfully"),
                          backgroundColor: Colors.red,
                        ));
                        BlocProvider.of<TasksCubit>(context)
                            .deleteTask(tasks[index]);
                        BlocProvider.of<TasksCubit>(context).fetchAllTasks();
                      },
                      background: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.delete_outline,
                            color: Colors.grey,
                          ),
                          Text(
                            "This task will be deleted",
                          )
                        ],
                      ),
                      child: TaskItem(
                        task: tasks[index],
                      ),
                    );
                  },
                ),
                DeleteAllBtn()
              ]);
      },
    );
  }
}
