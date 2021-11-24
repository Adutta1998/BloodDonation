import 'dart:developer';

import 'package:blood_donation/api_clients/api_client.dart';
import 'package:blood_donation/models/auth.model.dart';
import 'package:supabase/supabase.dart';

class AuthenticationRepository {
  final BDApi api;
  late String accessToken;
  AuthenticationRepository({required this.api});

  signup(email, password) async {
    var auth = AuthModel(email: email, password: password);
    GotrueSessionResponse p = await api.signUp(auth);
    print(p.rawData);
    accessToken = p.data!.accessToken;
    User user = p.data!.user!;
    return user;
  }

  signin(email, password) async {
    print(email);
    print(password);
    var auth = AuthModel(email: email, password: password);
    GotrueSessionResponse p = await api.login(auth);
    print(p.data);
  }
}
