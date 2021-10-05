import 'package:blood_donation/api_clients/workor.blood.dart';
import 'package:blood_donation/models/auth.model.dart';
import 'package:blood_donation/models/profile.model.dart';

class BDApi {
  ServiceWorker worker = ServiceWorker.getInstance();

  signUp(AuthModel auth) {
    worker.client!.auth.signUp(auth.email, auth.password);
  }

  login(AuthModel auth) {
    worker.client!.auth.signIn(email: auth.email, password: auth.password);
  }

  saveProfile(ProfileModel data) async {
    var response =
        await worker.client!.from("user").insert(data.toJson()).execute();
    return response;
  }
}
