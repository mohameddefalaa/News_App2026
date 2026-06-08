import 'package:flutter/material.dart';

class ProfileMenuItem {
  final String title;
  final Widget icon;
  final void Function(BuildContext context)? onTap;
  final bool isLogout; // عشان نغير لون الزرار الأخير

  ProfileMenuItem({
    required this.title,
    required this.icon,
    required this.onTap,
    this.isLogout = false, // القيمة الافتراضية false
  });
}
