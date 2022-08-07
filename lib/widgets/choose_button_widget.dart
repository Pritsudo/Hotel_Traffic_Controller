import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseButtonWidget extends StatelessWidget {
  final String title;
  final Function function;
  final Icon icon;

  const ChooseButtonWidget({
    Key? key,
    required this.title,
    required this.function,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        decoration: BoxDecoration(
            border: Border.all(width: 1),
            borderRadius: BorderRadius.circular(6)),
        height: 35.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1),
            ),
            icon
          ],
        ),
        width: 145.w,
      ),
    );
  }
}
