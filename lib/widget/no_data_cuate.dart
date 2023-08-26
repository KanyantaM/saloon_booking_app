import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utilites/constants.dart';
import '../../../widget/custom_text.dart';

class NoDataCuate extends StatelessWidget {
  const NoDataCuate({
    super.key,
    required this.issue,
  });
  final String issue;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/No data-cuate.png",
          height: 177.h,
        ),
        SizedBox(
          height: 30.h,
        ),
        CustomText(
          title: issue,
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: kBlackColor,
        ),
      ],
    );
  }
}
