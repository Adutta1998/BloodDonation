import 'package:blood_donation/utils/colors.dart';
import 'package:blood_donation/utils/fonts.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {Key? key,
      required this.text,
      this.icon,
      this.onTap,
      this.isLoading = false})
      : super(key: key);

  final bool isLoading;
  final String text;
  final IconData? icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        width: double.infinity,
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: CustomColors.redAccent1,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon != null
                ? Icon(
                    icon,
                    color: Colors.white,
                  )
                : Container(),
            const SizedBox(
              width: 16.0,
            ),
            (!isLoading)
                ? Text(
                    text,
                    style: CustomFontStyle.buttonFontStyle,
                  )
                : CircularProgressIndicator(
                    color: CustomColors.baseColor,
                  )
          ],
        ),
      ),
    );
  }
}
