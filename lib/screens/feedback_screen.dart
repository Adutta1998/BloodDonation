import 'package:blood_app_nepal/model/donor.dart';
import 'package:blood_app_nepal/screens/loading.dart';
import 'package:blood_app_nepal/utils/custom_colors.dart';
import 'package:blood_app_nepal/utils/custom_styles.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:uuid/uuid.dart';

class FeedbackForm extends StatefulWidget {
  final String currentUserId;
  final String requestId;

  FeedbackForm(this.currentUserId, this.requestId);

  @override
  _FeedbackFormState createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  final bloodRequestRef = FirebaseFirestore.instance.collection('feedbacks');

  bool isRequesting = false;

  final _formKey = GlobalKey<FormState>();

  TextEditingController feedbackController = TextEditingController();

  requestBlood() async {
    // DocumentSnapshot doc = await bloodRequestRef.doc(Uuid().v4()).get();

    bloodRequestRef.doc(Uuid().v1()).set({
      "sender": widget.currentUserId,
      "requestId": widget.requestId,
      "feedback": feedbackController.text,
    });
  }

  handleBloodRequest() async {
    setState(() {
      isRequesting = true;
    });

    await requestBlood();

    setState(() {
      isRequesting = false;
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Feedback Form"),
        backgroundColor: CustomColors.blood,
      ),
      body: Builder(
        builder: (context) {
          return isRequesting
              ? circularLoading()
              : Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Form(
                    key: _formKey,
                    child: ListView(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: TextFormField(
                              minLines: 6,
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Feedback s required';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  fillColor: Colors.grey,
                                  hintText: "Your Feedback",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  )),
                              controller: feedbackController),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                              child: Text(
                                "Feedback",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.0),
                              ),
                              style: Styles.buttonstyle,
                              // color: Theme.of(context).primaryColor,
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  Scaffold.of(context).showSnackBar(SnackBar(
                                      content: Text('Processing Data')));
                                  handleBloodRequest();
                                }
                              }),
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
