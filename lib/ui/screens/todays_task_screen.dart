import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:task_management_app/ui/constants/app_constants.dart';
import 'package:task_management_app/ui/constants/routes/routes_name.dart';
import 'package:task_management_app/ui/widgets/apps_title_bold_text.dart';
import 'package:task_management_app/ui/widgets/todays_task_custom_package.dart';
import 'package:sizer/sizer.dart';

class TodaysTaskScreen extends StatefulWidget {
  const TodaysTaskScreen({super.key});

  @override
  State<TodaysTaskScreen> createState() => _TodaysTaskScreenState();
}

class _TodaysTaskScreenState extends State<TodaysTaskScreen> {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
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
                    const AppsTitleBoldText(
                      title: "Today",
                    ),
                    addTaskButton(),
                  ],
                ),
                Gap(2.5.h),
                const  Text(
                  "Productive Day, Sourav",
                  style: TextStyle(
                    color: AppConstants.appTaskScreensDateColor,
                  ),
                ),
                Gap(2.5.h),
                Text(
                  "${DateFormat.MMMM().format(now)}, ${now.year}",
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500),
                ),
                Gap(2.5.h),
                Padding(
                  padding: EdgeInsets.only(right: 3.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       daysOfWeek(
                          nameOfDay: DateFormat.EEEE().format(now),
                          dateOfTheDay: "${now.day}",
                          isToday: true),
                      daysOfWeek(
                          nameOfDay: "${getNextDays(1)[0]}",
                          dateOfTheDay: "${getNextDays(1)[1]}",
                          isToday: false),
                      daysOfWeek(
                          nameOfDay: "${getNextDays(2)[0]}",
                          dateOfTheDay: "${getNextDays(2)[1]}",
                          isToday: false),
                      daysOfWeek(
                          nameOfDay: "${getNextDays(3)[0]}",
                          dateOfTheDay: "${getNextDays(3)[1]}",
                          isToday: false),
                      daysOfWeek(
                          nameOfDay: "${getNextDays(4)[0]}",
                          dateOfTheDay: "${getNextDays(4)[1]}",
                          isToday: false),
                      daysOfWeek(
                          nameOfDay: "${getNextDays(5)[0]}",
                          dateOfTheDay: "${getNextDays(5)[1]}",
                          isToday: false),
                      daysOfWeek(
                          nameOfDay: "${getNextDays(6)[0]}",
                          dateOfTheDay: "${getNextDays(6)[1]}",
                          isToday: false),
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

  getNextDays(int numberOfDays) {
    DateTime now = DateTime.now();
    List daysList = [];

    DateTime nextDay = now.add(Duration(days: numberOfDays));
    String dayName = DateFormat.EEEE().format(nextDay);
    String dayDate = DateFormat.d().format(nextDay);
    daysList.add(dayName);
    daysList.add(dayDate);

    return daysList;
  }

  Widget addTaskButton() {
    return Padding(
      padding: EdgeInsets.only(right: 5.w),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushReplacementNamed(RoutesName.createNewTaskScreen);
        },
        child: Container(
          height: 5.7.h,
          width: 34.w,
          decoration: BoxDecoration(
              color: const Color(0xff339398),
              borderRadius: BorderRadius.circular(40)),
          child: const Center(
              child: Text(
            "Add task",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
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
