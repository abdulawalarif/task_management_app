import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class IconWithBackgroundColorForCalendar extends StatelessWidget {
  final IconData icon;
  final Color color;
  const IconWithBackgroundColorForCalendar(
      {super.key, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.h,
      width: 13.w,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(40)),
      child: Center(
        child: Icon(
          icon,
          size: 16.sp,
          color: Colors.white, // Icon color
        ),
      ),
    );
  }
}

class IconWithBackgroundColorForTasks extends StatelessWidget {
  final IconData icon;
  final Color color;
  const IconWithBackgroundColorForTasks(
      {super.key, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5.h,
      width: 11.w,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(40)),
      child: Center(
        child: Icon(
          icon,
          size: 14.sp,
          color: Colors.white, // Icon color
        ),
      ),
    );
  }
}
