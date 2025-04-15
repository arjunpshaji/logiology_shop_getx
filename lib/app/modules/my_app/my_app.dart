import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:logiology/app/routes/app_pages.dart';
import 'package:logiology/app/routes/app_routes.dart';
import 'package:logiology/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(debugShowCheckedModeBanner: false, 
      initialRoute: AppRoutes.login,
      getPages: appPages,
      theme: getAppTheme(context));
  }
}
