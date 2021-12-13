import 'package:blood_donation/api_clients/api_client.dart';
import 'package:blood_donation/screens/profile_screen.dart';
import 'package:blood_donation/utils/colors.dart';
import 'package:blood_donation/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:supabase/supabase.dart';

class HomeScreen extends StatelessWidget {
  static const ROUTE_NAME = "/";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var api = BDApi();
    User user = api.getLoggedInUser();
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, ProfileScreen.ROUTE_NAME);
                },
                child: headerView(context),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "New Requests",
                    style: CustomFontStyle.hintText,
                  ),
                  Row(
                    children: [
                      Text(
                        "All",
                        style: CustomFontStyle.hintText,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.refresh_outlined),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 16,
              ),
              newRequestWidget(),
            ],
          ),
        ),
      ),
    );
  }

  headerView(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.network("https://i.pravatar.cc/64"),
        ),
        SizedBox(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Avinaba Dutta",
              style: CustomFontStyle.bolderFontStyle,
            ),
            Text(
              "duttaavinaba98@gmail.com",
            )
          ],
        ),
        Expanded(child: Container()),
        IconButton(
            onPressed: () {
              showDialog(context: context, builder: (_) => moreDialog());
            },
            icon: Icon(Icons.more_vert))
      ],
    );
  }

  newRequestWidget() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      //padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: ListView.builder(
        itemCount: 5,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (_, i) {
          return ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network("https://i.pravatar.cc/32"),
            ),
            title: Text("User: $i"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [Icon(Icons.done), Icon(Icons.close)],
            ),
          );
        },
      ),
    );
  }

  moreDialog() {
    return SimpleDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      children: [
        ListTile(
          leading: Icon(Icons.settings),
          title: Text(
            "Settings",
            style: CustomFontStyle.hintText,
          ),
        ),
        ListTile(
          leading: Icon(Icons.person_add),
          title: Text(
            "Invite",
            style: CustomFontStyle.hintText,
          ),
        ),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text(
            "Logout",
            style: CustomFontStyle.hintText,
          ),
        ),
      ],
    );
  }
}
