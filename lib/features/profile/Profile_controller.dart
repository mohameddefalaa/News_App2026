import 'dart:io';

import 'package:flutter/material.dart';
import 'package:newsapp/core/mixins/notify_seafty.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newsapp/data_source/local_data/prefrencemanger.dart';

class ProfileController extends ChangeNotifier with notifyseafty {
  String? name = PerfrenceManager().getstring("Saved_Name");

  TextEditingController namecontroller = TextEditingController(
    text: PerfrenceManager().getstring("Saved_Name"),
  );
  TextEditingController emailcontroller = TextEditingController(
    text: PerfrenceManager().getstring("Saved_Email"),
  );

  XFile? selectedimage;
  void pickImage(ImageSource source) async {
    selectedimage = await ImagePicker().pickImage(source: source);
    saveImage();
    safeNotify();
  }

  void saveImage() async {
    if (selectedimage == null) return;
    bool? savedImage = await PerfrenceManager().setstring(
      "Saved_Image",
      selectedimage!.path,
    );
  }

  void EditeUserDatat() async {
    if (namecontroller.text.isEmpty && emailcontroller.text.isEmpty) {
      return;
    } else {
      await PerfrenceManager().setstring(
        "Saved_Name",
        namecontroller.text.trim(),
      );
      await PerfrenceManager().setstring(
        "Saved_Email",
        emailcontroller.text.trim(),
      );
    }
    RefreshUserdata();
  }

  void RefreshUserdata() {
    name = PerfrenceManager().getstring("Saved_Name");
    PerfrenceManager().getstring("Saved_Email");
    safeNotify();
  }
}
