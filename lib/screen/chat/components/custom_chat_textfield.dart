import 'package:flutter/material.dart';

import '../../../components/style/colors.dart';
import '../../../components/style/size.dart';


class ChatCustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? type;
  final Widget? suffix;
  final String? text;
  ChatCustomTextField(
      {Key? key,
        this.controller,
        this.type,
        this.suffix, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: AppColors.mainColor,
      cursorHeight: 20,
      style: TextStyle(fontSize: AppFonts.t3, color: AppColors.mainColor),
      decoration: InputDecoration(
        hintText:text?? "اكتب رسالتك........",
        hintStyle: TextStyle(fontSize: 14),
        filled: true,
        fillColor: AppColors.resCol,
        contentPadding: EdgeInsets.symmetric(
            vertical: height(context) * 0.02,
            horizontal: width(context) * 0.034),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(15),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: AppColors.mainColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: AppColors.mainColor)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: AppColors.mainColor)),
        suffixIcon: suffix,
      ),
      keyboardType: type,
    );
  }
}
