import 'package:flutter/material.dart';
import 'package:newsapp/core/Theme/light_colors.dart';
import 'package:newsapp/core/constant/app_size.dart';
import 'package:newsapp/data_source/local_data/prefrencemanger.dart';
import 'package:newsapp/features/auth/loigin_screen.dart';
import 'package:newsapp/features/profile/model/ProfileMenuItemModel.dart';
import 'package:newsapp/features/profile/screens/terms_Screen.dart';
import 'package:country_picker/country_picker.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Profile",
          style: TextTheme.of(context).titleMedium!.copyWith(
            fontSize: AppSize.sp16,
            color: AppLightColor.textPrimary,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(AppSize.dg16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: AppSize.h28),
            Center(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  CircleAvatar(
                    radius: AppSize.r45 + 13,
                    backgroundColor: AppLightColor.border,

                    child: CircleAvatar(
                      radius: AppSize.r45 + 10,
                      backgroundImage: AssetImage("assets/images/me.png"),
                    ),
                  ),
                  Positioned(
                    bottom: -10,
                    right: 0,
                    top: 70,
                    child: CircleAvatar(
                      backgroundColor: AppLightColor.border,
                      radius: 22,
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: AppLightColor.appbarbackground,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.camera_alt_outlined,
                            size: AppSize.r24,
                            color: AppLightColor.textPrimary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSize.h8),
            Center(
              child: Text(
                "Mohamed Defala",
                style: TextTheme.of(context).displayMedium!.copyWith(
                  fontSize: AppSize.sp18,
                  color: AppLightColor.textPrimary,
                ),
              ),
            ),
            SizedBox(height: AppSize.h8 * 2),
            Text(
              "Profile Info",
              style: TextTheme.of(context).displayMedium!.copyWith(
                fontSize: AppSize.sp14,
                color: AppLightColor.textPrimary,
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  final color = menuItems[index].isLogout
                      ? AppLightColor.primaryColor
                      : AppLightColor.textPrimary;
                  return ListTile(
                    onTap: () => menuItems[index].onTap?.call(context),
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(menuItems[index].icon, color: color),
                    title: Text(
                      menuItems[index].title,
                      style: TextTheme.of(
                        context,
                      ).displayMedium!.copyWith(color: color, fontSize: 16),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: color,
                      size: 18,
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 1,
                    width: AppSize.w48 * 7.145,
                    color: AppLightColor.border,
                  );
                },
                itemCount: menuItems.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final List<ProfileMenuItem> menuItems = [
  ProfileMenuItem(
    title: "Personal Info",
    icon: Icons.person_outline,
    onTap: (context) {
      // Navigate to Personal Info
    },
  ),
  ProfileMenuItem(title: "Language", icon: Icons.language, onTap: (context) {}),
  ProfileMenuItem(
    title: "Country",
    icon: Icons.flag_outlined,
    onTap: (context) {
      showCountryPicker(
        context: context,
        showPhoneCode:
            true, // optional. Shows phone code before the country name.
        onSelect: (Country country) {
          print('Select country: ${country.displayName}');
        },
      );
    },
  ),
  ProfileMenuItem(
    title: "Terms & Conditions",
    icon: Icons.article_outlined,
    onTap: (context) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) {
            return TermsAndConditionsScreen();
          },
        ),
      );
    },
  ),
  ProfileMenuItem(
    title: "Logout",
    icon: Icons.logout,
    isLogout: true, // خلينا دي true عشان تظهر باللون الأحمر
    onTap: (context) async {
      await PerfrenceManager().setbool("isloggedin", false);

      if (!context.mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return LogInScreen();
          },
        ),
      );
      // Logout Logic
    },
  ),
];
