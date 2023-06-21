import 'package:flutter/material.dart';
import '../../../../components/style/colors.dart';
import '../../../../components/style/images.dart';
import '../../../components/custom_text.dart';
import '../../../components/style/size.dart';

class ItemChat extends StatelessWidget {
  final String image;
  final String name;
  final String message;
  final String date;
  final String numOfMessages;
  final Function() onTapChatDetails;

  const ItemChat(
      {Key? key,
        required this.image,
        required this.name,
        required this.message, required this.numOfMessages, required this.date, required this.onTapChatDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapChatDetails,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          numOfMessages == "0" ? CircleAvatar(
              backgroundImage: AssetImage(image),
              backgroundColor: AppColors.whiteColor,
              radius: 29):Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              CircleAvatar(
                  backgroundImage: AssetImage(image),
                  backgroundColor: AppColors.whiteColor,
                  radius: 29),
              Transform.translate(
                  offset: const Offset(-6, 0),
                  child: CircleAvatar(
                    radius: 12,
                    backgroundColor: AppColors.mainColor,
                    child: Center(child: CustomText(text: numOfMessages,color: AppColors.whiteColor,fontSize: AppFonts.t8)),
                  )
              ),
            ],
          ),
          SizedBox(width: width(context) * 0.035),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                  text: name, color: AppColors.mainColor, fontSize: AppFonts.t4, fontWeight: FontWeight.bold),
              SizedBox(
                  width: width(context) * 0.6,
                  child: CustomText(
                      text: message,
                      color: AppColors.grayCol,
                      fontSize: AppFonts.t6,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis)),
            ],
          ),
          const Spacer(),
          Column(
            children: [
              SizedBox(height: height(context)*0.008),
              CustomText(text: date, color: AppColors.grayCol, fontSize: AppFonts.t9),
              SizedBox(height: height(context)*0.03),
              numOfMessages == "0" ?const SizedBox.shrink():
              Image.asset(AppImages.dots,scale: 5),
            ],
          ),
        ],
      ),
    );
  }
}