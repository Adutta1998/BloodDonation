// To parse this JSON data, do
//
//     final homeResponse = homeResponseFromJson(jsonString);

import 'package:blood_donation/models/profile.model.dart';

class HomeModel {
  HomeModel({
    required this.requestId,
    required this.userId,
    required this.date,
    required this.bloodGroup,
    required this.inReplacement,
    required this.city,
    required this.state,
    required this.user,
  });

  final String requestId;
  final String userId;
  final DateTime date;
  final String bloodGroup;
  final bool inReplacement;
  final String city;
  final String state;
  final ProfileModel user;

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        requestId: json["request_id"],
        userId: json["user_id"],
        date: DateTime.parse(json["date"]),
        bloodGroup: json["blood_group"],
        inReplacement: json["in_replacement"],
        city: json["city"],
        state: json["state"],
        user: ProfileModel.fromJson(json["users"]),
      );

  Map<String, dynamic> toJson() => {
        "request_id": requestId,
        "user_id": userId,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "blood_group": bloodGroup,
        "in_replacement": inReplacement,
        "city": city,
        "state": state,
        "users": user.toJson(),
      };
}
