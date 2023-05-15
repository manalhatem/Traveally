import 'package:flutter/material.dart';

import 'custom_text.dart';
import 'style/colors.dart';
import 'style/size.dart';
class CustomAuthLogin extends StatelessWidget {
  final void Function()? ontap;
  final String text;
  final String img;
  const CustomAuthLogin({Key? key, this.ontap, required this.text, required this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: width(context)*0.7,
        padding: EdgeInsets.symmetric(horizontal: width(context)*0.12,vertical: width(context)*0.02),
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(10)
        ),
        child:
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomText(text: text,
                color: AppColors.grayCol, fontFamily: "Poppins"),
           const Spacer(),
            Image.asset(img, scale: 4),
          ],
        ),
      ),
    );
  }
}
