import 'dart:convert';

class ProfileModel {
  String? uid;
  String? name;
  DateTime? dob;
  String? profileImage;
  String? address;
  String? bloodGroup;
  String? phone;
  String? email;
  double? lat;
  double? lon;
  DateTime? lastBloodDonationDate;

  ProfileModel({
    this.uid,
    this.name,
    this.dob,
    this.profileImage,
    this.address,
    this.bloodGroup,
    this.phone,
    this.email,
    this.lat,
    this.lon,
    this.lastBloodDonationDate,
  });

  ProfileModel fromJson(String response) {
    var json = jsonDecode(response);
    var data = ProfileModel(
      uid: json["uid"],
      name: json["uid"],
      dob: json["uid"],
      profileImage: json["uid"],
      address: json["uid"],
      bloodGroup: json["uid"],
      phone: json["uid"],
      email: json["uid"],
      lat: json["uid"],
      lon: json["uid"],
      lastBloodDonationDate: json["uid"],
    );
    return data;
  }

  toJson() {
    Map<String, dynamic> json = {};
    json["name"] = name;
    json["dob"] = dob!.toIso8601String();
    json["profile_image"] = profileImage;
    json["address"] = address;
    json["blood_group"] = bloodGroup;
    json["phone"] = phone;
    json["email"] = email;
    json["latitude"] = lat;
    json["longitude"] = lon;
    json["last_date_of_donation"] = lastBloodDonationDate;
    return json;
  }
}
