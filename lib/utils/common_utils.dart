import 'package:flutter/material.dart';

import 'colors.dart';

enum Variant { success, error, warning }

class CommonUtils {
  static showSnackBar(BuildContext context, String msg,
      {String retryText = 'Retry', Function? retry, String? variant}) async {
    if (msg.isEmpty) return;
    Map<String, IconData> icons = {
      "success": Icons.done,
      "warning": Icons.warning_amber_outlined,
      "error": Icons.error_outline
    };

    Map<String, Color> colors = {
      "success": CustomColors.success,
      "warning": CustomColors.warning,
      "error": CustomColors.error
    };

    Color? cl = (variant != null && variant.isNotEmpty)
        ? colors[variant]
        : colors["warning"];

    IconData? ic = (variant != null && variant.isNotEmpty)
        ? icons[variant]
        : icons["warning"];

    var snackbar = SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Container(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          gradient: LinearGradient(
              stops: [0.015, 0.001], colors: [cl!, Colors.white]),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(ic, color: cl),
            Expanded(
              child: Text(
                msg,
                style: TextStyle(color: cl),
              ),
            ),
            Row(
              children: [
                (retry != null)
                    ? InkWell(
                        onTap: retry as void Function(),
                        child: Text(
                          retryText,
                          style: TextStyle(color: CustomColors.primaryColor),
                        ),
                      )
                    : Container(
                        height: 0,
                      ),
                IconButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    },
                    icon: Icon(Icons.close)),
              ],
            )
          ],
        ),
      ),
    );
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
          // SnackBar(
          //   content: Text(msg),
          //   duration: Duration(seconds: 4),
          //   action: retry != null
          //       ? SnackBarAction(
          //           label: retryText,
          //           onPressed: retry as void Function(),
          //         )
          //       : null,
          // ),
          snackbar);
  }
}

bool isValidEmail(mail) {
  RegExp regex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  return regex.hasMatch(mail);
}
