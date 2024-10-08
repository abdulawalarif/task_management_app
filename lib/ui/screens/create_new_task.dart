import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:task_management_app/ui/constants/app_constants.dart';
import 'package:task_management_app/ui/constants/routes/routes_name.dart';
import 'package:task_management_app/ui/widgets/icon_with_background_color.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:intl/intl.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import '../widgets/text_button_for_todo_category.dart';

class CreateNewTask extends StatefulWidget {
  const CreateNewTask({super.key});

  @override
  State<CreateNewTask> createState() => _CreateNewTaskState();
}

class _CreateNewTaskState extends State<CreateNewTask> {
  late DateTime newDateTime;
  String formattedDate = '';
  late final TextEditingController date;
  late final TextEditingController projectStartingTime;
  late final TextEditingController projectEndTime;
  late TimeOfDay selectedTime;

  @override
  void initState() {
    super.initState();
    date = TextEditingController();
    projectStartingTime = TextEditingController();
    projectEndTime = TextEditingController();
    newDateTime = DateTime.now();
    formattedDate = DateFormat("EEE, d MMMM").format(newDateTime);
    date.text = formattedDate;

    ///time setup
    selectedTime = TimeOfDay.now();
    TimeOfDay time = selectedTime;
    String amPm = time.period == DayPeriod.am ? 'AM' : 'PM';
    int hour = time.hourOfPeriod;
    String formattedTime =
        '$hour:${time.minute.toString().padLeft(2, '0')} $amPm';
    projectStartingTime.text = formattedTime.toString();
    projectEndTime.text = formattedTime.toString();
  }

  @override
  void dispose() {
    super.dispose();
    date.dispose();
    projectStartingTime.dispose();
    projectEndTime.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffFAFAFA),
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: 40.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppConstants.apYellowColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(
                            25.sp), // Adjust the radius as needed
                        bottomRight: Radius.circular(25.sp),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 4.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Gap(3.h),
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: const Icon(Icons.arrow_back_ios)),
                          Gap(4.h),
                          Text(
                            "Create new task",
                            style: TextStyle(
                              letterSpacing: .8,
                                color: Colors.black, fontSize: 23.sp, fontWeight: FontWeight.bold),
                          ),
                          Gap(3.h),
                          TextFormField(
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,

                            ),
                            decoration: const InputDecoration(
                              label: Text("Title"),
                              labelStyle: TextStyle(
                                color: Colors.black54, // Text color
                                fontWeight:
                                    FontWeight.w400, // Text weight (bold)
                              ),

                            ),
                          ),
                          Gap(2.h),
                          Padding(
                            padding: EdgeInsets.only(right: 5.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: dateTime,
                                  child: SizedBox(
                                    width: 75.w,
                                    child: TextFormField(
                                      controller: date,
                                      enabled: false,
                                      decoration: InputDecoration(
                                        label: const Text("Date"),
                                        suffixIcon: Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.black26,
                                          size: 19.sp,
                                        ),

                                        disabledBorder:const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                        width: .6, // Adjust the width as needed
                                        color: Colors.black, // Adjust the color as needed
                                      ),
                                    ),

                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: dateTime,
                                  child:
                                      const IconWithBackgroundColorForCalendar(
                                    color: Color(0xff339398),
                                    icon: Icons.calendar_today,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
                Gap(2.h),
                Padding(
                  padding: EdgeInsets.only(left: 5.w, right: 5.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              Navigator.of(context).push(
                                showPicker(
                                  value: Time(
                                    hour: selectedTime.hour,
                                    minute: selectedTime.minute,
                                  ),
                                  context: context,
                                  onChange: (date) {
                                    TimeOfDay time = date;
                                    String amPm = time.period == DayPeriod.am
                                        ? 'AM'
                                        : 'PM';
                                    int hour = time.hourOfPeriod;
                                    String formattedTime =
                                        '$hour:${time.minute.toString().padLeft(2, '0')} $amPm';
                                    projectStartingTime.text =
                                        formattedTime.toString();
                                  },
                                ),
                              );
                            },
                            child: SizedBox(
                              width: 40.w,
                              child: TextFormField(
                                controller: projectStartingTime,
                                enabled: false,
                                style: const TextStyle(
                                  color: Colors.black87, // Text color
                                  fontWeight:
                                      FontWeight.w600, // Text weight (bold)
                                ),
                                decoration: InputDecoration(
                                  label: const Text("Start Time"),
                                  suffixIcon: Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.black26,
                                    size: 19.sp,
                                  ),
                                  labelStyle: const TextStyle(
                                    color: Colors.black54, // Text color
                                    fontWeight:
                                        FontWeight.w400, // Text weight (bold)
                                  ),
                                  disabledBorder:const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      width: .6, // Adjust the width as needed
                                      color: Colors.black, // Adjust the color as needed
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              Navigator.of(context).push(
                                showPicker(
                                  value: Time(
                                    hour: selectedTime.hour,
                                    minute: selectedTime.minute,
                                  ),
                                  context: context,
                                  onChange: (date) {
                                    TimeOfDay time = date;
                                    String amPm = time.period == DayPeriod.am
                                        ? 'AM'
                                        : 'PM';
                                    int hour = time.hourOfPeriod;
                                    String formattedTime =
                                        '$hour:${time.minute.toString().padLeft(2, '0')} $amPm';
                                    projectEndTime.text =
                                        formattedTime.toString();
                                  },
                                ),
                              );
                            },
                            child: SizedBox(
                              width: 40.w,
                              child: TextFormField(
                                controller: projectEndTime,
                                enabled: false,
                                style: const TextStyle(
                                  color: Colors.black87, // Text color
                                  fontWeight:
                                      FontWeight.w600, // Text weight (bold)
                                ),
                                decoration: InputDecoration(
                                  label: const Text("End Time"),
                                  suffixIcon: Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.black26,
                                    size: 19.sp,
                                  ),
                                  disabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      width: .6, // Adjust the width as needed
                                      color: Colors.black, // Adjust the color as needed
                                    ),
                                  ),
                                  labelStyle: const TextStyle(
                                    color: Colors.black54, // Text color
                                    fontWeight:
                                        FontWeight.w400, // Text weight (bold)
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gap(3.h),
                      TextFormField(
                        maxLines: null,
                        style: const TextStyle(
                          color: Colors.black, // Text color
                          fontWeight: FontWeight.w400, // Text weight (bold)
                        ),
                        decoration: const InputDecoration(
                          label: Text("Description"),
                          labelStyle: TextStyle(
                            color: Colors.black54, // Text color
                            fontWeight: FontWeight.w400, // Text weight (bold)
                          ),
                          disabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: .8, // Adjust the width as needed
                              color: Colors.black, // Adjust the color as needed
                            ),
                          ),
                        ),
                      ),
                      Gap(3.h),
                      Text(
                        "Category",
                        style:
                            TextStyle(color: Colors.black54, fontSize: 18.sp),
                      ),
                      Gap(2.h),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButtonForTodoCategory(
                            text: "SPORT APP",
                            colorForBackground: Color(0xffE46471),
                            colorForText: Colors.white,
                          ),
                          TextButtonForTodoCategory(
                            text: "MEDICAL APP",
                            colorForBackground: Color(0xffDCDCDC),
                            colorForText: Colors.black,
                          ),
                          TextButtonForTodoCategory(
                            text: "RENT APP",
                            colorForBackground: Color(0xffDCDCDC),
                            colorForText: Colors.black,
                          )
                        ],
                      ),
                      Gap(2.h),
                       Row(
                        children: [
                        const  TextButtonForTodoCategory(
                            text: "NOTES",
                            colorForBackground: Color(0xffDCDCDC),
                            colorForText: Colors.black,
                          ),
                          Gap(5.w),
                          const TextButtonForTodoCategory(
                            text: "GAMING PLATFORM APP",
                            colorForBackground: Color(0xffDCDCDC),
                            colorForText: Colors.black,
                          )
                        ],
                      ),
                      Gap(7.5.h),
                      InkWell(
                        onTap: (){
                          Navigator.of(context).pushReplacementNamed(RoutesName.homeScreen);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 2.h),

                          decoration: BoxDecoration(
                              color: const Color(0Xff6588E4),
                              borderRadius: BorderRadius.circular(40)),
                          child: Center(
                              child: Text(
                                "Create Task",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.sp),
                              )),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void dateTime() async {
    FocusScope.of(context).unfocus();
    newDateTime = await showRoundedDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(DateTime.now().year - 1),
          lastDate: DateTime(DateTime.now().year + 1),
          theme: ThemeData(primarySwatch: Colors.cyan),
          height: 30.h,
          borderRadius: 26.sp,
        ) ??
        newDateTime;

    setState(() {
      formattedDate = DateFormat("EEE, d MMMM").format(newDateTime);
      date.text = formattedDate;
    });
  }
}
