import 'package:blood_donation/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomFontStyle {
  static TextStyle bolderFontStyle = GoogleFonts.lato(
    textStyle: TextStyle(
        color: CustomColors.primaryColor,
        fontSize: 24,
        fontWeight: FontWeight.w700),
  );

  static TextStyle subtitleFontStyle = GoogleFonts.robotoSlab(
    letterSpacing: 1.12,
    fontSize: 16,
    textStyle: const TextStyle(
      color: Colors.black,
    ),
  );

  static TextStyle buttonFontStyle = GoogleFonts.lato(
    textStyle: const TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.w700,
    ),
  );

  static TextStyle hintText = GoogleFonts.lato(
    textStyle: TextStyle(
      color: CustomColors.textColor,
      fontSize: 16,
      fontWeight: FontWeight.w700,
    ),
  );
}
