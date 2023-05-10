import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'utilities/router.dart';
import 'utilities/routes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      useOnlyLangCode: true,
      supportedLocales: const [Locale('en'), Locale('ar')],
      startLocale: const Locale('ar'),
      path: 'assets/translations',
      fallbackLocale: const Locale('ar'),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: "Traveally",
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      onGenerateRoute: onGenerate,
      initialRoute: AppRoutes.splash,
      debugShowCheckedModeBanner: false,
    );
  }
}

