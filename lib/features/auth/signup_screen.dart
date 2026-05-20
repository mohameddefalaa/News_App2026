import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:newsapp/core/Theme/light_colors.dart';
import 'package:newsapp/core/constant/app_size.dart';
import 'package:newsapp/data_source/local_data/prefrencemanger.dart';
import 'package:newsapp/features/Home/Home_screen.dart';
import 'package:newsapp/features/auth/widget/custome_textfiled.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController emailcontroller;
  late TextEditingController passworedcontroller;
  late TextEditingController confirmPassworedcontroller;
  late GlobalKey<FormState> key;

  String? errormessage;
  bool isLoading = false;
  @override
  void initState() {
    emailcontroller = TextEditingController();
    passworedcontroller = TextEditingController();
    confirmPassworedcontroller = TextEditingController();
    key = GlobalKey<FormState>();

    super.initState();
  }

  @override
  void dispose() {
    emailcontroller.dispose();
    passworedcontroller.dispose();
    confirmPassworedcontroller.dispose();
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
              image: AssetImage("assets/images/background_image.png"),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Form(
              key: key,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 155),
                    Center(
                      child: Image.asset(
                        "assets/icons/app_logo.png",
                        height: 46,
                        width: 245,
                      ),
                    ),
                    const SizedBox(height: 24),

                    Text(
                      "Welcome to Newts",
                      style: TextTheme.of(context).titleMedium,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Email",
                      style: TextTheme.of(context).displayMedium!.copyWith(
                        color: AppLightColor.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 8),
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
                      controller: emailcontroller,
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

                        // فحص الباسورد السهل (6 خانات على الأقل)
                        final passwordRegex = RegExp(r"^[a-zA-Z0-9]{6,}$");
                        if (!passwordRegex.hasMatch(value)) {
                          return "Password must be at least 6 characters";
                        }

                        // شرط التطابق التبادلي القديم الذي صنعناه مع حقل التأكيد
                        if (confirmPassworedcontroller.text.isNotEmpty &&
                            value != confirmPassworedcontroller.text) {
                          return "Passwords do not match";
                        }

                        return null;
                      },

                      isbassword: true,
                      haintText: "********",
                      controller: passworedcontroller,
                    ),
                    SizedBox(height: AppSize.h12),
                    Text(
                      "Confirm Passward",
                      style: TextTheme.of(context).displayMedium!.copyWith(
                        color: AppLightColor.textPrimary,
                      ),
                    ),
                    SizedBox(height: AppSize.h8),
                    CustomeTextFiled(
                      isbassword: true,
                      haintText: "********",
                      controller: confirmPassworedcontroller,
                    ),
                    errormessage != null
                        ? Padding(
                            padding: EdgeInsets.all(AppSize.dg16),
                            child: Text(
                              errormessage ?? "",
                              style: TextTheme.of(context).displayMedium!
                                  .copyWith(color: AppLightColor.primaryColor),
                            ),
                          )
                        : SizedBox(),
                    SizedBox(height: AppSize.h20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(
                          MediaQuery.sizeOf(context).width,
                          AppSize.h48,
                        ),
                      ),
                      onPressed: () async {
                        setState(() {});
                        if (key.currentState!.validate()) {
                          register();
                        } else {}
                      },
                      child: isLoading
                          ? CircularProgressIndicator()
                          : Text(
                              "Sign Up",
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
                          "Have an account ?",
                          style: TextTheme.of(context).displayMedium!.copyWith(
                            color: AppLightColor.textPrimary,
                            fontSize: AppSize.sp14,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Sign in",
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
    );
  }

  void register() async {
    setState(() {
      isLoading = true;
      errormessage = null;
    });
    final savedEmail = PerfrenceManager().getstring("Saved_Email");
    log(savedEmail ?? "");
    log('---------');
    log(emailcontroller.text);
    if (savedEmail != null &&
        savedEmail.trim().isNotEmpty &&
        savedEmail.trim() == emailcontroller.text.trim()) {
      log(savedEmail);
      log('---------');
      log(emailcontroller.text);
      setState(() {
        isLoading = false;
        errormessage = "Sorry This Email Already Registered";
      });
    } else {
      await PerfrenceManager().setstring(
        "Saved_Email",
        emailcontroller.text.trim(),
      );
      await PerfrenceManager().setstring(
        "Saved_Password",
        passworedcontroller.text,
      );
      await PerfrenceManager().setbool("isloggedin", true);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
      setState(() {
        errormessage = null;
        isLoading = false;
      });
    }
  }
}
