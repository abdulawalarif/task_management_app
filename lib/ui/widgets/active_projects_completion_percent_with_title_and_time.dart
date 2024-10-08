import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:sizer/sizer.dart';

class ActiveProjectsCompletionPercentWithTitleAndTime extends StatelessWidget {
  final int percentOFWorkCompleted;
  final Color backgroundColor;
  final String titleOfProject;
  final String timeContinueOfProject;
  const ActiveProjectsCompletionPercentWithTitleAndTime({
    super.key,
    required this.percentOFWorkCompleted,
    required this.backgroundColor,
    required this.titleOfProject,
    required this.timeContinueOfProject,
  });

  @override
  Widget build(BuildContext context) {
    double percentNumberInCircularView =
        percentOFWorkCompleted / 100.0; // Convert to a decimal

    return Container(
      height: 27.h,
      width: 40.w,
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(40)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularPercentIndicator(
            radius: 35,
            lineWidth: 3,
            progressColor: Colors.white,
            backgroundColor: Colors.white10,
            percent: percentNumberInCircularView,
            center: Center(
              child: Text(
                "$percentOFWorkCompleted%",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Gap(2.5.h),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                titleOfProject,
                textAlign: TextAlign.center, // Center the text horizontally
                maxLines: 2, // Set the maximum number of lines as needed
                overflow: TextOverflow.ellipsis,

                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gap(.5.h),
              Text(
                "$timeContinueOfProject hours progress",
                style: const TextStyle(color: Colors.white54),
              )
            ],
          )
        ],
      ),
    );
  }
}
