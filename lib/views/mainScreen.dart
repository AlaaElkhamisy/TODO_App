import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/core/app_colors.dart';
import 'package:tasks/cubits/tasks_cubit/tasks_cubit.dart';
import 'package:tasks/views/widgets/archived_tasks.dart';
import 'package:tasks/views/widgets/custom_app_bar.dart';
import 'package:tasks/views/widgets/custom_floating_btn.dart';
import 'package:tasks/views/widgets/done_tasks.dart';
import 'package:tasks/views/widgets/tasks.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  List pages = [
    Tasks(),
    DoneTasks(),
    ArchivedTasks(),
  ];
  List title = ["All Tasks", "Done Tasks", "Archived Tasks"];
  @override
  void initState() {
    setState(() {
      BlocProvider.of<TasksCubit>(context).fetchAllTasks();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomFloatingBtn(),
      appBar: CustomAppBar(title: title[_currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: AppColors.mainColor,
          selectedItemColor: Colors.black,
          onTap: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.done), label: 'Done'),
            BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Archived'),
          ]),
      body: pages[_currentIndex],
    );
  }
}
