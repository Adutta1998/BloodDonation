import 'package:blood_donation/utils/colors.dart';
import 'package:blood_donation/utils/fonts.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final bool? isTextArea;
  final bool? enabled;
  final bool? isPassword;
  final onChenge;
  const CustomTextField({
    Key? key,
    required this.hintText,
    this.controller,
    this.isTextArea,
    this.enabled,
    this.onChenge,
    this.isPassword,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            hintText,
            style: CustomFontStyle.hintText,
          ),
        ),
        TextField(
          enabled: enabled,
          obscureText: (isPassword != null) ? true : false,
          controller: controller,
          onChanged: onChenge ?? (a) {},
          cursorColor: CustomColors.textColor,
          keyboardType: (isTextArea != null)
              ? TextInputType.multiline
              : TextInputType.text,
          minLines: (isTextArea != null)
              ? 6
              : 1, //Normal textInputField will be displayed
          maxLines: (isTextArea != null) ? 10 : 1,
          decoration: InputDecoration(
            filled: true,
            disabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: CustomColors.dividerColor, width: 2),
              borderRadius: BorderRadius.circular(24),
            ),
            fillColor: CustomColors.baseColor,
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: CustomColors.dividerColor, width: 2),
              borderRadius: BorderRadius.circular(24),
            ),
            border: OutlineInputBorder(
              borderSide:
                  BorderSide(color: CustomColors.dividerColor, width: 2),
              borderRadius: BorderRadius.circular(24),
            ),
          ),
        ),
      ],
    );
  }
}
