import 'package:beautonomi/model/ui_model/home_screen_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class MainWorkWidget extends StatelessWidget {
  final HomeScreenModel? homeScreenModel;

  const MainWorkWidget({Key? key, this.homeScreenModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 184.h,
      width: MediaQuery.of(context).size.width * 0.8,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            homeScreenModel!.image,
            // "assets/Rectangle 13.png",
            fit: BoxFit.cover,
          )),
    );
  }
}
