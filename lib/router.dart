import 'package:blood_donation/screens/edit_profile.dart';
import 'package:blood_donation/screens/home_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeScreen.ROUTE_NAME:
      return MaterialPageRoute(builder: (context) => const HomeScreen());
    case EditProfile.ROUTE_NAME:
      return MaterialPageRoute(builder: (context) => EditProfile());
    case SignUpScreen.ROUTE_NAME:
      return MaterialPageRoute(builder: (context) => SignUpScreen());
    default:
      return MaterialPageRoute(builder: (context) => const HomeScreen());
  }
}
