import 'package:blood_donation/custom_widgets/text_fields.dart';
import 'package:flutter/material.dart';

class DropDownField extends StatelessWidget {
  final TextEditingController controller;
  final List<String> items;
  bool enabled = false;
  DropDownField({Key? key, required this.controller, required this.items})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PopupMenuButton(
          itemBuilder: (context) {
            return items
                .map((e) => PopupMenuItem(
                      value: e,
                      child: Container(
                        width: 150,
                        child: Text(e),
                      ),
                    ))
                .toList();
          },
          onSelected: (val) {
            enabled = true;
            controller.text = val.toString();
            FocusScope.of(context).requestFocus();
          },
          offset: Offset(MediaQuery.of(context).size.width - 150, 96),
          child: CustomTextField(
            hintText: "Blood Group",
            enabled: enabled,
            controller: controller,
          ),
        )
      ],
    );
  }
}
