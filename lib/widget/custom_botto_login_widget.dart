import 'package:beautonomi/utilites/constants.dart';
import 'package:beautonomi/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_inkwell_btn.dart';


class CustomButtonLoginWidget extends StatelessWidget {
  CustomButtonLoginWidget({ 
    required this.icon,
    required this.title,
    this.onPressed, Key? key
  })
      : super(key: key);

  final String icon;
  final String title;
  Function? onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomInkWell(
      onTap: onPressed,
      child: Container(
        height: 40.h,
        width: MediaQuery.of(context).size.width * 0.27,
        decoration: BoxDecoration(
            color: kGreyLightColor,
            borderRadius: BorderRadius.circular(7),
            border: Border.all(color: kBorderColor)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              height: 15.h,
            ),
            SizedBox(
              width: 8.w,
            ),
            CustomText(
              title: title,
              // "Apple",
              color: kTextGreyColor,
              fontSize: 12.h,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}
