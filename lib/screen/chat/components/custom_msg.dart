import 'dart:io';
import 'package:bubble/bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../components/custom_text.dart';
import '../../../components/style/colors.dart';
import '../../../components/style/size.dart';
import '../model/message_model.dart';

class CustomMessage extends StatelessWidget {
  final bool isSender;
  final String msg;
  final Timestamp? time;

  CustomMessage(
      {Key? key,
        required this.isSender,
        required this.msg,
         this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime? date = time == null ? DateTime.now() : time!.toDate();
    return Column(
      mainAxisAlignment:
      isSender == true ? MainAxisAlignment.start : MainAxisAlignment.end,
      crossAxisAlignment:
      isSender == true ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: [
        context.locale.languageCode == "ar"
           ? Bubble(
          elevation: 0,
          padding:
          BubbleEdges.symmetric(vertical: width(context) * 0.025),
          margin: BubbleEdges.only(
              top: height(context) * 0.02,
              bottom: height(context) * 0.006),
          //  alignment:isSender? Alignment.topRight:Alignment.topLeft,
          radius: const Radius.circular(10),
          nip: isSender == true
              ? BubbleNip.rightTop
              : BubbleNip.leftTop,
          nipWidth: 2,
          nipHeight: 8,
          color: isSender == true ? AppColors.mainColor : AppColors.resCol,
          child: CustomText(
              text: msg,
              fontSize: AppFonts.t6,
              color: isSender
                  ? AppColors.whiteColor
                  : AppColors.grayCol),
        )
            : Bubble(
          elevation: 0,
          padding:
          BubbleEdges.symmetric(vertical: width(context) * 0.025),
          margin: BubbleEdges.only(
              top: height(context) * 0.02,
              bottom: height(context) * 0.006),
          // alignment: isSender? Alignment.topLeft:Alignment.topRight,
          nipWidth: 2,
          nipHeight: 10,
          radius: const Radius.circular(10),
          nip: isSender == true
              ? BubbleNip.leftTop
              : BubbleNip.rightTop,
          color: isSender == true
              ? AppColors.mainColor
              : AppColors.resCol,
          child: CustomText(
              text: msg,
              fontSize: AppFonts.t6,
              color: isSender
                  ? AppColors.whiteColor
                  : AppColors.grayCol),
        ),
        CustomText(
            text: DateFormat('hh:mm a').format(date),
            textAlign: isSender == true ? TextAlign.right : TextAlign.left,
            color: AppColors.grayCol,
            fontSize: AppFonts.t9),
      ],
    );
  }
}