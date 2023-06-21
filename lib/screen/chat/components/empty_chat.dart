import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../components/custom_text.dart';
import '../../../components/style/colors.dart';
import '../../../components/style/images.dart';
import '../../../components/style/size.dart';
import '../../../generated/locale_keys.g.dart';

class ChatEmpty extends StatelessWidget {
  final String img;
  final String text;
  const ChatEmpty({Key? key, required this.img, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(img,scale: 2),
          SizedBox(height: height(context)*0.022),
          CustomText(text: text,
              color: AppColors.mainColor, fontSize: AppFonts.t3),
          SizedBox(height: height(context)*0.1),
        ],
      ),
    );
  }
}