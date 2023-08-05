import 'package:beautonomi/model/category_model.dart';
import 'package:beautonomi/model/hair_cutting_model.dart';
import 'package:beautonomi/model/home_screen_model.dart';
import 'package:beautonomi/utilites/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../widget/category_widget.dart';
import '../../widget/custom_text.dart';
import '../../widget/haid_cutting_service_widget.dart';
import '../../widget/main_branch_widget.dart';
import '../../widget/main_work_widget.dart';
import '../../widget/top_special_list_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController controller = PageController();
  ScrollController hideScrollCtr = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Container(
            margin: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Image.asset(
                  "assets/marker.png",
                  height: 23.43.h,
                ),
                SizedBox(
                  width: 20.w,
                ),
                Image.asset(
                  "assets/angle-bottom.png",
                  height: 5.43.h,
                ),
                SizedBox(
                  width: 20.w,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: CustomText(
                    title: "123 Forest Drive, Cape Town",
                    color: kMainColor,
                    fontSize: 14.h,
                    fontWeight: FontWeight.w500,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ),
          elevation: 2,
          backgroundColor: kSecondaryColor,
          toolbarHeight: 80.h,
          bottom: PreferredSize(
            preferredSize: Size(0, 90.h),
            child: Container(
              color: kMainColor,
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                // mainAxisAlignment: MainAxisAlignment.s,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          "assets/logo (1).png",
                          height: 35.h,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                "assets/search.png",
                                height: 22.h,
                                color: kSecondaryColor,
                              ),
                              const Icon(
                                Icons.favorite,
                                size: 24,
                                color: kSecondaryColor,
                              ),
                              const Icon(
                                Icons.message,
                                size: 24,
                                color: kSecondaryColor,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        body: Container(
          child: ListView(
            padding: EdgeInsets.zero,
            controller: hideScrollCtr,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: const [
                  MainBranchWidget(
                    title: "Main Branch",
                    image: "assets/branch.png",
                  ),
                  MainBranchWidget(
                    image: "assets/shop.png",
                    title: "Work Germany",
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                height: 190.h,
                child: Stack(
                  children: [
                    PageView.builder(
                      controller: controller,
                      scrollDirection: Axis.horizontal,
                      physics: const ClampingScrollPhysics(),
                      // shrinkWrap: true,
                      // padding: EdgeInsets.symmetric(horizontal: 6),
                      itemCount: homeList.length,
                      itemBuilder: (context, index) {
                        return Container(
                            margin: const EdgeInsets.only(left: 15),
                            child: MainWorkWidget(
                              homeScreenModel: homeList[index],
                            ));
                      },
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 15),
                            child: SmoothPageIndicator(
                              controller: controller, // PageController
                              count: homeList.length,
                              effect: const WormEffect(
                                  dotHeight: 12,
                                  dotWidth: 12,
                                  dotColor: kGreyColor,
                                  activeDotColor:
                                      kSecondaryColor), // your preferred effect
                              // onDotClicked: (index){
                              //
                              // }
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 23.h,
              ),
              // Container(
              //   margin: EdgeInsets.symmetric(horizontal: 20),
              //   child: CustomTextField(
              //     fillColor: kGreyLightColor,
              //     isFilled: true,
              //     hintText: "Search Service Provider",
              //     hintFontSize: 14.h,
              //     textFontSize: 14.h,
              //     cursorColor: kBlackColor,
              //     hintTextColor: kGreyDarkColor,
              //     suffixIcon: Column(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         Image.asset(
              //           "assets/search.png",
              //           height: 20.52.h,
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 20.h,
              // ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomText(
                  title: "Category",
                  // "Main Branch",
                  color: kBlackColor,
                  fontSize: 17.h,
                  fontWeight: FontWeight.w600,
                  maxLines: 1,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                height: 150.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  itemCount: categoryList.length,
                  itemBuilder: (context, index) {
                    return Container(
                        margin: const EdgeInsets.only(left: 15),
                        child: CategoryWidget(
                          cateGoryModel: category[index],
                        ));
                  },
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomText(
                  title: "Top Specialist",
                  // "Main Branch",
                  color: kBlackColor,
                  fontSize: 17.h,
                  fontWeight: FontWeight.w600,
                  maxLines: 1,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                height: 380.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  itemCount: categoryList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(left: 15),
                      child: const TopSpecialistWidget(),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomText(
                  title: "Hair Cutting Services",
                  // "Main Branch",
                  color: kBlackColor,
                  fontSize: 17.h,
                  fontWeight: FontWeight.w600,
                  maxLines: 1,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                height: 220.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  itemCount: hairCuttingList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(left: 15),
                      child: HairCuttingServiceWidget(
                        hairCuttingModel: hairCutting[index],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}




