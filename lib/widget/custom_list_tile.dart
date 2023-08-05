import 'package:flutter/material.dart';

import '../../utilites/constants.dart';
import '../../widget/custom_text.dart';

class CustomLisTileWidget extends StatelessWidget {
  const CustomLisTileWidget({super.key, 
    this.title,
    this.onTap,
  });

  final dynamic title;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          color: kMainColor,
        ),
        ListTile(
          onTap: ()=>onTap,
          visualDensity: const VisualDensity(
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
      
      ],
    );
  }
}
