import 'package:flutter/material.dart';
import 'package:travel/screen/splash.dart';
import '../screen/auth/chooseAuth.dart';
import '../screen/auth/login/view/login_view.dart';
import '../screen/auth/register/view/register_view.dart';
import '../screen/home/view/home_view.dart';
import '../screen/onBoarding/view/onboarding_view.dart';
import 'routes.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.splash:
      return MaterialPageRoute(builder: (context) => const SplashScreen());
    case AppRoutes.onBoarding:
      return MaterialPageRoute(builder: (context) => const OnBoardingScreen());
    case AppRoutes.chooseAuth:
      return MaterialPageRoute(builder: (context) => const ChooseAuthScreen());
    case AppRoutes.login:
      return MaterialPageRoute(builder: (context) => const LoginScreen());
    case AppRoutes.register:
      return MaterialPageRoute(builder: (context) => const RegisterScreen());
    case AppRoutes.home:
      return MaterialPageRoute(builder: (context) => const HomeScreen());
    default:
      return MaterialPageRoute(builder: (context) => const OnBoardingScreen());
  }
}
