import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../components/custom_auth.dart';
import '../../components/custom_btn.dart';
import '../../components/custom_text.dart';
import '../../components/my_navigate.dart';
import '../../components/style/colors.dart';
import '../../components/style/images.dart';
import '../../components/style/size.dart';
import '../../generated/locale_keys.g.dart';
import '../../utilities/routes.dart';

class ChooseAuthScreen extends StatelessWidget {
  const ChooseAuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(
            width: width(context),
            height: height(context),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AppImages.backAuth),
                  fit: BoxFit.cover
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: height(context)*.07),
                Image.asset(AppImages.logo, scale: 4.8),
                SizedBox(height: height(context)*0.018),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(text: 'ally', color:AppColors.mainColor, fontFamily: "Poppins",
                        fontWeight: FontWeight.w600, fontSize: AppFonts.h1,fontStyle: FontStyle.italic),
                    CustomText(text: 'Trave', color: Colors.white, fontFamily: "Poppins",
                        fontWeight: FontWeight.w600, fontSize: AppFonts.h1,fontStyle: FontStyle.italic),
                  ],
                ),
                SizedBox(height: height(context)*0.05),
                Container(
                  width: double.infinity,
                  height: height(context)*0.534,
                  decoration: BoxDecoration(
                      color: AppColors.grayCol.withOpacity(.75),
                      borderRadius:const BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)
                      )
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: height(context)*0.04),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomBtn(colored: true,onTap: (){
                            navigateTo(context, AppRoutes.login);
                          },text: LocaleKeys.LogIn.tr(),
                              textColor: AppColors.whiteColor),
                          CustomBtn(colored: false,onTap: (){
                            navigateTo(context, AppRoutes.register);
                          },text: LocaleKeys.SignUp.tr(),
                              textColor: AppColors.mainColor),
                        ],
                      ),
                      SizedBox(height: height(context)*0.12),
                      CustomAuthLogin(text: LocaleKeys.ContinueWithGoogle.tr(),img: AppImages.google,ontap: (){}),
                      SizedBox(height: height(context)*0.03),
                      CustomAuthLogin(text: LocaleKeys.ContinueWithFaceBook.tr(),img: AppImages.faceBook,ontap: (){}),


                    ],
                  ),
                ),

              ],
            ),
          ),
        ));
  }
}
