import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utilites/constants.dart';
import '../../widget/custom_text.dart';
import '../../widget/custom_textfield.dart';
import '../screens/home_screen/category_screen.dart';
import 'custom_list_tile.dart';

class ExpandedListTileWidget extends StatelessWidget {
  ExpandedListTileWidget({
    super.key,
    required this.hairList,
    this.title,
    this.image,
  });

  final List hairList;
  String? title;

  final image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      // height: 300,
      color: kMainColor,
      child: ExpansionTileCard(
        elevation: 5,
        borderRadius: BorderRadius.circular(10),
        // contentPadding: EdgeInsets.zero,
        // contentPadding: EdgeInsets.symmetric(horizontal: 20),
        baseColor: Color(0xffFF0077),
        expandedColor: Color(0xffFF0479),
        leading: Container(
          height: 45.h,
          width: 45.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100), color: kMainColor),
          child: Center(
              child: Image.asset(
            image,
            // "assets/Group 19121.png",
            height: 22.h,
          )),
        ),
        title: CustomText(
          title: title,
          // "Facial",
          color: kMainColor,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        shadowColor: kBlackColor,
        animateTrailing: true,
        trailing: Image.asset(
          "assets/angle-bottom.png",
          height: 6.h,
          // color: kBlackColor,
        ),
        children: [
          ListView.builder(
            scrollDirection: Axis.vertical,
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 6),
            itemCount: hairList.length,
            itemBuilder: (context, index) {
              return CustomLisTileWidget(
                title: hairList[index],
              );
            },
          ),
        ],
      ),
    );
  }
}
