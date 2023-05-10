import 'package:flutter/material.dart';
import 'package:travel/components/my_navigate.dart';

import '../components/fade_animation.dart';
import '../components/style/colors.dart';
import '../components/style/images.dart';
import '../components/style/size.dart';
import '../utilities/routes.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5))
        .then((value) {
          navigateAndFinish(context: context, widget: AppRoutes.onBoarding);
    }
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        body: Container(
          height: height(context),
          width: width(context),
          color: AppColors.mainColor,
          child: FadeAnimation(
            1,
            2,
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(AppImages.logo, width: 0.44 * width(context)),
                  SizedBox(
                    height: 0.05 * height(context),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
