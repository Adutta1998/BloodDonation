import 'dart:convert';

class AuthModel {
  String email;
  String password;

  AuthModel({required this.email, required this.password});

  AuthModel fromJson(json) {
    return AuthModel(email: json["email"], password: json["password"]);
  }

  toJson() {
    Map<String, dynamic> map = {};
    map["email"] = email;
    map["password"] = password;

    return jsonEncode(map);
  }
}
