import 'package:flutter/material.dart';
import 'package:newsapp/data_source/local_data/prefrencemanger.dart';
import 'package:newsapp/features/Home/Home_screen.dart';
import 'package:newsapp/features/auth/loigin_screen.dart';
import 'package:newsapp/features/main/main_Screen.dart';
import 'package:newsapp/features/onBoarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _navigatAfterSplashScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Image(
        width: double.infinity,
        image: AssetImage('assets/images/splash.png'),
      ),
    );
  }

  void _navigatAfterSplashScreen() async {
    await Future.delayed(Duration(seconds: 2));
    bool? isOnBoardingComplete =
        PerfrenceManager().getbool("IsFinished") ?? false;

    bool? isloggedin = PerfrenceManager().getbool("isloggedin") ?? false;
    if (!isOnBoardingComplete) {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return OnBoardingScreen();
          },
        ),
      );
    } else if (!isloggedin) {
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return LogInScreen();
          },
        ),
      );
    } else {
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return MainScreen();
          },
        ),
      );
    }
  }
}
