//import '../../src/dynamic_timeline.dart';
import 'package:dynamic_timeline/dynamic_timeline.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_management_app/ui/constants/app_constants.dart';
import 'package:task_management_app/ui/widgets/todays_tasks_title_description_color.dart';

import 'package:sizer/sizer.dart';

class TodaysTaskCustomPackage extends StatelessWidget {
  const TodaysTaskCustomPackage({super.key});

  @override
  Widget build(BuildContext context) {
    // DateTime now = DateTime.now();
    final startDate = DateTime.now();
    final endDate = startDate.add(const Duration(hours: 24));

    return DynamicTimeline(
      firstDateTime: startDate,
      lastDateTime: endDate,
      labelBuilder: LabelBuilder(
        builder: (
          DateTime dateTime,
        ) {
          return SizedBox(
              width: 40.w, child: Text(DateFormat('h: 00 a').format(dateTime)));
        },
        intervalExtend: 2,
      ),
      intervalDuration: const Duration(hours: 1),
      maxCrossAxisIndicatorExtent: 10.w,
      maxCrossAxisItemExtent: 75.w,
      strokeWidth: 0,
      color: Colors.white,
      intervalExtent: 9.h,
      textStyle: TextStyle(
        color: AppConstants.appTaskScreensDateColor,
        fontSize: 12.sp,
      ),
      items: [
        TimelineItem(
          startDateTime: startDate,
          endDateTime: startDate.add(const Duration(hours: 2)),
          child: const TodaysTasksTitleDescriptionAndColor(
            titleOfProject: "Project Research",
            descriptionsOfTheProject:
                "Discuss with the colleagues about the future plan",
            backgroundColor: Color(0xffFFE4C7),
          ),
        ),
        TimelineItem(
          startDateTime: startDate.add(const Duration(hours: 4)),
          endDateTime: startDate.add(const Duration(hours: 6)),
          child: const TodaysTasksTitleDescriptionAndColor(
            titleOfProject: "Project Research",
            descriptionsOfTheProject: "Add medicine tab",
            backgroundColor: Color(0xffD4E4FE),
          ),
        ),
        TimelineItem(
          startDateTime: startDate.add(const Duration(hours: 6)),
          endDateTime: startDate.add(const Duration(hours: 8)),
          child: const TodaysTasksTitleDescriptionAndColor(
            titleOfProject: "Writing code for the app",
            descriptionsOfTheProject:
                "Discuss with the colleagues about the future plan",
            backgroundColor: Color(0xffFED4D6),
          ),
        ),
      ],
    );
  }
}
