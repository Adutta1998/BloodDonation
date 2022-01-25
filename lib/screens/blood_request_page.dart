import 'package:blood_app_nepal/utils/custom_colors.dart';
import 'package:blood_app_nepal/utils/font_fams.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'loading.dart';

class ShowRequest extends StatefulWidget {
  final String location;
  ShowRequest({this.location}) : super();
  @override
  _ShowRequestState createState() => _ShowRequestState();
}

class _ShowRequestState extends State<ShowRequest> {
  final bloodRequestRef = FirebaseFirestore.instance.collection('request');

  @override
  Widget build(BuildContext context) {
    print("location:" + widget.location.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text("Blood Requests"),
        centerTitle: true,
        backgroundColor: CustomColors.blood,
      ),
      body: StreamBuilder(
        stream: bloodRequestRef.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return circularLoading();
          }
          List<ShowRequests> allRequests = [];
          snapshot.data.docs.forEach((doc) {
            if (doc["location"] == widget.location)
              allRequests.add(ShowRequests.fromDocument(doc));
          });

          return Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: allRequests,
            ),
          );
        },
      ),
    );
  }
}

class ShowRequests extends StatelessWidget {
  final String location;
  final String bloodGroup;
  final String bloodAmount;
  final String phoneNumber;
  final String requiredDate;

  ShowRequests({
    this.location,
    this.phoneNumber,
    this.bloodGroup,
    this.requiredDate,
    this.bloodAmount,
  });

  factory ShowRequests.fromDocument(DocumentSnapshot doc) {
    return ShowRequests(
      location: doc['location'],
      bloodGroup: doc['bloodGroup'],
      phoneNumber: doc['phoneNumber'],
      requiredDate: doc['bloodNeededDate'],
      bloodAmount: doc['bloodAmount'],
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.0)),
        padding: EdgeInsets.only(bottom: 10.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Stack(
                children: <Widget>[
                  Container(
                      height: 120.0,
                      width: 100.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Expanded(
                            flex: 3,
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/img/logo.png"),
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                              alignment: Alignment.center,
                              // color: CustomColors.blood,
                              child: Text(
                                bloodGroup,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                color: Colors.black87,
                              ),
                              child: Text(
                                location,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                            "Required in $requiredDate",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontFamily: "Gotham",
                                fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 230.0,
                              child: Text(
                                "Needed $bloodAmount pin of Blood gdhdd",
                                // overflow: TextOverflow.ellipsis,
                                softWrap: true,
                                style: CustomFontStyles.name,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.phone,
                              color: Colors.blue,
                            ),
                            InkWell(
                              onTap: () {
                                _launchURL("tel:$phoneNumber");
                              },
                              child: Text(
                                "Call Now",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Gotham",
                                    fontSize: 18.0),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
