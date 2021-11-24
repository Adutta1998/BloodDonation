import 'package:blood_donation/api_clients/api_client.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const ROUTE_NAME = "/";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("HomeScreen"),
      ),
    );
  }
}
