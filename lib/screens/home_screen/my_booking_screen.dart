import 'package:beautonomi/utilites/constants.dart';
import 'package:beautonomi/widget/custom_text.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'myBooking_tab/all_tab.dart';

class MyBookingScreen extends StatelessWidget {
  MyBookingScreen({Key? key}) : super(key: key);
  final List<String> tabs = ['All', 'Awaiting', 'Confirmed', 'Started'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kMainColor,
        title:const CustomText(
          title: "My Bookings",
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: kBlackColor,
        ),
        elevation: 2,
        centerTitle: true,
      ),
      body: DefaultTabController(
        length: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 20.h,
            ),
            Container(
              margin: EdgeInsets.only(left: 15.w),
              child: ButtonsTabBar(
                // Customize the appearance and behavior of the tab bar
                backgroundColor: kSecondaryColor,
                // borderWidth: 2,
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                unselectedBackgroundColor: kMainColor,
                // borderColor: Colors.black,
                labelStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelStyle: const TextStyle(
                  color: kGreyColor,
                  fontWeight: FontWeight.bold,
                ),
                // Add your tabs here
                tabs: [
                  Tab(
                    text: tabs[0],
                  ),
                  Tab(
                    text: tabs[1],
                  ),
                  Tab(
                    text: tabs[2],
                  ),
                  Tab(
                    text: tabs[3],
                  ),
                ],
              ),
            ),
            const Expanded(
              flex: 2,
              child: TabBarView(
                children: [
                  AllTabScreen(screen: 0,),
                  AllTabScreen(screen: 1,),
                  AllTabScreen(screen: 2,),
                  AllTabScreen(screen: 3,),
                ],
                // children: ...,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
