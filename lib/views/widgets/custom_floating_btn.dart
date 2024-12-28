import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/core/app_colors.dart';
import 'package:tasks/cubits/add_task_cubit/add_task_cubit.dart';
import 'package:tasks/cubits/tasks_cubit/tasks_cubit.dart';
import 'package:tasks/views/widgets/add_task_form.dart';

class CustomFloatingBtn extends StatelessWidget {
  const CustomFloatingBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) => BlocProvider(
                  create: (context) => AddTaskCubit(),
                  child: AlertDialog(
                    shape: Border.all(color: Colors.black, width: 3),
                    backgroundColor: Color(0xffA1D6CB),
                    title: Text(
                      "Task Details",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    content: BlocConsumer<AddTaskCubit, AddTaskState>(
                      listener: (context, state) {
                        if (state is AddTaskFailure) {}
                        if (state is AddTaskSuccess) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Task added Successfully"),
                            backgroundColor: Colors.green,
                          ));
                          BlocProvider.of<TasksCubit>(context).fetchAllTasks();
                          Navigator.pop(context);
                        }
                      },
                      builder: (context, state) {
                        return SizedBox(
                            width: 315, height: 380, child: AddTaskForm());
                      },
                    ),
                  ),
                ));
      },
      shape: Border.all(color: Colors.black, width: 3),
      backgroundColor: AppColors.mainColor,
      child: Icon(
        Icons.add,
        color: Colors.black,
      ),
    );
  }
}
