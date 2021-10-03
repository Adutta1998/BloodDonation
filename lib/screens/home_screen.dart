import 'package:blood_donation/custom_widgets/buttons.dart';
import 'package:blood_donation/custom_widgets/text_fields.dart';
import 'package:blood_donation/screens/edit_profile.dart';
import 'package:blood_donation/screens/signup.dart';
import 'package:blood_donation/utils/colors.dart';
import 'package:blood_donation/utils/fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const ROUTE_NAME = "/";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 60,
            ),
            Image.asset(
              'assets/drawing.png',
              scale: .9,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "BLOODFRIEND",
              style: CustomFontStyle.bolderFontStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            Text("A Friend in Need is a\n Friend in Deed",
                textAlign: TextAlign.center,
                style: CustomFontStyle.subtitleFontStyle),
            const SizedBox(
              height: 30,
            ),
            const CustomTextField(hintText: "Email"),
            const CustomTextField(hintText: "password"),
            const SizedBox(
              height: 16,
            ),
            PrimaryButton(
              text: "Login",
              onTap: () {
                Navigator.pushNamed(context, EditProfile.ROUTE_NAME);
              },
            ),
            Expanded(child: Container()),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()));
              },
              child: Row(
                children: [
                  const Text("Not A User? "),
                  Text(
                    "Signup!",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: CustomColors.redAccent1),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
