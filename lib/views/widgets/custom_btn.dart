import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      required this.text,
      this.icon,
      required this.backgeoundColor,
      required this.color,
      this.onTap,
      this.borderColor});
  final String text;
  final IconData? icon;
  final Color backgeoundColor;
  final Color color;
  final Color? borderColor;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(color: borderColor!, width: 3),
            color: backgeoundColor,
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Row(
            spacing: 5,
            children: [
              Icon(
                icon,
                color: color,
              ),
              Text(
                text,
                style: TextStyle(color: color),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
