import 'package:flutter/material.dart';
import 'package:newsapp/data_source/local_data/prefrencemanger.dart';
import 'package:newsapp/features/Home/Home_screen.dart';
import 'package:newsapp/features/auth/loigin_screen.dart';

class PageviewController with ChangeNotifier {
  int currentindex = 0;
  PageController pageController = PageController();

  void updateindexvalue(int index) {
    currentindex = index;
    notifyListeners();
  }

  void navigatoToNextPage() {
    pageController.nextPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOutCirc,
    );
  }

  void navigateandsavefinishing(BuildContext context) async {
    await PerfrenceManager().setbool("IsFinished", true);
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LogInScreen();
        },
      ),
      (route) => false,
    );
    notifyListeners();
  }
}
