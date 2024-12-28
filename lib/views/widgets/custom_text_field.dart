import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.hint,
      required this.label,
      this.controller,
      this.onSaved});
  final String hint;
  final String label;
  final TextEditingController? controller;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return "Hey! Don't leave it empty";
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
          hintText: hint,
          labelText: label,
          hintStyle: TextStyle(fontSize: 15, color: Colors.black),
          labelStyle: TextStyle(fontSize: 18, color: Colors.black),
          border: buildBorder(width: 0),
          enabledBorder: buildBorder(width: 0),
          focusedBorder: buildBorder(width: 2)),
    );
  }

  OutlineInputBorder buildBorder({required int width}) {
    return OutlineInputBorder(
        borderSide: BorderSide(width: width.toDouble(), color: Colors.black),
        borderRadius: BorderRadius.circular(10));
  }
}
