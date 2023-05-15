// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ar = {
  "OnBoarding1": "استكشف الإهتمامات",
  "OnBoarding2": "اوجد رفيق سفرك",
  "OnBoarding3": "خطط لرحلتك",
  "SignUp": "تسجيل جديد",
  "LogIn": "تسجيل دخول",
  "ContinueWithGoogle": "تسجيل ب جوجل",
  "ContinueWithFaceBook": "تسجيل ب الفيس بوك",
  "Welcome": " مرحبا !",
  "Email": "البريد الإلكتروني",
  "Password": "كلمة السر",
  "ConfirmPassword": "تأكيد كلمة السر",
  "AlreadyHaveAcc": "لدي حساب",
  "NotHaveAcc": "ليس لدي حساب",
  "ForgetPass": "هل نسيت كلمة المرور؟"

  };
static const Map<String,dynamic> en = {
  "OnBoarding1": "Explore your interests",
  "OnBoarding2": "Find Your Travel Mate",
  "OnBoarding3": "Plan your Trip",
  "SignUp": "Sign Up",
  "LogIn": "Log In",
  "ContinueWithGoogle": "Continue With Google",
  "ContinueWithFaceBook": "Continue With FaceBook",
  "Welcome": "Welcome !",
  "Email": "Email",
  "Password": "Password",
  "ConfirmPassword": "Confirm Password",
  "AlreadyHaveAcc": "Already Have Account",
  "NotHaveAcc": "Don't have an Account ",
  "ForgetPass": "Forget Password"

};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": ar, "en": en};
}
