import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lost_found_task_app/utils/initial_binding.dart';
import 'package:lost_found_task_app/utils/route_pages.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Lost Found App',
      debugShowCheckedModeBanner: false,
      /* theme: ThemeData(
        primaryColor: const Color(0xff1529e8),
        appBarTheme: const AppBarTheme(
          color: const Color(0xff1529e8),
        ),
      ),*/
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      // themeMode: Get.find<ThemeController>().theme,
      initialBinding: InitialBinding(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
