import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/generated/locale_keys.g.dart';
import '../../../../components/custom_btn.dart';
import '../../../../components/custom_text.dart';
import '../../../../components/custom_textfield.dart';
import '../../../../components/my_navigate.dart';
import '../../../../components/style/colors.dart';
import '../../../../components/style/images.dart';
import '../../../../components/style/size.dart';
import '../../../../utilities/routes.dart';
import '../controller/login_cubit.dart';
import '../controller/login_states.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LoginCubit(),
        child: BlocBuilder<LoginCubit, LoginStates>(builder: (context, states) {
          final cubit = LoginCubit.get(context);
          return SafeArea(
              child: Scaffold(
            body: Container(
              width: width(context),
              height: height(context),
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppImages.backAuth), fit: BoxFit.cover),
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(height: height(context) * .07),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                            text: 'ally',
                            color: AppColors.mainColor,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600,
                            fontSize: AppFonts.h1,
                            fontStyle: FontStyle.italic),
                        CustomText(
                            text: 'Trave',
                            color: Colors.white,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600,
                            fontSize: AppFonts.h1,
                            fontStyle: FontStyle.italic),
                        SizedBox(width: width(context) * 0.02),
                        Image.asset(AppImages.logo, scale: 7.7),
                      ],
                    ),
                    SizedBox(height: height(context) * 0.05),
                    Container(
                      width: double.infinity,
                      height: height(context) * 0.7,
                      decoration: BoxDecoration(
                          color: AppColors.grayCol.withOpacity(.75),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40))),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: width(context) * 0.085),
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Form(
                            key: cubit.formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: height(context) * 0.01),
                                Center(
                                    child: CustomText(
                                        text: LocaleKeys.LogIn.tr(),
                                        fontSize: 30,
                                        color: AppColors.whiteColor,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: height(context) * 0.01),
                                CustomText(
                                    text: LocaleKeys.Email.tr(),
                                    color: AppColors.whiteColor,
                                    fontSize: AppFonts.t5),
                                SizedBox(height: height(context) * 0.005),
                                CustomTextField(
                                    secure: false,
                                    controller: cubit.emailController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "البريد الالكتروني مطلوب";
                                      }
                                    },
                                    type: TextInputType.emailAddress),
                                SizedBox(height: height(context) * 0.03),
                                CustomText(
                                    text: LocaleKeys.Password.tr(),
                                    color: AppColors.whiteColor,
                                    fontSize: AppFonts.t5),
                                SizedBox(height: height(context) * 0.005),
                                CustomTextField(
                                    secure: cubit.isPass,
                                    controller: cubit.passwordController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return " كلمة المرور مطلوبه";
                                      }
                                    },
                                    prefix: InkWell(
                                        onTap: () {
                                          cubit.changePass();
                                        },
                                        child: Icon(
                                            cubit.isPass
                                                ? Icons.visibility_off_sharp
                                                : Icons.remove_red_eye_sharp,
                                            color: AppColors.mainColor)),
                                    type: TextInputType.visiblePassword),
                                SizedBox(height: height(context) * 0.02),
                                GestureDetector(
                                  onTap: () {},
                                  child: CustomText(
                                      text: LocaleKeys.ForgetPass.tr(),
                                      color: AppColors.whiteColor,
                                      decoration: TextDecoration.underline),
                                ),
                                SizedBox(height: height(context) * 0.11),
                                Center(
                                    child: CustomBtn(
                                  colored: true,
                                  text: LocaleKeys.SignUp.tr(),
                                  textColor: AppColors.whiteColor,
                                  onTap: () async {
                                    if (cubit.formKey.currentState!
                                        .validate()) {
                                      await cubit.login(context: context);
                                    }
                                  },
                                )),
                                SizedBox(height: height(context) * 0.01),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomText(
                                        text: "${LocaleKeys.NotHaveAcc.tr()}  ",
                                        color: AppColors.whiteColor),
                                    GestureDetector(
                                        onTap: () {
                                          navigateTo(
                                              context, AppRoutes.register);
                                        },
                                        child: CustomText(
                                            text: LocaleKeys.SignUp.tr(),
                                            color: AppColors.mainColor)),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ));
        }));
  }
}
