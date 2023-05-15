import 'package:flutter/material.dart';

import 'style/colors.dart';
import 'style/size.dart';

Future<void> showSnackBar(
    {required BuildContext context,
    required String text,
    required bool success}) async {
  await ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
    margin: EdgeInsets.symmetric(horizontal: width(context) * 0.1),
    duration: const Duration(seconds: 2),
    content: Text(text),
    dismissDirection: DismissDirection.endToStart,
    backgroundColor: success == true ? AppColors.mainColor : Colors.red,
    behavior: SnackBarBehavior.floating,
  ));
}
