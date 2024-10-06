import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'ui/constants/routes/routes.dart';
import 'ui/constants/routes/routes_name.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return const MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RoutesName.homeScreen,
        onGenerateRoute: Routes.generatedRoute,
      );
    });
  }
}
