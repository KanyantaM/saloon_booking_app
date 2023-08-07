import 'package:beautonomi/model/ui_model/category_model.dart';
import 'package:beautonomi/model/ui_model/hair_cutting_model.dart';
import 'package:beautonomi/model/ui_model/home_screen_model.dart';
import 'package:beautonomi/utilites/constants.dart';
import 'package:beautonomi/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../provider/main_provider.dart';
import '../../widget/custom_button.dart';

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
