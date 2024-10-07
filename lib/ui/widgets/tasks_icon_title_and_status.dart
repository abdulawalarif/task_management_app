import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:task_management_app/ui/widgets/apps_title_bold_text.dart';
import 'package:task_management_app/ui/widgets/icon_with_background_color.dart';
import 'package:sizer/sizer.dart';

class TaskIconTitleAndStatus extends StatelessWidget {
  final String taskTitle;
  final int nowGoingOn;
  final int started;
  final IconWithBackgroundColorForTasks iconWithBackgroundColorForTasks;
  const TaskIconTitleAndStatus({
    super.key,
    required this.iconWithBackgroundColorForTasks,
    required this.taskTitle,
    required this.nowGoingOn,
    required this.started,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 7.h,
      child: Row(
        children: [
          iconWithBackgroundColorForTasks,
          Gap(2.3.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppsTitleBoldText(
                title: taskTitle,
              ),
              Gap(.3.h),
              Text(
                "$nowGoingOn task now $started started",
                style: TextStyle(
                  color: const Color(0xffC3C0B6),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
