import 'package:flutter/material.dart';

class FloatingNavbarItem {
  final String? title;
  final IconData? icon;
  final Widget? customWidget;
  final Function? ontap;
  final String? img;

  FloatingNavbarItem({
    this.icon,
    this.title,
    this.customWidget,
    this.ontap,
    this.img,
  }) : assert(img != null || customWidget != null);
}
