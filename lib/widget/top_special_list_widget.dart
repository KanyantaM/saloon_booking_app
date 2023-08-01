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

class TopSpecialistWidget extends StatelessWidget {
  const TopSpecialistWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.h,
      width: MediaQuery.of(context).size.width * 0.75,
      child: Card(
        margin: EdgeInsets.zero,
        color: kGreyLightColor,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.75,
              height: 130.h,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.asset(
                  "assets/special_one.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(),
                Positioned(
                  top: -45.h,
                  left: 20,
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 77.h,
                            width: 77.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(color: kMainColor),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset(
                                "assets/Ellipse 16.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        right: 0,
                        bottom: 15,
                        child: Container(
                          height: 15.h,
                          width: 15.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: kGreenColor,
                            border: Border.all(color: kMainColor),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(),
                Positioned(
                  top: -20,
                  right: 20,
                  child: Container(
                    height: 35.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: kSecondaryColor,
                    ),
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/circle-star.png",
                          height: 15.h,
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        CustomText(
                          title: "Top Rated",
                          color: kMainColor,
                          fontSize: 10.h,
                          fontWeight: FontWeight.w500,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25.h,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ListTile(
                    title: Row(
                      children: [
                        CustomText(
                          title: "Jay Mendez",
                          color: kBlackColor,
                          fontSize: 12.h,
                          fontWeight: FontWeight.w600,
                          maxLines: 1,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Image.asset(
                          "assets/Path 44365.png",
                          height: 15.h,
                        ),
                      ],
                    ),
                    trailing: Container(
                      width: 100.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 35.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: kYellowColor,
                            ),
                            width: 55.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RatingBar.builder(
                                  initialRating: 3,
                                  minRating: 1,
                                  itemSize: 15.h,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 1,
                                  itemPadding: const EdgeInsets.symmetric(
                                      horizontal: 0.0),
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                                SizedBox(
                                  width: 3.w,
                                ),
                                CustomText(
                                  title: "(5.0)",
                                  color: kBlackColor,
                                  fontSize: 8.h,
                                  fontWeight: FontWeight.w500,
                                  maxLines: 1,
                                ),
                              ],
                            ),
                          ),
                          CustomText(
                            title: "5,721",
                            color: kBlackColor,
                            fontSize: 10.h,
                            fontWeight: FontWeight.w500,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                    contentPadding: EdgeInsets.zero,
                  ),
                  CustomText(
                    title:
                        "It is a long established fact that a reader will be distracted by the readable content of a page",
                    color: kTextDarkColor,
                    fontSize: 12.h,
                    fontWeight: FontWeight.w500,
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        CustomText(
                          title: "From",
                          color: kGreyDarkColor,
                          fontSize: 12.h,
                          fontWeight: FontWeight.w500,
                          maxLines: 1,
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        CustomText(
                          title: "R 100",
                          color: kBlackColor,
                          fontSize: 12.h,
                          fontWeight: FontWeight.w600,
                          maxLines: 1,
                        ),
                      ],
                    ),
                    contentPadding: EdgeInsets.zero,
                    trailing: Container(
                      width: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomText(
                            title: "2 KM",
                            color: kBlackColor,
                            fontSize: 12.h,
                            fontWeight: FontWeight.w600,
                            maxLines: 1,
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          CustomText(
                            title: "Away",
                            color: kGreyDarkColor,
                            fontSize: 12.h,
                            fontWeight: FontWeight.w500,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                  CustomButton(
                    btnHeight: 45.h,
                    btnColor: kSecondaryColor,
                    title: "Book Now",
                    onPressed: () {},
                    textColor: kMainColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    btnRadius: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
