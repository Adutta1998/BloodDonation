import 'package:blood_donation/api_clients/api_client.dart';
import 'package:blood_donation/models/Home.model.dart';
import 'package:blood_donation/models/profile.model.dart';

class UsersRepository {
  final BDApi api;
  late String accessToken;
  late ProfileModel userProfile;
  UsersRepository({required this.api});

  getUser() async {
    ProfileModel userProfile =
        await api.getUserDetails(userId: api.getLoggedInUser().id);
    this.userProfile = userProfile;
    return userProfile;
  }

  getHome() async {
    List<HomeModel> homeResponse = await api.getHomeResponse(
      userProfile.userId,
      userProfile.city,
      userProfile.state,
    );
    return homeResponse;
  }
}
