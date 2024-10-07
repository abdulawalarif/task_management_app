import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:task_management_app/ui/constants/routes/routes_name.dart';
import 'package:task_management_app/ui/widgets/active_projects_completion_percent_with_title_and_time.dart';
import 'package:task_management_app/ui/widgets/apps_title_bold_text.dart';
import 'package:task_management_app/ui/widgets/icon_with_background_color.dart';
import 'package:task_management_app/ui/widgets/tasks_icon_title_and_status.dart';
import 'package:sizer/sizer.dart';
import '../constants/app_constants.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: const Color(0xffFFF9EB),
         body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                  height: 28.h,
                  decoration: BoxDecoration(
                    color: AppConstants.apYellowColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft:
                          Radius.circular(25.sp), // Adjust the radius as needed
                      bottomRight: Radius.circular(25.sp),
                    ),
                  ),
                  child: Column(
                    children: [
                      /// appBar Section
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              _scaffoldKey.currentState?.openDrawer();
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 3.h, horizontal: 5.w),
                              child: const Icon(Icons.line_weight),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 2.h, horizontal: 5.w),
                            child:  Icon(Icons.search, size: 25.sp,),
                          )
                        ],
                      ),
                      Gap(2.h),

                      /// profile Section
                      userProfileInfo(),
                    ],
                  )),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const  AppsTitleBoldText(
                          title: "My Tasks",

                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).pushNamed(RoutesName.todayTasksScreen);
                          },
                          child: const IconWithBackgroundColorForCalendar(
                            color: Color(0xff339398),
                            icon: Icons.calendar_today,
                          ),
                        ),
                      ],
                    ),
                    Gap(3.h),
                    const TaskIconTitleAndStatus(
                      nowGoingOn: 5,
                      started: 1,
                      taskTitle: "To Do",
                      iconWithBackgroundColorForTasks: IconWithBackgroundColorForTasks(
                        color: Color(0xffE46471),
                        icon: Icons.alarm,
                      ),
                    ),
                    Gap(2.h),
                    const TaskIconTitleAndStatus(
                      nowGoingOn: 1,
                      started: 1,
                      taskTitle: "In Progress",
                      iconWithBackgroundColorForTasks: IconWithBackgroundColorForTasks(
                        color: Color(0xffF9BE7C),
                        icon: Icons.watch_later_outlined,
                      ),
                    ),
                    Gap(2.h),
                    const TaskIconTitleAndStatus(
                      nowGoingOn: 18,
                      started: 13,
                      taskTitle: "Done",
                      iconWithBackgroundColorForTasks: IconWithBackgroundColorForTasks(
                        color: Color(0xff6588E4),
                        icon: Icons.check_circle_outline_outlined,
                      ),
                    ),
                    Gap(3.h),
                    const  AppsTitleBoldText(
                      title: "Active Projects",

                    ),

                      Gap(2.h),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ActiveProjectsCompletionPercentWithTitleAndTime(
                            percentOFWorkCompleted: 25,
                            backgroundColor: Color(0xff339398),
                            titleOfProject: "Medical App",
                            timeContinueOfProject: '6',
                          ),
                          ActiveProjectsCompletionPercentWithTitleAndTime(
                            percentOFWorkCompleted: 80,
                            backgroundColor: Color(0xffE46471),
                            titleOfProject: "Making History Notes",
                            timeContinueOfProject: '20',
                          ),
                        ],
                      ),
                      Gap(2.6.h),
                      /// will have to make it a grib builder
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ActiveProjectsCompletionPercentWithTitleAndTime(
                            percentOFWorkCompleted: 50,
                            backgroundColor: AppConstants.apYellowColor,
                            titleOfProject: "Rent App",
                            timeContinueOfProject: '16',
                          ),
                          ActiveProjectsCompletionPercentWithTitleAndTime(
                            percentOFWorkCompleted: 10,
                            backgroundColor: Color(0xff6588E4),
                            titleOfProject: "Notes",
                            timeContinueOfProject: '200',
                          ),
                        ],
                      ),

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget userProfileInfo() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Row(
        children: [
          CircularPercentIndicator(
            radius: 49,
            lineWidth: 3,
            percent: 0.8,
            center: Center(
              child: ClipOval(
                child: Image.asset(
                  'assets/images/avatar.jpg',
                  width: 21.w,
                  height:10.h,
                  fit: BoxFit.cover, // Adjust the fit as needed
                ),
              ),
            ),
            progressColor: const Color(0xffE46871),
            backgroundColor: AppConstants.apYellowColor,
          ),
          Gap(5.w),
          Column(
            children: [
              const  AppsTitleBoldText(
                title: "Sourav Suman",

              ),
              Gap(.2.h),
              Text(
                "App Developer",
                style: TextStyle(
                  color: const Color(0xff9F784C),
                  fontSize: 15.sp,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

