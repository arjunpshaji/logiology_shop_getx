import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:logiology/app/routes/app_pages.dart';
import 'package:logiology/app/routes/app_routes.dart';
import 'package:logiology/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: isLoggedIn ? AppRoutes.home : AppRoutes.login,
      getPages: appPages,
      theme: getAppTheme(context),
    );
  }
}
