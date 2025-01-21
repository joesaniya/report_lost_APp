import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lost_found_task_app/controller/theme_controller.dart';
import 'package:lost_found_task_app/utils/app_theme.dart';
import 'package:lost_found_task_app/utils/initial_binding.dart';
import 'package:lost_found_task_app/utils/route_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.put(ThemeController());
    return Obx(() => GetMaterialApp(
          title: 'Lost Found App',
          debugShowCheckedModeBanner: false,
          /* theme: ThemeData(
        primaryColor: const Color(0xff1529e8),
        appBarTheme: const AppBarTheme(
          color: const Color(0xff1529e8),
        ),
      ),*/
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
          themeMode: themeController.theme,
          initialBinding: InitialBinding(),
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
        ));
  }
}
