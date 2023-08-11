import 'package:beautonomi/data/repositories/crud_repository.dart';
import 'package:beautonomi/model/client.dart';
import 'package:beautonomi/utilites/constants.dart';
import 'package:beautonomi/utilites/user_details.dart';
import 'package:beautonomi/widget/show_services_bottom_sheet.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widget/custom_button.dart';
import '../../widget/custom_text.dart';
import '../model/baber.dart';

class TopSpecialistWidget extends StatelessWidget {
  const TopSpecialistWidget({
    super.key,
    required this.baber,
    required this.minCost,
    required this.distance,
  });
  final Baber baber;
  final double minCost;
  final double distance;
  

  @override
  Widget build(BuildContext context) {  
    settingser();
    Client client =user;     
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
                  baber.profileURL,
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
                                baber.saloon,
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
                    child: (baber.totalRating/baber.reviewCount) > 4
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
                          title: baber.name,
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
                                  title: "(${(baber.totalRating/baber.reviewCount)})",
                                  color: kBlackColor,
                                  fontSize: 8.h,
                                  fontWeight: FontWeight.w500,
                                  maxLines: 1,
                                ),
                              ],
                            ),
                          ),
                          CustomText(
                            title: baber.totalRating.toString(),
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
                    title: baber.bio,
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
                      _onButtonPressed(context, ShowServiceBottomSheetsWidget(baber: baber, user: client,));
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
  void _onButtonPressed(BuildContext context, Widget task) {
    showModalBottomSheet(
      backgroundColor: kMainColor,
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25),
      )),
      builder: (BuildContext _) {
        return Container(
          height: 400,
          margin: EdgeInsets.only(top: 10.h),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            color: kMainColor,
          ),
          child: task,
        );
      },
      isScrollControlled: true,
    );
  }
}
