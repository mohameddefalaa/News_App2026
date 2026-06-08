import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/core/Theme/light_theme.dart';
import 'package:newsapp/core/repos/user_repo.dart';
import 'package:newsapp/data_source/local_data/prefrencemanger.dart';
import 'package:newsapp/features/Splash/splach_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PerfrenceManager().init();
  await UserRepositorty().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,

          theme: lightTheme,
          home: SplashScreen(),
        );
      },
    );
  }
}
