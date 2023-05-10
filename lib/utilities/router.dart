
import 'package:flutter/material.dart';
import 'package:travel/screen/splash.dart';

import '../screen/onBoarding/view/onboarding_view.dart';
import 'routes.dart';

Route<dynamic> onGenerate(RouteSettings settings){
  switch(settings.name){
    case AppRoutes.splash:
      return MaterialPageRoute(builder: (context)=>const SplashScreen());
    default:
      return MaterialPageRoute(builder: (context)=>const OnBoardingScreen());
  }
}