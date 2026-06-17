import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:newsapp/core/mixins/notify_seafty.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newsapp/core/models/user_model.dart';
import 'package:newsapp/core/repos/user_repo.dart';

class ProfileController extends ChangeNotifier with notifyseafty {
  String? name;
  void Loaduserdata() {
    UserModel? curentuser = UserRepositorty().getUser();
    if (curentuser != null) {
      name = curentuser.name;
      log(name ?? "still null");
    }
  }

  XFile? selectedimage;
  void pickImage(ImageSource source) async {
    selectedimage = await ImagePicker().pickImage(source: source);
    saveImage();
    safeNotify();
  }

  void editUserData({required String newName, required String newEmail}) async {
    if (newName.isEmpty && newEmail.isEmpty) return;

    // 1. تحديث قاعدة البيانات
    await UserRepositorty().updateUser(name: newName, email: newEmail);

    // 2. تحديث المتغير المحلي داخل الكنترولر فوراً بالاسم الجديد
    name = newName;

    // 3. إشعار كل المستمعين (الشاشة الرئيسية والـ Sheet) لإعادة البناء بالقيم الجديدة
    safeNotify();
  }

  void saveImage() async {
    if (selectedimage == null) return;
    await UserRepositorty().setProfileImage(selectedimage!.path);
  }

  void RefreshUserdata() {
    final user = UserRepositorty().getUser();
    name = user?.name;
    safeNotify();
  }
}
