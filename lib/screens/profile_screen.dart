import 'package:blood_donation/utils/colors.dart';
import 'package:blood_donation/utils/fonts.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static const ROUTE_NAME = "/profile";
  ProfileScreen({Key? key}) : super(key: key);
  late double width;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.baseColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Profile",
          style: CustomFontStyle.hintText,
        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 16,
                ),
                headerImageWidget(),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Rimpi Saha",
                  style: CustomFontStyle.bolderFontStyle,
                ),
                SizedBox(
                  height: 24,
                ),
                detailsPanel()
              ],
            ),
          ),
        ],
      ),
    );
  }

  headerImageWidget() {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(64),
            child: Image.network("https://i.pravatar.cc/128")),
        Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: CustomColors.redAccent1,
            border: Border.all(width: 1, color: Colors.black),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Icon(
            Icons.camera_enhance_outlined,
            size: 25,
            color: Colors.white,
          ),
        )
      ],
    );
  }

  detailsPanel() {
    return Container(
      width: width - 32,
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Icon(
              Icons.bloodtype,
              color: CustomColors.redAccent1,
            ),
            title: Text(
              "B+",
              style: CustomFontStyle.bolderFontStyle,
            ),
            subtitle: Text(
              "Blood Group",
              style: CustomFontStyle.subtitleFontStyle,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.calendar_today_outlined,
              color: CustomColors.redAccent1,
            ),
            title: Text(
              "15-12-1998",
              style: CustomFontStyle.bolderFontStyle,
            ),
            subtitle: Text(
              "Date of Birth",
              style: CustomFontStyle.subtitleFontStyle,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.email_outlined,
              color: CustomColors.redAccent1,
            ),
            title: Text(
              "saharimpi72@gmail.com",
              style: CustomFontStyle.bolderFontStyle,
            ),
            subtitle: Text(
              "Email",
              style: CustomFontStyle.subtitleFontStyle,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.phone,
              color: CustomColors.redAccent1,
            ),
            title: Text(
              "6296711830",
              style: CustomFontStyle.bolderFontStyle,
            ),
            subtitle: Text(
              "Phone",
              style: CustomFontStyle.subtitleFontStyle,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.pin_drop,
              color: CustomColors.redAccent1,
            ),
            title: Text(
              '''Hedayer Nagar,\njateswar,alipurduar,\nPin : 735216''',
              style: CustomFontStyle.bolderFontStyle,
            ),
            subtitle: Text(
              "Address",
              style: CustomFontStyle.subtitleFontStyle,
            ),
          ),
        ],
      ),
    );
  }
}
