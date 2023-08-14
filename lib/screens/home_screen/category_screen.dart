import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utilites/constants.dart';
import '../../widget/custom_text.dart';
import '../../widget/custom_textfield.dart';
import '../../widget/expanded_list_tile_widget.dart';

class CateGoryScreen extends StatefulWidget {
  const CateGoryScreen({Key? key}) : super(key: key);

  @override
  State<CateGoryScreen> createState() => _CateGoryScreenState();
}

class _CateGoryScreenState extends State<CateGoryScreen> {
  List hairList = ["Blow Out", "Hair Coloring", "Hair Treatment", "Hair Relax"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainColor,
        title: const CustomText(
          title: "Category",
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: kBlackColor,
        ),
        elevation: 2,
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            SizedBox(
              height: 23.h,
            ),
            Container(
              height: 60.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: kGreyLightColor),
              child: CustomTextField(
                hintText: "Search for Saloon Service",
                hintFontSize: 14.h,
                textFontSize: 14.h,
                cursorColor: kBlackColor,
                hintTextColor: kGreyDarkColor,
                prefixIcon: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/search.png",
                      height: 20.52.h,
                    ),
                  ],
                ),
                suffixIcon: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/filter (1).png",
                      height: 20.52.h,
                    ),
                  ],
                ),
              ),
            ),
            ExpandedListTileWidget(
                title: "Hair",
                image: "assets/Group 19121.png",
                hairList: hairList),
            ExpandedListTileWidget(
                title: "Nail",
                image: "assets/Path 44362.png",
                hairList: hairList),
            ExpandedListTileWidget(
                title: "Facial",
                image: "assets/Group 19126.png",
                hairList: hairList),
            ExpandedListTileWidget(
                title: "Eyebrow",
                image: "assets/Group 19128.png",
                hairList: hairList),
            ExpandedListTileWidget(
                title: "Massage",
                image: "assets/Group 19127.png",
                hairList: hairList),
            ExpandedListTileWidget(
                title: "Beard",
                image: "assets/Path 44360.png",
                hairList: hairList),
          ],
        ),
      ),
    );
  }
}
