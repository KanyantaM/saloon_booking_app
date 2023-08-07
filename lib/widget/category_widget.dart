import 'package:beautonomi/utilites/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widget/custom_text.dart';
import '../model/category.dart';

class CategoryWidget extends StatelessWidget {
  final CateGory cateGoryModel;
  final int index;
  final bool isSelected;
  

  const CategoryWidget({Key? key, required this.cateGoryModel, required this.index, required this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isSelected?kPinkLightColor:kSecondaryColor,
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
                  cateGoryModel.image,
                  height: 45.h,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          CustomText(
            title: cateGoryModel.title,
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
