import 'package:hive_ce_flutter/adapters.dart';
part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? email;
  @HiveField(2)
  String? countryname;
  @HiveField(3)
  String? countrryCode;
  @HiveField(4)
  String? password;
  @HiveField(5)
  bool? isloggedin;
  @HiveField(6)
  String? imagepath;

  UserModel({
    this.name,
    this.email,
    this.countryname,
    this.countrryCode,
    this.password,
    this.isloggedin,
    this.imagepath,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      countryname: json['country_name'],
      countrryCode: json['country_code'],
      password: json['password'],
      isloggedin: json['is_logged_in'] ?? false,
      imagepath: json['image_path'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'country_name': countryname,
      'country_code': countrryCode,
      'password': password,
      'is_logged_in': isloggedin,
      'image_path': imagepath,
    };
  }

  UserModel copyWith({
    String? name,
    String? email,
    String? countryname,
    String? countrryCode,
    String? password,
    bool? isloggedin,
    String? imagepath,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      countryname: countryname ?? this.countryname,
      countrryCode: countrryCode ?? this.countrryCode,
      password: password ?? this.password,
      isloggedin: isloggedin ?? this.isloggedin,
      imagepath: imagepath ?? this.imagepath,
    );
  }
}

