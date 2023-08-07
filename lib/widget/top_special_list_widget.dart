import 'package:beautonomi/utilites/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widget/custom_button.dart';
import '../../widget/custom_text.dart';

class TopSpecialistWidget extends StatelessWidget {
  const TopSpecialistWidget({
    super.key,
    required this.profileImage,
    required this.biography,
    required this.rating,
    required this.totalRating,
    required this.saloonImage,
    required this.name,
    required this.minCost,
    required this.distance,
  });
  final String profileImage;
  final String biography;
  final double rating;
  final int totalRating;
  final String saloonImage;
  final String name;
  final double minCost;
  final double distance;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400.h,
      width: MediaQuery.of(context).size.width * 0.75,
      child: Card(
        margin: EdgeInsets.zero,
        color: kGreyLightColor,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.75,
              height: 130.h,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.network(
                  profileImage,
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
                              child: Image.network(
                                saloonImage,
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
                    child: rating > 4
                        ? Row(
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
                          )
                        : null,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25.h,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ListTile(
                    title: Row(
                      children: [
                        CustomText(
                          title: name,
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
                    trailing: SizedBox(
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
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                SizedBox(
                                  width: 3.w,
                                ),
                                CustomText(
                                  title: "($rating)",
                                  color: kBlackColor,
                                  fontSize: 8.h,
                                  fontWeight: FontWeight.w500,
                                  maxLines: 1,
                                ),
                              ],
                            ),
                          ),
                          CustomText(
                            title: totalRating.toString(),
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
                    title: biography,
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
                          title: 'K $minCost',
                          color: kBlackColor,
                          fontSize: 12.h,
                          fontWeight: FontWeight.w600,
                          maxLines: 1,
                        ),
                      ],
                    ),
                    contentPadding: EdgeInsets.zero,
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomText(
                            title: '$distance km',
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
                    onPressed: () {
                      //TODO: go to booking screen
                    },
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
