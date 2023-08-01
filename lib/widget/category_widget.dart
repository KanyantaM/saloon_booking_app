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
import '../../widget/haid_cutting_service_widget.dart';
import '../../widget/main_work_widget.dart';
import '../../widget/top_special_list_widget.dart';

class CategoryWidget extends StatelessWidget {
  final CateGoryModel? cateGoryModel;

  const CategoryWidget({Key? key, this.cateGoryModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kPinkLightColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 76.h,
              width: 76.w,
              decoration: BoxDecoration(
                color: kMainColor,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Image.asset(
                  cateGoryModel!.image,
                  // "assets/Group 19134.png",
                  height: 45.h,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          CustomText(
            title: cateGoryModel!.title,
            // "Make-up",
            // "Main Branch",
            color: kBlackColor,
            fontSize: 12.h,
            fontWeight: FontWeight.w600,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
