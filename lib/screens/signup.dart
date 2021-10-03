import 'package:blood_donation/custom_widgets/buttons.dart';
import 'package:blood_donation/custom_widgets/text_fields.dart';
import 'package:blood_donation/utils/fonts.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  static const ROUTE_NAME = "/signup";
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Signup"),
      ),
      bottomNavigationBar: PrimaryButton(
        text: "Signup",
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "SIGNUP",
              style: CustomFontStyle.bolderFontStyle,
            ),
            SizedBox(
              height: 16,
            ),
            Image.asset("assets/drawing.png"),
            SizedBox(
              height: 32,
            ),
            CustomTextField(hintText: "Enter Email"),
            SizedBox(height: 8),
            CustomTextField(hintText: "Enter Password")
          ],
        ),
      ),
    );
  }
}
