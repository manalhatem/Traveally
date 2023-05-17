import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../components/style/colors.dart';
import '../../../components/style/size.dart';
import '../../../generated/locale_keys.g.dart';
class AddComment extends StatelessWidget {
  final TextEditingController controller;
  const AddComment({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: AppColors.mainColor,
      cursorHeight: 18,
      style: TextStyle(fontSize: AppFonts.t4, color: Colors.black),
      decoration:  InputDecoration(
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          border: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.whiteColor)),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.mainColor)),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.whiteColor)),
          suffixIcon: GestureDetector(
              onTap:(){
                controller.clear();
              },
              child: const Icon(Icons.send, color:AppColors.mainColor,size:20 ,)),
          hintText: "${LocaleKeys.AddComment.tr()} .........."
      ),
      keyboardType:TextInputType.text ,
    );
  }
}
