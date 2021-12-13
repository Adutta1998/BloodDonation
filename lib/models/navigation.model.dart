import 'package:flutter/material.dart';

class NavigationModel {
  final String label;
  final Icon icon;
  final Widget widget;

  NavigationModel(
      {required this.label, required this.icon, required this.widget});
}
