import 'package:blood_donation/utils/colors.dart';
import 'package:blood_donation/utils/fonts.dart';
import 'package:flutter/material.dart';

class DropDownField extends StatefulWidget {
  final List<String> items;
  final String hintText;

  const DropDownField({Key? key, required this.items, required this.hintText})
      : super(key: key);

  @override
  State<DropDownField> createState() => _DropDownFieldState();
}

class _DropDownFieldState extends State<DropDownField> {
  var group = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PopupMenuButton(
          itemBuilder: (context) {
            FocusScope.of(context).unfocus();
            return widget.items
                .map(
                  (e) => PopupMenuItem(
                    value: e,
                    child: Container(
                      width: 150,
                      child: Text(e),
                    ),
                  ),
                )
                .toList();
          },
          onSelected: (item) => setState(() {
            group = item.toString();
          }),
          offset: Offset(MediaQuery.of(context).size.width - 150, 96),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  widget.hintText,
                  style: CustomFontStyle.hintText,
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: CustomColors.baseColor,
                  border:
                      Border.all(color: CustomColors.dividerColor, width: 2),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text(group), Icon(Icons.arrow_drop_down)],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
