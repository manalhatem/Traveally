import 'package:flutter/material.dart';
import 'package:travel/components/style/colors.dart';
import 'package:travel/components/style/images.dart';
import 'package:travel/components/style/size.dart';

import 'custom_text.dart';

class CustomMainRow extends StatelessWidget {
  const CustomMainRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: EdgeInsets.only(
            right: width(context) * 0.05,
            left: width(context) * 0.05,
            top: width(context) * 0.02),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CustomText(
                    text: 'ally',
                    color: AppColors.mainColor,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                    fontSize: AppFonts.h1,
                    fontStyle: FontStyle.italic),
                CustomText(
                    text: 'Trave',
                    color: Colors.black,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                    fontSize: AppFonts.h1,
                    fontStyle: FontStyle.italic),
              ],
            ),
            const CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(AppImages.profile),
            )
          ],
        ),
      )
    ]);
  }
}
