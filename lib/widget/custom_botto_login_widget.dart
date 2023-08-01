import 'package:beautonomi/bottom_navigation/bottom_try.dart';
import 'package:beautonomi/utilites/constants.dart';
import 'package:beautonomi/utilites/helper.dart';
import 'package:beautonomi/widget/custom_text.dart';
import 'package:beautonomi/widget/custom_textfield.dart';
import 'package:beautonomi/widget/input_field.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widget/custom_button.dart';

class CustomButtonLoginWidget extends StatelessWidget {
  const CustomButtonLoginWidget({
    this.icon,
    this.title,
  });

  final icon;
  final title;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
