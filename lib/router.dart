import 'package:blood_donation/screens/Home.dart';
import 'package:blood_donation/screens/edit_profile.dart';
import 'package:blood_donation/screens/signin.dart';
import 'package:blood_donation/screens/signup.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeScreen.ROUTE_NAME:
      return MaterialPageRoute(builder: (context) => const HomeScreen());
    case SignInScreen.ROUTE_NAME:
      return MaterialPageRoute(builder: (_) => SignInScreen());
    case EditProfile.ROUTE_NAME:
      return MaterialPageRoute(builder: (context) => EditProfile());
    case SignUpScreen.ROUTE_NAME:
      return MaterialPageRoute(builder: (context) => const SignUpScreen());
    default:
      return MaterialPageRoute(builder: (context) => const HomeScreen());
  }
}
