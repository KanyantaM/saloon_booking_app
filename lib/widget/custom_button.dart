import 'package:flutter/material.dart';
import 'custom_inkwell_btn.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {this.onPressed,
      this.btnHeight,
      this.btnWidth,
      this.btnColor,
      this.btnBorderWidth,
      this.btnBorderColor,
      this.btnRadius,
      this.title,
      this.textColor,
      this.fontSize,
      this.fontWeight,
      this.elevation,
      Key? key})
      : super(key: key);
  final Function? onPressed;
  final double? btnHeight;
  final double? btnWidth;
  final Color? btnColor;
  final double? elevation;
  final double? btnBorderWidth;
  final Color? btnBorderColor;
  final double? btnRadius;
  final String? title;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return CustomInkWell(
      onTap: onPressed,
      child: Card(
        margin: EdgeInsets.zero,
        elevation: elevation ?? 3,
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(btnRadius == null ? 0 : btnRadius!)),
        child: Container(
          width: btnWidth ?? double.infinity,
          height: btnHeight ?? 44,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: btnColor,
              border: Border.all(
                  width: btnBorderWidth == null ? 0 : btnBorderWidth!,
                  color: btnBorderColor == null
                      ? Colors.transparent
                      : btnBorderColor!),
              borderRadius:
                  BorderRadius.circular(btnRadius == null ? 0 : btnRadius!)),
          child: CustomText(
            title: title,
            color: textColor,
            textAlign: TextAlign.center,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
