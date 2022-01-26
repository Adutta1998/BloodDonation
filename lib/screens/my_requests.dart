import 'dart:math';

import 'package:blood_app_nepal/model/donor.dart';
import 'package:blood_app_nepal/utils/custom_colors.dart';
import 'package:blood_app_nepal/utils/custom_styles.dart';
import 'package:blood_app_nepal/utils/font_fams.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'loading.dart';

class MyRequests extends StatefulWidget {
  final Donor currentUser;
  MyRequests({this.currentUser}) : super();
  @override
  _MyRequestsState createState() => _MyRequestsState();
}

class _MyRequestsState extends State<MyRequests> {
  final bloodRequestRef = FirebaseFirestore.instance.collection('request');
  final feedbackRef = FirebaseFirestore.instance.collection('feedbacks');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Requests"),
        centerTitle: true,
        backgroundColor: CustomColors.blood,
      ),
      body: StreamBuilder(
        stream: bloodRequestRef.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          List<ShowRequests> allRequests = [];
          if (!snapshot.hasData) {
            return circularLoading();
          } else {
            snapshot.data.docs.forEach((element) {
              ShowRequests _shr = ShowRequests.fromDocument(
                element,
                feedbackRef: feedbackRef,
              );
              if (_shr.senderId == widget.currentUser.id) allRequests.add(_shr);
            });
          }

          return Container(
            height: MediaQuery.of(context).size.height,
            child: ListView(
              children: allRequests,
            ),
          );
        },
      ),
    );
  }
}

class ShowRequests extends StatefulWidget {
  final String location;
  final String bloodGroup;
  final String bloodAmount;
  final String phoneNumber;
  final String requiredDate;
  final String senderId;
  final String id;
  final CollectionReference<Map<String, dynamic>> feedbackRef;

  ShowRequests(
      {this.location,
      this.phoneNumber,
      this.bloodGroup,
      this.senderId,
      this.requiredDate,
      this.bloodAmount,
      this.id,
      this.feedbackRef});

  factory ShowRequests.fromDocument(DocumentSnapshot doc,
      {CollectionReference<Map<String, dynamic>> feedbackRef}) {
    return ShowRequests(
      location: doc['location'],
      bloodGroup: doc['bloodGroup'],
      phoneNumber: doc['phoneNumber'],
      requiredDate: doc['bloodNeededDate'],
      bloodAmount: doc['bloodAmount'],
      senderId: doc["sender"],
      id: doc.id,
      feedbackRef: feedbackRef,
    );
  }

  @override
  State<ShowRequests> createState() => _ShowRequestsState();
}

class _ShowRequestsState extends State<ShowRequests> {
  String feedbacks = "";
  @override
  void initState() {
    widget.feedbackRef.get().then((value) => {
          value.docs.forEach((element) {
            setState(() {
              feedbacks += element["feedback"].toString() + "\n";
            });
          })
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      children: [
        ListTile(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
              side: BorderSide(color: CustomColors.blood)),
          leading: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset("assets/img/logo.png"),
              Text("${widget.bloodGroup}")
            ],
          ),
          title: Text(
            "${widget.bloodAmount} pin blood needed",
            style: CustomFontStyles.name,
          ),
          subtitle: Padding(
            child: Text(
              "Feedbacks:\n" + feedbacks,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            padding: EdgeInsets.symmetric(vertical: 4),
          ),
        )
      ],
    );
  }
}
