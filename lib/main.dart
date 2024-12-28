import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:tasks/constants.dart';
import 'package:tasks/cubits/tasks_cubit/tasks_cubit.dart';
import 'package:tasks/model/task_model.dart';
import 'package:tasks/simple_bloc_observer.dart';
import 'package:tasks/views/mainScreen.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<TaskModel>(kTaskBox);
  runApp(const Tasks());
}

class Tasks extends StatelessWidget {
  const Tasks({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksCubit()..fetchAllTasks(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainScreen(),
      ),
    );
  }
}
