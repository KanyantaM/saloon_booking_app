import 'package:beautonomi/model/ui_model/category_model.dart';
import 'package:beautonomi/utilites/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widget/custom_text.dart';

class HairCuttingServiceWidget extends StatelessWidget {
  final CateGoryModel? hairCuttingModel;

  const HairCuttingServiceWidget({Key? key, this.hairCuttingModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 150.h,
          width: 112.w,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                hairCuttingModel!.image,
                // "assets/Rectangle 139679.png",
                fit: BoxFit.cover,
              )),
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomText(
          title: hairCuttingModel!.title,
          color: kBlackColor,
          fontSize: 14.h,
          fontWeight: FontWeight.w600,
          maxLines: 2,
        ),
      ],
    );
  }
}
