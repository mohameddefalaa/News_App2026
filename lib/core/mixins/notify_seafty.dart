import 'package:flutter/material.dart';

mixin notifyseafty on ChangeNotifier {
  bool isDispose = false;

  void safeNotify() {
    if (!isDispose) notifyListeners();
  }

  @override
  void dispose() {
    isDispose = true;
    super.dispose();
  }
}
