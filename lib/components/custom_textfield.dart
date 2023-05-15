import 'package:flutter/material.dart';
import 'style/colors.dart';
import 'style/size.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? type;
  final bool secure;
  String? Function(String?)? validator;
  final Widget? prefix;
  CustomTextField(
      {Key? key,
      this.controller,
      this.validator,
      this.type,
      required this.secure,
      this.prefix})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      cursorColor: AppColors.mainColor,
      cursorHeight: 20,
      style: TextStyle(fontSize: AppFonts.t3, color: AppColors.mainColor),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.whiteColor,
        contentPadding: EdgeInsets.symmetric(
            vertical: height(context) * 0.02,
            horizontal: width(context) * 0.032),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(15),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: AppColors.whiteColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: AppColors.mainColor)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: AppColors.whiteColor)),
        suffixIcon: prefix,
      ),
      keyboardType: type,
      obscureText: secure,
    );
  }
}
