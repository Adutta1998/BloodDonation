import 'package:blood_donation/api_clients/workor.blood.dart';
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
}
