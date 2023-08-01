import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utilites/constants.dart';
import '../../widget/custom_text.dart';
import '../../widget/custom_textfield.dart';
import '../../widget/expanded_list_tile_widget.dart';

class CustomLisTileWidget extends StatelessWidget {
  const CustomLisTileWidget({
    this.title,
  });

  final title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          visualDensity: VisualDensity(
            vertical: -4,
          ),
          title: CustomText(
            title: title,
            // "Blow Out",
            color: kMainColor,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        Divider(
          color: kMainColor,
        )
      ],
    );
  }
}
