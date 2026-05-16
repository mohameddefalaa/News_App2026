import 'package:flutter/material.dart';
import 'package:newsapp/core/Theme/light_colors.dart';
import 'package:newsapp/features/auth/widget/custome_textfiled.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController namecontroller = TextEditingController();
    TextEditingController passworedcontroller = TextEditingController();
    GlobalKey<FormState> key = GlobalKey<FormState>();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/images/background_image.png"),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Form(
                key: key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SafeArea(child: const SizedBox(height: 155)),
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
                      false,
                      haintText: 'Email@mail.com',
                      controller: namecontroller,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "Passward",
                      style: TextTheme.of(context).displayMedium!.copyWith(
                        color: AppLightColor.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    CustomeTextFiled(
                      true,
                      haintText: "********",
                      controller: passworedcontroller,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(MediaQuery.sizeOf(context).width, 48),
                      ),
                      onPressed: () {
                        if (key.currentState!.validate()) {
                        } else {}
                      },
                      child: Text(
                        "Sign In",
                        style: TextTheme.of(
                          context,
                        ).displayMedium!.copyWith(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don’t have an account ?",
                          style: TextTheme.of(context).displayMedium!.copyWith(
                            color: AppLightColor.textPrimary,
                            fontSize: 14,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Sign Up",
                            style: TextTheme.of(context).displayMedium!
                                .copyWith(
                                  color: AppLightColor.primaryColor,
                                  fontSize: 14,
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
}
