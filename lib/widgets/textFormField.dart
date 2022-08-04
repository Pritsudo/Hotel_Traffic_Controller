import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextInputForm extends StatelessWidget {
 final bool isPassword;
 final TextEditingController controller;
 final String text;
 final Icon icon;

 const TextInputForm({
    Key? key,
    required this.text,
    required this.icon,
    required this.isPassword,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.w,
      child: TextFormField(
        cursorHeight: 25,
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
            labelText: text,
            labelStyle: TextStyle(
              color: Colors.grey[700],
                fontSize: 16.sp, fontWeight: FontWeight.bold, letterSpacing: 1),
            prefixIcon: icon,
            border: const OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.black))),
      ),
    );
  }
}
