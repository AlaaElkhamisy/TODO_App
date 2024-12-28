import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/constants.dart';
import 'package:tasks/cubits/tasks_cubit/tasks_cubit.dart';

class DeleteAllBtn extends StatelessWidget {
  const DeleteAllBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 82, right: 20),
      child: IconButton(
        icon: Icon(
          CupertinoIcons.trash,
          size: 30,
        ),
        onPressed: () {
          deleteAllTasks(context);
          BlocProvider.of<TasksCubit>(context).fetchAllTasks();
        },
      ),
    );
  }
}
