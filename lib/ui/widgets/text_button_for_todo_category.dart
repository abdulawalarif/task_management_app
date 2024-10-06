import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TextButtonForTodoCategory extends StatelessWidget {
  final String text;
  final Color colorForBackground;
  final Color colorForText;

  const TextButtonForTodoCategory({super.key,
    required this.colorForBackground,
    required this.colorForText,
    required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
     padding: EdgeInsets.symmetric(horizontal: 3.4.w,vertical: 1.3.h),

      decoration: BoxDecoration(
          color: colorForBackground,
          borderRadius: BorderRadius.circular(40)),
      child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: colorForText,
                fontWeight: FontWeight.w500,
                fontSize: 12.sp),
          )),
    );
  }
}
