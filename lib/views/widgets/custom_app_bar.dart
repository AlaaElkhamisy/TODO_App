import 'package:flutter/material.dart';
import 'package:tasks/core/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
            color: AppColors.mainColor,
            border: Border.all(color: Colors.black, width: 3)),
      ),
      Center(
          child: Container(
        margin: EdgeInsets.only(top: 70),
        padding: EdgeInsets.symmetric(horizontal: 40),
        decoration: BoxDecoration(
            color: Colors.amber,
            border: Border.all(color: Colors.black, width: 3),
            borderRadius: BorderRadius.circular(16)),
        child: Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
        ),
      )),
    ]);
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(100);
}
