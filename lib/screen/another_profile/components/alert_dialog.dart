import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../components/custom_text.dart';
import '../../../components/style/colors.dart';
import '../../../components/style/size.dart';
import '../../../generated/locale_keys.g.dart';
class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      titlePadding: EdgeInsets.only(top: height(context) * 0.04),
      title: Center(
          child: CustomText(
              text: LocaleKeys.AddNew.tr(),
              color: AppColors.mainColor,
              fontWeight: FontWeight.w500,
              fontSize: AppFonts.t3)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(color: AppColors.mainColor),
          SizedBox(height: height(context) * 0.02),
          CustomText(
              text: LocaleKeys.Posts.tr(),
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: AppFonts.t5),
          SizedBox(height: height(context) * 0.015,),
          const Divider(color: Colors.black),
          SizedBox(height: height(context) * 0.015,),
          CustomText(
              text: LocaleKeys.Visited.tr(),
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: AppFonts.t5),
          SizedBox(height: height(context) * 0.015,),
          const Divider(color: Colors.black),
          SizedBox(height: height(context) * 0.015,),
          CustomText(
              text: LocaleKeys.Destination.tr(),
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: AppFonts.t5),
        ],
      ),

    );
  }
}
