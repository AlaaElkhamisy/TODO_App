import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/core/app_colors.dart';
import 'package:tasks/cubits/add_task_cubit/add_task_cubit.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isActive, required this.color});
  final bool isActive;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            radius: 23,
            backgroundColor: Colors.white38,
            child: CircleAvatar(
              radius: 20,
              backgroundColor: color,
            ),
          )
        : CircleAvatar(
            radius: 23,
            backgroundColor: color,
          );
  }
}

class ColorsListview extends StatefulWidget {
  const ColorsListview({super.key});

  @override
  State<ColorsListview> createState() => _ColorsListviewState();
}

class _ColorsListviewState extends State<ColorsListview> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 23 * 2,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: AppColors.colors.length,
        itemBuilder: (BuildContext context, int index) {
          Color itemColor = AppColors.colors[index % AppColors.colors.length];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: GestureDetector(
              onTap: () {
                currentIndex = index;
                BlocProvider.of<AddTaskCubit>(context).color =
                    AppColors.colors[index];
                setState(() {});
              },
              child: ColorItem(
                color: itemColor,
                isActive: currentIndex == index,
              ),
            ),
          );
        },
      ),
    );
  }
}
