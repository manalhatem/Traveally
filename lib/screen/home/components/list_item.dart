import 'package:flutter/material.dart';

import '../../../components/custom_text.dart';
import '../../../components/style/colors.dart';
import '../../../components/style/images.dart';
import '../../../components/style/size.dart';
import 'add_comment.dart';
class ListItem extends StatelessWidget {
  final String name;
  final String profileImg;
  final String location;
  final String img;
  final bool isFav;
  final int numFav;
  final int numComments;
  final bool isSave;
  final String desc;
  final TextEditingController controller;

  const ListItem({Key? key, required this.img, required this.name, required this.profileImg, required this.location, required this.isFav, required this.numFav, required this.numComments, required this.isSave, required this.desc, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width(context)*0.04),
          child: Row(
            children: [
               CircleAvatar(
                radius: 20,
                backgroundImage:AssetImage(profileImg),
              ),
              SizedBox(width: width(context)*0.014),
              CustomText(text: name, color: Colors.black,fontSize: AppFonts.t6,fontFamily: "Poppins", fontWeight: FontWeight.w300),
              const Spacer(),
              CustomText(text: location,color: AppColors.mainColor,fontSize: AppFonts.t6,fontFamily: "Poppins", fontWeight: FontWeight.w300),
              SizedBox(width: width(context)*0.014),
              Image.asset(AppImages.location, scale: 4.3),
            ],
          ),
        ),
        SizedBox(height: height(context)*0.012,),
        Container(
          width:width(context),
          height:height(context)*0.3,
          decoration: BoxDecoration(
            image:  DecorationImage(
                image: AssetImage(img),
                fit: BoxFit.fill
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width(context)*0.04,vertical:width(context)*0.01),
          child: Row(
            children: [
              InkWell(
                  onTap:(){},
                  child: Image.asset(isSave? "assets/images/eva_bookmark-fill.png":"assets/images/save.png",scale: 3,)),
              const Spacer(),
              Column(
                children: [
                  InkWell(
                      onTap:(){},
                      child: Image.asset( "assets/images/message-circle.png",scale: 3,)),
                  SizedBox(height: width(context)*0.005),
                  CustomText(text: numComments.toString(), fontSize: AppFonts.t8)
                ],
              ),
              SizedBox(width: width(context)*0.02),
              Column(
                children: [
                  InkWell(
                      onTap:(){},
                      child: Image.asset(isFav? "assets/images/heart.png":"assets/images/heartgray.png",scale: 3,)),
                  SizedBox(height: width(context)*0.005),
                  CustomText(text:numFav.toString(), fontSize: AppFonts.t8)
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: height(context)*0.01),
        Align(
            alignment : AlignmentDirectional.topStart,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: width(context)*0.02),
              child: CustomText(text: desc,textAlign: TextAlign.start),
            )),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width(context)*0.02),
          child: AddComment(controller: controller),
        ),
        SizedBox(height: height(context)*0.03,)

      ],
    );
  }
}
