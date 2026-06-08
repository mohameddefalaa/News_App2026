import 'package:flutter/material.dart';
import 'package:newsapp/core/Theme/light_colors.dart';
import 'package:newsapp/core/constant/app_size.dart';
import 'package:newsapp/core/repos/user_repo.dart';
import 'package:newsapp/data_source/local_data/prefrencemanger.dart';
import 'package:newsapp/features/Home/Home_screen.dart';
import 'package:newsapp/features/auth/signup_screen.dart';
import 'package:newsapp/features/auth/widget/custome_textfiled.dart';
import 'package:newsapp/features/main/main_Screen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  late TextEditingController namecontroller;
  late TextEditingController passworedcontroller;
  late GlobalKey<FormState> key;
  bool isloading = false;
  String? errorMessage;

  @override
  void initState() {
    namecontroller = TextEditingController();
    passworedcontroller = TextEditingController();
    key = GlobalKey<FormState>();

    super.initState();
  }

  @override
  void dispose() {
    namecontroller.dispose();
    passworedcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/images/background_image.png"),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSize.w16),
            child: Form(
              key: key,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset(
                          "assets/icons/app_logo.png",
                          height: AppSize.h48 * 0.95,
                          width: AppSize.w48 * 5.1,
                        ),
                      ),
                      SizedBox(height: AppSize.h24),

                      Text(
                        "Welcome to Newts",
                        style: TextTheme.of(context).titleMedium,
                      ),
                      SizedBox(height: AppSize.h16),
                      Text(
                        "Email",
                        style: TextTheme.of(context).displayMedium!.copyWith(
                          color: AppLightColor.textPrimary,
                        ),
                      ),
                      SizedBox(height: AppSize.h8),
                      CustomeTextFiled(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Email mustn't be empty";
                          }

                          // هنا ننشئ كائن الـ RegExp ونفحص القيمة
                          final emailRegex = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                          );
                          if (!emailRegex.hasMatch(value)) {
                            return "Please enter a valid email address";
                          }

                          return null;
                        },
                        haintText: 'Email@mail.com',
                        controller: namecontroller,
                      ),
                      SizedBox(height: AppSize.h12),
                      Text(
                        "Passward",
                        style: TextTheme.of(context).displayMedium!.copyWith(
                          color: AppLightColor.textPrimary,
                        ),
                      ),
                      SizedBox(height: AppSize.h8),
                      CustomeTextFiled(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Password mustn't be empty";
                          }

                          // هنا ننشئ كائن الـ RegExp ونفحص القيمة
                          final passwordRegex = RegExp(r"^[a-zA-Z0-9]{6,}$");
                          if (!passwordRegex.hasMatch(value)) {
                            return "Password must be at least 6 characters";
                          }

                          return null;
                        },
                        isbassword: true,
                        haintText: "********",
                        controller: passworedcontroller,
                      ),
                      Padding(
                        padding: EdgeInsets.all(AppSize.dg16),
                        child: Text(
                          errorMessage ?? "",

                          style: TextTheme.of(context).displayMedium!.copyWith(
                            color: AppLightColor.primaryColor,
                          ),
                        ),
                      ),
                      SizedBox(height: AppSize.h20),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(
                            MediaQuery.sizeOf(context).width,
                            AppSize.h48,
                          ),
                        ),
                        onPressed: () {
                          if (key.currentState!.validate()) {
                            login();
                          } else {}
                        },
                        child: isloading
                            ? CircularProgressIndicator()
                            : Text(
                                "Sign In",
                                style: TextTheme.of(
                                  context,
                                ).displayMedium!.copyWith(color: Colors.white),
                              ),
                      ),
                      SizedBox(height: AppSize.h24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don’t have an account ?",
                            style: TextTheme.of(context).displayMedium!
                                .copyWith(
                                  color: AppLightColor.textPrimary,
                                  fontSize: AppSize.sp14,
                                ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUpScreen(),
                                ),
                              );
                            },
                            child: Text(
                              "Sign Up",
                              style: TextTheme.of(context).displayMedium!
                                  .copyWith(
                                    color: AppLightColor.primaryColor,
                                    fontSize: AppSize.sp14,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void login() {
    setState(() {
      isloading = true;
      errorMessage = null;
    });
    String? error = UserRepositorty().login(
      email: namecontroller.text,
      password: passworedcontroller.text,
    );
    if (error == null) {
      setState(() {
        errorMessage = error;
        isloading = false;
      });
      return;
    }

    PerfrenceManager().setbool("isloggedin", true);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MainScreen()),
    );
  }
}
