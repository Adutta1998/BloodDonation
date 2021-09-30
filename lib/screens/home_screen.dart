import 'package:blood_donation/custom_widgets/buttons.dart';
import 'package:blood_donation/screens/edit_profile.dart';
import 'package:blood_donation/utils/fonts.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const ROUTE_NAME = "/";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 90,
            ),
            Image.asset(
              'assets/drawing.png',
              scale: .9,
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              "BLOODFRIEND",
              style: CustomFontStyle.bolderFontStyle,
            ),
            const SizedBox(
              height: 20,
            ),
            Text("A Friend in Need is a\n Friend in Deed",
                textAlign: TextAlign.center,
                style: CustomFontStyle.subtitleFontStyle),
            const SizedBox(
              height: 60,
            ),
            PrimaryButton(
                text: "Signup With Google",
                icon: Icons.person_rounded,
                onTap: () {
                  Navigator.pushNamed(context, EditProfile.ROUTE_NAME);
                })
          ],
        ),
      ),
    );
  }
}
