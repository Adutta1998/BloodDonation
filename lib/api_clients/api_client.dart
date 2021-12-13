import 'dart:convert';

import 'package:blood_donation/api_clients/workor.blood.dart';
import 'package:blood_donation/models/Home.model.dart';
import 'package:blood_donation/models/auth.model.dart';
import 'package:blood_donation/models/profile.model.dart';
import 'package:supabase/supabase.dart';

class BDApi {
  ServiceWorker worker = ServiceWorker.getInstance();

  signUp(AuthModel auth) {
    return worker.client!.auth.signUp(auth.email, auth.password);
  }

  login(AuthModel auth) {
    return worker.client!.auth
        .signIn(email: auth.email, password: auth.password);
  }

  getLoggedInUser() {
    User? user = worker.client!.auth.user();
    return user;
  }

  saveProfile(ProfileModel data) async {
    var response =
        await worker.client!.from("user").insert(data.toJson()).execute();
    return response;
  }

  getUserDetails({required userId}) async {
    final response = await worker.client!
        .from('users')
        .select("*")
        .eq("user_id", userId)
        .execute();

    var jsona = json.decode(jsonEncode(response.data[0]));
    ProfileModel userProfile = ProfileModel.fromJson(jsona);
    return userProfile;
  }

  getHomeResponse(String userId, String city, String state) async {
    List<HomeModel> home = [];
    final res = await worker.client!
        .from("request")
        .select("*,users(*)")
        // .eq("user_id", userId)
        .eq("city", city)
        .eq("state", state)
        .limit(5)
        .execute();

    var raw = json.decode(json.encode(res.data));
    for (final r in raw) {
      home.add(HomeModel.fromJson(r));
    }
    return home;
  }
}
