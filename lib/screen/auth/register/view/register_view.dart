import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/components/my_navigate.dart';
import 'package:travel/generated/locale_keys.g.dart';
import '../../../../components/custom_btn.dart';
import '../../../../components/custom_text.dart';
import '../../../../components/custom_textfield.dart';
import '../../../../components/style/colors.dart';
import '../../../../components/style/images.dart';
import '../../../../components/style/size.dart';
import '../../../../utilities/routes.dart';
import '../controller/register_cubit.dart';
import '../controller/register_states.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => RegisterCubit(),
        child: BlocBuilder<RegisterCubit, RegisterStates>(
            builder: (context, states) {
          final cubit = RegisterCubit.get(context);
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
                                        text: LocaleKeys.Welcome.tr(),
                                        fontSize: 34,
                                        color: AppColors.whiteColor,
                                        fontWeight: FontWeight.bold)),
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
                                      return "كلمة المرور مطلوبة";
                                    }
                                  },
                                  type: TextInputType.visiblePassword,
                                  prefix: InkWell(
                                      onTap: () {
                                        cubit.changePass();
                                      },
                                      child: Icon(
                                        cubit.isPass
                                            ? Icons.visibility_off_sharp
                                            : Icons.remove_red_eye_sharp,
                                        color: AppColors.mainColor,
                                      )),
                                ),
                                SizedBox(height: height(context) * 0.03),
                                CustomText(
                                    text: LocaleKeys.ConfirmPassword.tr(),
                                    color: AppColors.whiteColor,
                                    fontSize: AppFonts.t5),
                                SizedBox(height: height(context) * 0.005),
                                CustomTextField(
                                    secure: cubit.isPassConf,
                                    controller: cubit.confirmPasswordController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "تأكيد كلمة المرور مطلوب";
                                      }
                                    },
                                    type: TextInputType.visiblePassword,
                                    prefix: InkWell(
                                        onTap: () {
                                          cubit.changePassConf();
                                        },
                                        child: Icon(
                                            cubit.isPassConf
                                                ? Icons.visibility_off_sharp
                                                : Icons.remove_red_eye_sharp,
                                            color: AppColors.mainColor))),
                                SizedBox(height: height(context) * 0.03),
                                Center(
                                    child: CustomBtn(
                                  colored: true,
                                  text: LocaleKeys.SignUp.tr(),
                                  textColor: AppColors.whiteColor,
                                  onTap: () async {
                                    if (cubit.formKey.currentState!
                                        .validate()) {
                                      await cubit.register(context: context);
                                    }
                                  },
                                )),
                                SizedBox(height: height(context) * 0.01),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomText(
                                        text:
                                            "${LocaleKeys.AlreadyHaveAcc.tr()}  ",
                                        color: AppColors.whiteColor),
                                    GestureDetector(
                                        onTap: () {
                                          navigateTo(context, AppRoutes.login);
                                        },
                                        child: CustomText(
                                            text: LocaleKeys.LogIn.tr(),
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
