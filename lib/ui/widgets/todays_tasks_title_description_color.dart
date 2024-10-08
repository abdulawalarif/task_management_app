import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';

class TodaysTasksTitleDescriptionAndColor extends StatelessWidget {
  final Color backgroundColor;
  final String titleOfProject;
  final String descriptionsOfTheProject;
  const TodaysTasksTitleDescriptionAndColor({
    super.key,
    required this.backgroundColor,
    required this.titleOfProject,
    required this.descriptionsOfTheProject,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(top: .9.h),
          child: SizedBox(
            width: 70.w,
            height: .1.h,
            child: CustomPaint(
              painter: DottedLinePainter(),
            ),
          ),
        ),
        const Spacer(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
          decoration: BoxDecoration(
              color: backgroundColor, borderRadius: BorderRadius.circular(26)),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 60.w,
                  child: Text(
                    titleOfProject,
                    maxLines: 2, // Set the maximum number of lines as needed
                    overflow: TextOverflow.ellipsis,
                    style:const TextStyle(
                      color: Colors.black,

                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Gap(1.h),
                SizedBox(
                  width: 60.w,
                  child: Text(
                    descriptionsOfTheProject,
                    style: const TextStyle(
                        color: Colors.black54,

                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
          ),
        ),
       const Spacer(),
        SizedBox(
          width: 70.w,
          height: .1.h,
          child: CustomPaint(
            painter: DottedLinePainter(),
          ),
        ),
      ],
    );
  }
}

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.black26
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1.0; // Adjust the line thickness

    const double dashWidth = 5.0;
    const double gapWidth = 6.0;

    double startX = 0.0;
    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX + dashWidth, 0),
        paint,
      );
      startX += dashWidth + gapWidth;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
