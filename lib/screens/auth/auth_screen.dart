import 'package:beautonomi/bottom_navigation/bottom_try.dart';
import 'package:beautonomi/screens/auth/log_in_bottomsheet.dart';
import 'package:beautonomi/screens/auth/sign_in_bottomsheet.dart';
import 'package:beautonomi/utilites/constants.dart';
import 'package:beautonomi/utilites/helper.dart';
import 'package:beautonomi/widget/custom_button.dart';
import 'package:beautonomi/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg.png"), fit: BoxFit.cover)),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // SizedBox(height: 20.h,),
              Container(
                margin: EdgeInsets.only(top: 77.h),
                child: CustomText(
                  title: "Skip",
                  color: kMainColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.end,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomButton(
                    btnHeight: 67.h,
                    btnColor: kSecondaryColor,
                    title: "Login",
                    onPressed: () {
                      _onButtonPressed(context, const LoginBottomsheet());
                    },
                    textColor: kMainColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    btnRadius: 10,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  InkWell(
                    onTap: () {
                      _onButtonPressed(context, const SigninBottomsheet());
                    },
                    child: Container(
                      height: 67.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: kMainColor),
                      ),
                      child: Center(
                        child: CustomText(
                          title: "Sign up",
                          color: kMainColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 23.h,
                  ),
                ],
              ),
            ],
          ),
        ),
        // child: Image.asset("assets/"),
      ),
    );
  }

  void _onButtonPressed(BuildContext context, Widget task) {
    showModalBottomSheet(
      backgroundColor: kMainColor,
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25),
      )),
      builder: (BuildContext _) {
        return Container(
          height: 400,
          margin: EdgeInsets.only(top: 10.h),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            color: kMainColor,
          ),
          child: task,
        );
      },
      isScrollControlled: true,
    );
  }
}
