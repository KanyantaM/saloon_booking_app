import 'package:flutter/material.dart';

class CustomParentWidget extends StatelessWidget {
  const CustomParentWidget({required this.child, Key? key}) : super(key: key);
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    late MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return MediaQuery(
        data: queryData.copyWith(textScaleFactor: 1.0),
        child: child ?? const SizedBox());
  }
}
