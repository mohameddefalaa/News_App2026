import 'package:hive_ce_flutter/adapters.dart';
import 'package:newsapp/core/models/user_model.dart';
import 'package:newsapp/core/constant/constatnts.dart';

class UserRepositorty {
  UserRepositorty._internal() {
    // Internal constructor to prevent external instantiation
  }
  static final _instance = UserRepositorty._internal();
  factory UserRepositorty() {
    return _instance;
  }
  late Box<UserModel> box;
  init() async {
    await Hive.initFlutter();
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(UserModelAdapter());
    }
    box = await Hive.openBox<UserModel>(Constatnts.userBox);
  }

  saveUser(UserModel user) async {
    await box.put(Constatnts.currentuser, user);
  }

  UserModel? getUser() {
    return box.get(Constatnts.currentuser);
  }

  updateUser({
    required String name,
    required String email,
    String? countryname,
    String? countrryCode,
  }) async {
    final UserModel? user = box.get(Constatnts.currentuser);
    if (user == null) {
      return;
    }
    UserModel mewuser = user.copyWith(
      name: name,
      email: email,
      countryname: countryname,
      countrryCode: countrryCode,
    );
    await box.put(Constatnts.currentuser, mewuser);
  }

  deleteUser() async {
    await box.delete(Constatnts.currentuser);
  }

  String? login({required String email, required String password}) {
    UserModel? currentuser = UserRepositorty().getUser();

    if (currentuser == null) {
      return "This user is not found";
    }
    if (currentuser.email != email || currentuser.password != password) {
      return "password or email is not correct ";
    }
    return null;
  }

  Future<String?> signup({
    required String name,
    required String password,
    required String email,
  }) async {
    UserModel? currentuser = UserRepositorty().getUser();
    if (currentuser != null) {
      return " user alreaedy exist please try again";
    }
    final newuser = UserModel(email: email, name: name, password: password);
    await saveUser(newuser);
    return null;
  }
}
