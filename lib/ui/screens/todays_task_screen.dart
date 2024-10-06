import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:task_management_app/ui/constants/app_constants.dart';
import 'package:task_management_app/ui/constants/routes/routes_name.dart';
import 'package:task_management_app/ui/widgets/apps_title_bold_text.dart';
import 'package:task_management_app/ui/widgets/todays_task_custom_package.dart';
import 'package:task_management_app/ui/widgets/todays_tasks_title_description_color.dart';
import 'package:sizer/sizer.dart';

class TodaysTaskScreen extends StatefulWidget {
  const TodaysTaskScreen({super.key});

  @override
  State<TodaysTaskScreen> createState() => _TodaysTaskScreenState();
}

class _TodaysTaskScreenState extends State<TodaysTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffFFF9EB),
        body: Padding(
          padding: EdgeInsets.only(top: 1.h, left: 6.w),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(1.9.h),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(Icons.arrow_back_ios)),
                Gap(2.5.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppsTitleBoldText(
                      title: "Today",
                      fontSize: 26.sp,
                    ),
                    addTaskButton(),
                  ],
                ),
                Gap(2.5.h),
                Text(
                  "Productive Day, Sourav",
                  style: TextStyle(
                      color: AppConstants.appTaskScreensDateColor,
                      fontSize: 15.sp),
                ),
                Gap(2.5.h),
                Text(
                  "April, 2020",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500),
                ),
                Gap(2.5.h),
                Padding(
                  padding: EdgeInsets.only(right: 3.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      /// TODO bringing raltime date and time here
                      daysOfWeek(
                          nameOfDay: "Sun", dateOfTheDay: "5", isToday: true),
                      daysOfWeek(
                          nameOfDay: "Mon", dateOfTheDay: "6", isToday: false),
                      daysOfWeek(
                          nameOfDay: "Sun", dateOfTheDay: "7", isToday: false),
                      daysOfWeek(
                          nameOfDay: "Sun", dateOfTheDay: "8", isToday: false),
                      daysOfWeek(
                          nameOfDay: "Sun", dateOfTheDay: "9", isToday: false),
                      daysOfWeek(
                          nameOfDay: "Sun", dateOfTheDay: "10", isToday: false),
                      daysOfWeek(
                          nameOfDay: "Sun", dateOfTheDay: "11", isToday: false),
                    ],
                  ),
                ),
               //
               // const TodaysTasksTitleDescriptionAndColor(
               //    titleOfProject: "Project Research",
               //    descriptionsOfTheProject: "Discuss with the colleagues about the future plan",
               //    backgroundColor: Color(0xffFFE4C7),
               //  ),
                Gap(3.h),
                TodaysTaskCustomPackage(),
                Gap(6.h)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget addTaskButton() {
    return Padding(
      padding: EdgeInsets.only(right: 5.w),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushReplacementNamed(RoutesName.createNewTaskScreen);
        },
        child: Container(
          height: 5.7.h,
          width: 34.w,
          decoration: BoxDecoration(
              color: const Color(0xff339398),
              borderRadius: BorderRadius.circular(40)),
          child: Center(
              child: Text(
            "Add task",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 13.sp),
          )),
        ),
      ),
    );
  }

  Widget daysOfWeek({
    required String nameOfDay,
    required String dateOfTheDay,
    required bool isToday,
  }) {
    return Column(
      children: [

        Text(
          nameOfDay,
          style: TextStyle(
              color: isToday
                  ? const Color(0xffE4727C)
                  : AppConstants.appTaskScreensDateColor,
              fontSize: 12.sp),
        ),
        Gap(1.h),
        Text(dateOfTheDay,
            style: TextStyle(
                color: isToday
                    ? const Color(0xffE4727C)
                    : AppConstants.appTaskScreensDateColor,
                fontSize: 11.sp,
                fontWeight: FontWeight.bold))
      ],
    );
  }
}


