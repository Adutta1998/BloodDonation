import 'package:blood_donation/custom_widgets/buttons.dart';
import 'package:blood_donation/custom_widgets/text_fields.dart';
import 'package:blood_donation/screens/search_user_page.dart';
import 'package:blood_donation/utils/colors.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);
  static const ROUTE_NAME = "/search";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border.all(color: CustomColors.dividerColor),
                borderRadius: BorderRadius.circular(16)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextField(hintText: "Location:"),
                CustomTextField(hintText: "Blood Group"),
                CustomTextField(hintText: "Distance(~)"),
                SizedBox(
                  height: 16,
                ),
                PrimaryButton(
                  text: "Search",
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => SearchUserPage(),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
