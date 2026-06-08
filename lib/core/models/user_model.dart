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
  @HiveField(3)
  String? password;

  UserModel({
    this.name,
    this.email,
    this.countryname,
    this.countrryCode,
    this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      countryname: json['country_name'],
      countrryCode: json['country_code'], //
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'country_name': countryname,
      'country_code': countrryCode,
      'password': password,
    };
  }

  UserModel copyWith({
    String? name,
    String? email,
    String? countryname,
    String? countrryCode,
    String? password,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      countryname: countryname ?? this.countryname,
      countrryCode: countrryCode ?? this.countrryCode,
      password: password ?? this.password,
    );
  }
}
