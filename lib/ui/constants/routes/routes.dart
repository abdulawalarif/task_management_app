import 'package:flutter/material.dart';
import 'package:task_management_app/ui/constants/routes/routes_name.dart';
import 'package:task_management_app/ui/screens/create_new_task.dart';
import 'package:task_management_app/ui/screens/home_screen.dart';
import 'package:task_management_app/ui/screens/todays_task_screen.dart';

class Routes {

  static Route<dynamic> generatedRoute(RouteSettings settings){
    switch(settings.name){
      case RoutesName.homeScreen:
        return MaterialPageRoute(builder: (BuildContext context) => const HomeScreen());
      case RoutesName.todayTasksScreen:
        return MaterialPageRoute(builder: (BuildContext context) => const TodaysTaskScreen());
      case RoutesName.createNewTaskScreen:
        return MaterialPageRoute(builder: (BuildContext context) => const CreateNewTask());

      default:
        return MaterialPageRoute(builder: (_){
          return const Scaffold(
            body: Center(
              child: Text("No route defined"),
            ),
          );
        });
    }
  }
}