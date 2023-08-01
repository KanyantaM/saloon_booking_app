import 'package:beautonomi/utilites/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widget/custom_text.dart';

class MainBranchWidget extends StatelessWidget {
  const MainBranchWidget({
    this.image,
    this.title,
  });

  final image;
  final title;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width*0.3,
      margin: EdgeInsets.only(left: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(5),
            height: 81.h,
            width: 81.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: kSecondaryColor, width: 2)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                image,
                // "assets/branch.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          CustomText(
            title: title,
            // "Main Branch",
            color: kBlackColor,
            fontSize: 11.h,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w500,
            maxLines: 1,
          )
        ],
      ),
    );
  }
}
