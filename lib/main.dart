import 'package:e_commerce_app/core/constants/app/application_constants.dart';
import 'package:e_commerce_app/locator.dart';
import 'package:e_commerce_app/product/auto_route/app_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'core/init/theme/ligth/app_theme_ligth.dart';

void main() {
  setupLocator();
  runApp(
    EasyLocalization(
        supportedLocales: ApplicationConstants.supportedLocale,
        path: ApplicationConstants.langAssetPath,
        startLocale: ApplicationConstants.enLocale,
        fallbackLocale: ApplicationConstants.enLocale,
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: _appRouter.delegate(),
      title: ApplicationConstants.appName,
      theme: AppThemeLight.instance.theme,
    );
  }
}
