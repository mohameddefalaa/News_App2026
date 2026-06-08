import 'dart:io';

import 'package:flutter/material.dart';
import 'package:newsapp/core/Theme/light_colors.dart';
import 'package:newsapp/core/constant/app_size.dart';
import 'package:newsapp/data_source/local_data/prefrencemanger.dart';
import 'package:newsapp/features/auth/loigin_screen.dart';
import 'package:newsapp/features/profile/Profile_controller.dart';
import 'package:newsapp/features/profile/model/ProfileMenuItemModel.dart';
import 'package:newsapp/features/profile/screens/profile_bottome_sheet.dart';
import 'package:newsapp/features/profile/screens/terms_Screen.dart';
import 'package:country_picker/country_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isselectedcountrty = false;
  String? countryname;
  String? countrycode;

  @override
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return ProfileController()..RefreshUserdata();
      },
      builder: (context, child) {
        final controller = context.watch<ProfileController>();
        final List<ProfileMenuItem> menuItems = [
          ProfileMenuItem(
            title: "Personal Info",
            icon: Icon(Icons.person_outline),
            onTap: (context) async {
              await showModalBottomSheet(
                isScrollControlled: true,
                useSafeArea: true,
                backgroundColor: AppLightColor.backgroundColor,
                context: context,
                builder: (ctx) {
                  return ChangeNotifierProvider.value(
                    value: context.read<ProfileController>()..Loaduserdata(),
                    child: ProfilebottomSheet(),
                  );
                },
              ).then((value) {
                controller.RefreshUserdata();
              });
            },
          ),
          ProfileMenuItem(
            title: "Language",
            icon: Icon(Icons.language),
            onTap: (context) {},
          ),
          ProfileMenuItem(
            title: isselectedcountrty ? countryname! : "Country",
            icon: isselectedcountrty
                ? Text(
                    "+${countrycode.toString()}",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                  )
                : Icon(Icons.flag_outlined),
            onTap: (context) {
              showCountryPicker(
                context: context,
                showPhoneCode:
                    true, // optional. Shows phone code before the country name.
                onSelect: (Country country) {
                  setState(() {
                    isselectedcountrty = true;
                    countryname = country.name;
                    countrycode = country.phoneCode;
                  });
                },
              );
            },
          ),
          ProfileMenuItem(
            title: "Terms & Conditions",
            icon: Icon(Icons.article_outlined),
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
            icon: Icon(Icons.logout),
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
          body: Consumer<ProfileController>(
            builder:
                (BuildContext context, ProfileController value, Widget? child) {
                  final image = PerfrenceManager().getstring("Saved_Image");
                  return Padding(
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
                                  backgroundImage: value.selectedimage != null
                                      ? FileImage(File(image!))
                                      : image != null
                                      ? FileImage(File(image))
                                      : AssetImage("assets/images/person.png"),
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
                                    backgroundColor:
                                        AppLightColor.appbarbackground,
                                    child: IconButton(
                                      onPressed: () => showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return SimpleDialog(
                                            backgroundColor:
                                                AppLightColor.backgroundColor,
                                            title: Text("Select Image Source "),
                                            children: [
                                              SimpleDialogOption(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  value.pickImage(
                                                    ImageSource.camera,
                                                  );
                                                },
                                                child: Row(
                                                  children: [
                                                    Icon(Icons.camera),
                                                    SizedBox(
                                                      width: AppSize.w4 * 3,
                                                    ),
                                                    Text("Camera"),
                                                  ],
                                                ),
                                              ),
                                              SimpleDialogOption(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  value.pickImage(
                                                    ImageSource.gallery,
                                                  );
                                                },
                                                child: Row(
                                                  children: [
                                                    Icon(Icons.image),
                                                    SizedBox(
                                                      width: AppSize.w4 * 3,
                                                    ),
                                                    Text("Gallery"),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
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
                            value.name ?? "null",
                            style: TextTheme.of(context).displayMedium!
                                .copyWith(
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
                                onTap: () =>
                                    menuItems[index].onTap?.call(context),
                                contentPadding: EdgeInsets.zero,
                                leading: menuItems[index].icon,

                                title: Text(
                                  menuItems[index].title,
                                  style: TextTheme.of(context).displayMedium!
                                      .copyWith(color: color, fontSize: 16),
                                ),
                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                  color: color,
                                  size: 18,
                                ),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
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
                  );
                },
          ),
        );
      },
    );
  }
}
