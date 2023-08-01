import 'package:beautonomi/utilites/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../screens/home_screen/home_screen.dart';
import 'dart:ui' as ui;

class BottomBar extends StatefulWidget {
  BottomBar({
    required this.index,
  });

  final index;

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  List iconList = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];
  late int currentindex = widget.index;

  start() {
    setState(() {
      currentindex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kMainColor,
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: Container(
      //   margin: EdgeInsets.only(bottom: 60.h, right: 5),
      //   child: FloatingActionButton(
      //     elevation: 00,
      //     onPressed: () {
      //       Helper.toScreen(context, DinerDishesScreen());
      //     },
      //     child: Image.asset(
      //       "assets/search-heart 1.png",
      //       height: 25.h,
      //       color: kSecondaryColor,
      //     ),
      //   ),
      // ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          iconList[currentindex], //desti
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.only(bottom: 15),
              height: 80.h,
              margin: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: kBlackColor.withOpacity(0.47),
              ),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // home
                    Container(
                      padding: const EdgeInsets.only(
                        left: 25,
                        right: 25,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // 0
                          currentindex == 0
                              ? Container(
                                  margin: EdgeInsets.only(top: 12),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        "assets/Group 19135.png",
                                        height: 24.h,
                                      ),
                                      Image.asset(
                                        "assets/Path 44386.png",
                                        height: 24.h,
                                        width: 20,
                                      )
                                    ],
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      currentindex = 0;
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(top: 12),
                                    child: Image.asset(
                                      "assets/Group 19135.png",
                                      height: 24.h,
                                    ),
                                  ),
                                ),

                          // 1
                          currentindex == 1
                              ? Container(
                                  margin: EdgeInsets.only(top: 12),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        "assets/ballot.png",
                                        height: 24.h,
                                      ),
                                      Image.asset(
                                        "assets/Path 44386.png",
                                        height: 24.h,
                                        width: 20,
                                      )
                                    ],
                                  ),
                                )
                              : InkWell(
                                  onTap: () {
                                    setState(() {
                                      currentindex = 1;
                                    });
                                  },
                                  child: Image.asset(
                                    "assets/ballot.png",
                                    height: 24.h,
                                  ),
                                ),

                          // file

                          Image.asset(
                            "assets/Group 19135.png",
                            height: 24.h,
                          ),
                          // search

                          Image.asset(
                            "assets/Group 19135.png",
                            height: 24.h,
                          ),

                          // profile

                          Image.asset(
                            "assets/Group 19135.png",
                            height: 24.h,
                          ),

                          Image.asset(
                            "assets/Group 19135.png",
                            height: 24.h,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
