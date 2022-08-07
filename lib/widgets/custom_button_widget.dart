import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtonWidget extends StatelessWidget {
  final String title;
  final double fntSize;
  final Color color;
  final Color backgroundColor;
  final Function function;

  const CustomButtonWidget({
    Key? key,
    required this.backgroundColor,
    required this.function,
    required this.title,
    required this.fntSize,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>function,
      child: Container(
        width: 300.w,
        height: 55.h,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(40.r),
        ),
        child: Center(
            child: Text(
          title,
          style: TextStyle(
              color: color,
              fontSize: fntSize,
              fontWeight: FontWeight.bold,
              letterSpacing: 1),
        )),
      ),
    );
  }
}
