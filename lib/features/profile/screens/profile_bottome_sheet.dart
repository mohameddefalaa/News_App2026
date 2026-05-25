import 'package:flutter/material.dart';
import 'package:newsapp/core/Theme/light_colors.dart';
import 'package:newsapp/core/constant/app_size.dart';
import 'package:newsapp/data_source/local_data/prefrencemanger.dart';
import 'package:newsapp/features/auth/widget/custome_textfiled.dart';
import 'package:newsapp/features/profile/Profile_controller.dart';
import 'package:provider/provider.dart';

class ProfilebottomSheet extends StatelessWidget {
  const ProfilebottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileController>(
      builder: (BuildContext context, value, Widget? child) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.75,
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(
              horizontal: AppSize.dg16,
              vertical: AppSize.dg16,
            ),
            child: Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: AppSize.h16),
                Text(
                  "Profile Info",
                  style: TextTheme.of(
                    context,
                  ).displayMedium!.copyWith(color: AppLightColor.textPrimary),
                ),
                SizedBox(height: AppSize.h24),
                Text(
                  "User Name",
                  style: TextTheme.of(
                    context,
                  ).displayMedium!.copyWith(color: AppLightColor.textPrimary),
                ),
                CustomeTextFiled(
                  haintText: "User Name",
                  controller: value.namecontroller,
                ),
                Text(
                  "Email",
                  style: TextTheme.of(
                    context,
                  ).displayMedium!.copyWith(color: AppLightColor.textPrimary),
                ),
                CustomeTextFiled(
                  haintText: "MAil",
                  controller: value.emailcontroller,
                ),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      value.EditeUserDatat();
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Save",
                      style: TextTheme.of(
                        context,
                      ).titleMedium!.copyWith(color: AppLightColor.buttonText),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
