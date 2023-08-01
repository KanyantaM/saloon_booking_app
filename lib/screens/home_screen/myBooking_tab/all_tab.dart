import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utilites/constants.dart';
import '../../../widget/custom_text.dart';

class AllTabScreen extends StatelessWidget {
  const AllTabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
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
            title: "No Bookings found!",
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: kBlackColor,
          ),
        ],
      ),
    );
  }
}
