import 'package:shared_preferences/shared_preferences.dart';

class PerfrenceManager {
  static final PerfrenceManager _instance = PerfrenceManager._internal();

  factory PerfrenceManager() {
    return _instance;
  }
  // private constructor ;
  PerfrenceManager._internal();

  ///
  late final SharedPreferences _preferences;
  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<bool> setbool(String key, bool value) {
    return _preferences.setBool(key, value);
  }

  bool? getbool(String key) {
    return _preferences.getBool(key);
  }
}
