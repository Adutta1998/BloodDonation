import 'package:flutter/material.dart';

import 'custom_colors.dart';

class Styles {
  static final buttonstyle = ElevatedButton.styleFrom(
    primary: CustomColors.blood,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
  );
}
