import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({this.icon, this.height, this.color, Key? key}) : super(key: key);
  final String? icon;
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      icon ?? "",
      height: height ?? 20,
      color: color ?? Colors.transparent,
    );
  }
}
