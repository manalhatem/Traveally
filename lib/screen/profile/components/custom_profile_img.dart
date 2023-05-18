import 'package:flutter/material.dart';
import '../../../components/custom_text.dart';
import '../../../components/style/colors.dart';
import '../../../components/style/images.dart';
import '../../../components/style/size.dart';
class CustomProfileImg extends StatelessWidget {
  final String backGroundImg;
  final String name;
  final String profileImg;

  const CustomProfileImg({Key? key, required this.backGroundImg, required this.name, required this.profileImg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        SizedBox(
          width: width(context),
          height: height(context)*0.33,
        ),
        Image.asset(backGroundImg, width: width(context),),
        Positioned(
          bottom: 0,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width(context)*0.04),
            child: Row(
              children: [
                 CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 58,
                    backgroundImage:AssetImage(profileImg),
                  ),
                ),
                SizedBox(width: width(context)*0.05),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height(context)*0.05),
                    CustomText(text:name,color: Colors.black,fontSize: AppFonts.t4, fontWeight: FontWeight.w500),
                  ],
                ),
                SizedBox(width: width(context)*0.18),
                Padding(
                  padding:EdgeInsets.only(top: width(context)*0.08),
                  child: Image.asset(AppImages.edit, scale: 2,),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
