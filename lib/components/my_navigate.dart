import 'package:flutter/material.dart';

/// Navigator Push

void navigateTo(context, widget) => Navigator.pushNamed(context,widget);
/// Navigator Finish
void navigateAndFinish({required context,required widget}) => Navigator.pushNamedAndRemoveUntil(
    context, widget,
        (Route<dynamic> route) => false);


/// Navigator Pop

 navigatorPop(context)=> Navigator.pop(context);

/// Navigator And Replace
navigateAndReplace({required context,required widget}) => Navigator.pushReplacementNamed(
    context,widget
   ,);