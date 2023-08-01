import 'package:beautonomi/bottom_navigation/bottom_try.dart';
import 'package:beautonomi/utilites/constants.dart';
import 'package:beautonomi/utilites/helper.dart';
import 'package:beautonomi/widget/custom_text.dart';
import 'package:beautonomi/widget/custom_textfield.dart';
import 'package:beautonomi/widget/input_field.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widget/custom_botto_login_widget.dart';
import '../../widget/custom_button.dart';

class SigninBottomsheet extends StatelessWidget {
  const SigninBottomsheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        SizedBox(
          height: 10.h,
        ),
        ListTile(
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back)),
          title: Center(
            child: Container(
              margin: const EdgeInsets.only(right: 40),
              child: CustomText(
                title: "Sign up",
                color: kBlackColor,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 29.h,
              ),
              CustomText(
                title: "Enter PHONE_NUMBER",
                color: kBlackColor,
                fontSize: 12.h,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomTextField(
                fillColor: kGreyLightColor,
                isFilled: true,
                hintText: "Type here",
                hintFontSize: 14.h,
                textFontSize: 14.h,
                cursorColor: kBlackColor,
                hintTextColor: kGreyDarkColor,
                prefixIcon: const CountryCodePicker(),
              ),
              SizedBox(
                height: 12.h,
              ),
              CustomTextField(
                fillColor: kGreyLightColor,
                isFilled: true,
                hintText: "Type here",
                hintFontSize: 14.h,
                textFontSize: 14.h,
                cursorColor: kBlackColor,
                hintTextColor: kGreyDarkColor,
                prefixIcon: const Icon( Icons.password),
              ),
              SizedBox(
                height: 25.h,
              ),
              CustomButton(
                btnHeight: 51.h,
                onPressed: () {
                  //TODO: sign up user
                  Helper.toScreen(context, BottomNavigationScreen());
                },
                btnColor: kSecondaryColor,
                title: "Sign up",
                textColor: kMainColor,
                fontWeight: FontWeight.w400,
                fontSize: 15,
                btnRadius: 10,
              ),
              SizedBox(
                height: 34.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.31,
                    child: const Divider(
                      color: kGreyDarkColor,
                    ),
                  ),
                  CustomText(
                    title: "or access quickly",
                    color: kGreyDarkColor,
                    fontSize: 10.h,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.31,
                    child: const Divider(
                      color: kGreyDarkColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 26.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  CustomButtonLoginWidget(
                    title: "Apple",
                    icon: "assets/_Group_2.png",
                  ),
                  CustomButtonLoginWidget(
                    title: "Facebook",
                    icon: "assets/facebook.png",
                  ),
                  CustomButtonLoginWidget(
                    title: "Google",
                    icon: "assets/google (1).png",
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
