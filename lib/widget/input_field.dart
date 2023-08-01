import 'package:flutter/material.dart';

import '../utilites/constants.dart';
// prefix textfield

class InputField extends StatelessWidget {
  InputField({
    this.txt,
    this.number,
    this.obscureText,
    this.control,
    this.prefix,
    this.suffix,
  });

  final txt;
  final number;
  final control;
  Widget? prefix;
  Widget? suffix;
  bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: kMainColor, borderRadius: BorderRadius.circular(5)),
      child: TextFormField(
        controller: control,
        keyboardType: number,
        style: TextStyle(
          color: kBlackColor,
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
        // style: hintStyle,
        obscureText: obscureText ?? false,
        cursorColor: kBlackColor,
        decoration: InputDecoration(
          prefixIcon: prefix,
          suffixIcon: suffix,
          hintText: txt,
          hintStyle: const TextStyle(
              fontWeight: FontWeight.w400, fontSize: 16, color: kGreyColor),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: kGreyColor),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: kGreyColor),
          ),
          border: const UnderlineInputBorder(
            borderSide: BorderSide(color: kGreyColor),
          ),
        ),
      ),
    );
  }
}
