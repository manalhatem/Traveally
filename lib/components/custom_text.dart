import 'package:flutter/cupertino.dart';

Widget CustomText(
    { required String text,
      Color? color,
      double? fontSize,
      double? wordSpacing,
      TextAlign? textAlign,
      FontWeight? fontWeight,
      String? fontFamily,
      TextOverflow? overflow,
      int? maxLines,
      TextDecoration? decoration}) =>
    Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
        decoration: decoration,
        wordSpacing: wordSpacing,
      ),
      overflow: overflow,
      maxLines: maxLines
    );