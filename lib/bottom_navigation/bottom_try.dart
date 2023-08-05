import 'package:beautonomi/screens/home_screen/category_screen.dart';
import 'package:beautonomi/screens/home_screen/home_screen.dart';
import 'package:beautonomi/screens/home_screen/my_booking_screen.dart';
import 'package:beautonomi/utilites/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hidable/hidable.dart';


class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({
    key,
  }) : super(key: key);

  //final String title;

  @override
  BottomNavigationScreenState createState() => BottomNavigationScreenState();
}

class BottomNavigationScreenState extends State<BottomNavigationScreen>
    with SingleTickerProviderStateMixin {
  late int currentPage;
  late TabController tabController;

  ScrollController hideScrollCtr = ScrollController();
  final List<Image> images = [
    Image.asset(
      "assets/Group 19135.png",
      height: 23.0,
      width: 24.0,
    ),
    Image.asset(
      "assets/ballot.png",
      height: 23.0,
      width: 24.0,
    ),
    Image.asset(
      "assets/apps.png",
      height: 24.0,
      width: 24.0,
    ),
    Image.asset(
      "assets/bell.png",
      height: 24.0,
      width: 24.0,
    ),
    Image.asset(
      "assets/user.png",
      height: 24.0,
      width: 24.0,
    ),
  ];

  // final List<Color> colors = [
  //   Color(0xff00b26b),
  //   Color(0xff00b26b),
  //   Color(0xff00b26b),
  // ];

  @override
  void initState() {
    currentPage = 0;
    tabController = TabController(length: 5, vsync: this);
    tabController.animation!.addListener(
      () {
        final value = tabController.animation!.value.round();
        if (value != currentPage && mounted) {
          changePage(value);
        }
      },
    );
    super.initState();
  }

  void changePage(int newPage) {
    setState(() {
      currentPage = newPage;
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Color unselectedColor = Color(0xff515b60);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 18.0),
        child: BottomBar(
          fit: StackFit.expand,
          icon: ((width, height) => const Center(
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: null,
                  icon: Icon(
                    Icons.arrow_upward_rounded,
                    color: unselectedColor,
                  ),
                ),
              )),
          borderRadius: BorderRadius.circular(500),
          duration: const Duration(seconds: 1),

          curve: Curves.bounceInOut,
          showIcon: false,
          width: MediaQuery.of(context).size.width * 0.9,
          barColor: const Color(0xff707070).withOpacity(0.6),
          start: 2,
          end: 0,
          bottom: 10.0,
          // MediaQuery.of(context).size.height,
          alignment: Alignment.bottomCenter,
          iconHeight: 35,
          iconWidth: 35,
          reverse: true,
          hideOnScroll: false,
          scrollOpposite: true,
          onBottomBarHidden: () {},
          onBottomBarShown: () {},

          body: (context, controller) => TabBarView(
              controller: tabController,
              dragStartBehavior: DragStartBehavior.start,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                HomeScreen(),
                MyBookingScreen(),
                CateGoryScreen(),
                HomeScreen(),
                HomeScreen(),
              ]),
          child: Hidable(
            preferredWidgetSize: Size(0, 75.h),
            controller: hideScrollCtr,
            child: TabBar(
              indicatorPadding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
              controller: tabController,
              indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide(color: kSecondaryColor, width: 2),
                  insets: EdgeInsets.fromLTRB(18, 0, 16, 15)),
              tabs: [
                SizedBox(
                  height: 75.h,
                  width: 40,
                  child: Center(
                      child: currentPage != 0
                          ? images[0]
                          : Image.asset(
                              "assets/Group 19135.png",
                              height: 23.0,
                              width: 24.0,
                            )),
                ),
                SizedBox(
                  height: 75.h,
                  width: 40,
                  child: Center(
                      child: currentPage != 1
                          ? images[1]
                          : Image.asset(
                              "assets/ballot.png",
                              height: 23.0,
                              width: 24.0,
                            )),
                ),
                SizedBox(
                  height: 75.h,
                  width: 40,
                  child: Center(
                      child: currentPage != 2
                          ? images[2]
                          : Image.asset(
                              "assets/apps.png",
                              height: 24.0,
                              width: 24.0,
                            )),
                ),
                SizedBox(
                  height: 75.h,
                  width: 40,
                  child: Center(
                      child: currentPage != 3
                          ? images[3]
                          : Image.asset(
                              "assets/bell.png",
                              height: 24.0,
                              width: 24.0,
                            )),
                ),
                SizedBox(
                  height: 75.h,
                  width: 40,
                  child: Center(
                    child: currentPage != 4
                        ? images[4]
                        : Image.asset(
                            "assets/user.png",
                            height: 24.0,
                            width: 24.0,
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
