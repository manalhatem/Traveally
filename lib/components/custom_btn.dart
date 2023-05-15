import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:travel/components/style/size.dart';

import 'custom_text.dart';
import 'style/colors.dart';
class CustomBtn extends StatelessWidget {
  final void Function()? onTap;
  final bool colored;
  final String text;
  final Color textColor;
  const CustomBtn({Key? key, this.onTap, required this.colored, required this.text, required this.textColor}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:
        context.locale.languageCode=="ar"?
        EdgeInsets.symmetric(horizontal:width(context)*0.07,vertical: width(context)*0.03):
        EdgeInsets.symmetric(horizontal:width(context)*0.09,vertical: width(context)*0.04),
        decoration: BoxDecoration(
            color:colored? AppColors.mainColor:AppColors.whiteColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: AppColors.mainColor
            )
        ),
        child: CustomText(text: text, color: textColor, fontSize:
        context.locale.languageCode=="ar"?AppFonts.t4: AppFonts.t4),
      ),
    );
  }
}
