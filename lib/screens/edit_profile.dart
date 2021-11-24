import 'package:blood_donation/custom_widgets/buttons.dart';
import 'package:blood_donation/custom_widgets/dropdown_field.dart';
import 'package:blood_donation/custom_widgets/text_fields.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  static const ROUTE_NAME = "/edit_profile";
  final List<String> bloodGroups = [
    "A+",
    "B+",
    "AB+",
    "O+",
    "A-",
    "B-",
    "AB-",
    "O-",
  ];
  final bloodGroupController = TextEditingController();
  EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.only(bottom: 8.0),
        child: PrimaryButton(
          text: "Save",
          icon: Icons.save_outlined,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CustomTextField(
                  hintText: "Name",
                ),
                const CustomTextField(
                  hintText: "Date of Birth",
                ),
                const CustomTextField(
                  hintText: "Mobile Number",
                ),
                const CustomTextField(
                  hintText: "Address",
                  isTextArea: true,
                ),
                DropDownField(
                    items: bloodGroups, hintText: "Select Blood Group")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
