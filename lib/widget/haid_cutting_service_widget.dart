import 'package:beautonomi/model/category_model.dart';
import 'package:beautonomi/model/hair_cutting_model.dart';
import 'package:beautonomi/model/home_screen_model.dart';
import 'package:beautonomi/utilites/constants.dart';
import 'package:beautonomi/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../provider/main_provider.dart';
import '../../widget/custom_button.dart';
import '../../widget/custom_text.dart';
import '../../widget/main_work_widget.dart';

class HairCuttingServiceWidget extends StatelessWidget {
  final HairCuttingModel? hairCuttingModel;

  const HairCuttingServiceWidget({Key? key, this.hairCuttingModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
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
