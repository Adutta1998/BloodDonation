import 'package:blood_app_nepal/utils/font_fams.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Us"),
      ),
      body: Padding(
        padding: EdgeInsets.all(40.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text(
                "This App is hapily developed by:",
                style: TextStyle(
                    fontFamily: "Gotham",
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              _userCard(
                  "Rimpi Saha",
                  "https://firebasestorage.googleapis.com/v0/b/blooddonorkgec.appspot.com/o/rimpi-min.jpg?alt=media&token=5023af02-bc92-4d2f-abd1-e46edfaf2e1b",
                  "https://www.facebook.com/misti.saha.98837399",
                  "",
                  "saharimpi72@gmail.com",
                  "6296711830"),
              _userCard(
                "Purnima Shaw",
                "https://firebasestorage.googleapis.com/v0/b/blooddonorkgec.appspot.com/o/121361363_1237622856630830_5245950799717649457_n.jpg?alt=media&token=ff9103cc-d150-483e-90b6-76a2094dfbbb",
                "https://www.facebook.com/profile.php?id=100011493818235",
                "",
                "purnimashaw15@gmail.com",
                "8016941498",
              ),
              _userCard(
                  "Avinaba Dutta",
                  "https://firebasestorage.googleapis.com/v0/b/blooddonorkgec.appspot.com/o/AD.jpg?alt=media&token=42b9238e-947c-445d-ab2a-fc7c83dbe9ae",
                  "https://www.facebook.com/a.98.dutta",
                  "avinabad98@gmail.com",
                  "8016941498",
                  ""),
              SizedBox(
                height: 8.0,
              ),
              ElevatedButton(
                onPressed: () {
                  showLicensePage(
                    context: context,
                    applicationName: "BloodFriend",
                    applicationVersion: "1.0.0",
                    applicationIcon: Image.asset("assets/img/logo.png"),
                  );
                },
                child: Text(
                  "Licence",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _userCard(String name, String image, String fb, String linkedin,
      String email, String phone) {
    return Card(
      color: Colors.white,
      child: Container(
        margin: EdgeInsets.only(top: 10.0),
        width: double.maxFinite * .8,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(96.0),
              child: Image.network(
                image,
                width: 96,
                errorBuilder: (a, b, c) => Icon(Icons.broken_image),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              name,
              style: CustomFontStyles.name,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () async {
                    if (await canLaunch(fb)) {
                      await launch(fb);
                    } else {
                      throw "Could not launch $fb";
                    }
                  },
                  icon: Icon(
                    Icons.facebook,
                    color: Colors.blue,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    if (await canLaunch(email)) {
                      await launch("mailto:$email");
                    } else {
                      throw "Could not launch $email";
                    }
                  },
                  icon: Icon(
                    Icons.email,
                    color: Colors.red.shade600,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    if (await canLaunch(fb)) {
                      await launch("tel://" + phone);
                    } else {
                      throw "Could not launch $phone";
                    }
                  },
                  icon: Icon(
                    Icons.phone,
                    color: Colors.blue.shade800,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    if (await canLaunch(linkedin)) {
                      await launch(linkedin);
                    } else {
                      throw "Could not launch $linkedin";
                    }
                  },
                  icon: Icon(
                    Icons.link,
                    color: Colors.green.shade300,
                  ),
                )
              ],
            )
          ],
          mainAxisSize: MainAxisSize.min,
        ),
      ),
    );
  }
}
