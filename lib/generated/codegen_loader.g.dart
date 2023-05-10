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
  "OnBoarding3": "خطط لرحلتك"
};
static const Map<String,dynamic> en = {
  "OnBoarding1": "Explore your interests",
  "OnBoarding2": "Find Your Travel Mate",
  "OnBoarding3": "Plan your Trip"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": ar, "en": en};
}
