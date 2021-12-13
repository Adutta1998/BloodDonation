// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class ProfileModel {
  ProfileModel({
    required this.userId,
    required this.name,
    required this.dob,
    required this.profileImage,
    required this.bloodGroup,
    required this.phone,
    required this.email,
    required this.lastDateOfDonation,
    required this.city,
    required this.state,
  });

  final String userId;
  final String name;
  final DateTime dob;
  final dynamic profileImage;
  final String bloodGroup;
  final String phone;
  final String email;
  final DateTime lastDateOfDonation;
  final String city;
  final String state;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        userId: json["user_id"],
        name: json["name"],
        dob: DateTime.parse(json["dob"]),
        profileImage: json["profile_image"],
        bloodGroup: json["blood_group"],
        phone: json["phone"],
        email: json["email"],
        lastDateOfDonation: DateTime.parse(json["last_date_of_donation"]),
        city: json["city"],
        state: json["state"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "name": name,
        "dob":
            "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
        "profile_image": profileImage,
        "blood_group": bloodGroup,
        "phone": phone,
        "email": email,
        "last_date_of_donation":
            "${lastDateOfDonation.year.toString().padLeft(4, '0')}-${lastDateOfDonation.month.toString().padLeft(2, '0')}-${lastDateOfDonation.day.toString().padLeft(2, '0')}",
        "city": city,
        "state": state,
      };
}
