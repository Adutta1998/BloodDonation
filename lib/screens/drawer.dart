import 'package:blood_app_nepal/model/donor.dart';
import 'package:blood_app_nepal/screens/about.dart';
import 'package:blood_app_nepal/screens/blood_request_page.dart';
import 'package:blood_app_nepal/screens/my_requests.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MainDrawer extends StatefulWidget {
  final GoogleSignIn googleSignIn;
  final Donor currentUser;
  MainDrawer({this.googleSignIn, this.currentUser});

  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    print(widget.currentUser.location);
    return Drawer(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Image.asset('assets/img/logo.png'),
            ),
            ListTile(
              title: Text(
                'Welcome',
                style: TextStyle(
                    color: Colors.black, fontFamily: "Gotham", fontSize: 18.0),
              ),
              leading: Icon(
                Icons.home,
                color: Colors.red,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(
                'Blood Requests',
                style: TextStyle(
                    color: Colors.black, fontFamily: "Gotham", fontSize: 16.0),
              ),
              leading: Icon(
                Icons.comment,
                color: Colors.red,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShowRequest(
                      currentUser: widget.currentUser,
                    ),
                  ),
                );
              },
            ),
            ListTile(
              title: Text(
                'My Requests',
                style: TextStyle(
                    color: Colors.black, fontFamily: "Gotham", fontSize: 16.0),
              ),
              leading: Icon(
                Icons.book,
                color: Colors.red,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyRequests(
                      currentUser: widget.currentUser,
                    ),
                  ),
                );
              },
            ),
            ListTile(
              title: Text(
                'Sign out',
                style: TextStyle(
                    color: Colors.black, fontFamily: "Gotham", fontSize: 16.0),
              ),
              leading: Icon(
                Icons.lock_outline,
                color: Colors.red,
              ),
              onTap: () {
                widget.googleSignIn.signOut();
              },
            ),
            ListTile(
              title: Text(
                'About Us',
                style: TextStyle(
                    color: Colors.black, fontFamily: "Gotham", fontSize: 16.0),
              ),
              leading: Icon(
                Icons.help,
                color: Colors.red,
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutUs()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
