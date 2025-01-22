import 'package:flutter/material.dart';
import 'package:lost_found_task_app/controller/theme_controller.dart';
import 'package:lost_found_task_app/utils/app_theme.dart';
import 'package:lost_found_task_app/utils/provider_common.dart';
import 'package:lost_found_task_app/utils/route_pages.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: ProviderHelperClass.instance.providerLists,
      child: const MyApp(),
    ),
  );
}

/*class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MultiProvider(
      providers: ProviderHelperClass.instance.providerLists,
      child: MaterialApp(
        title: 'Lost Found App',
        debugShowCheckedModeBanner: false,
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
        themeMode: themeProvider.theme,
        initialRoute: AppPages.INITIAL,
        routes: AppPages.routes,
      ),
    );
  }
}*/

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'Lost Found App',
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: themeProvider.theme,
      initialRoute: AppPages.INITIAL,
      routes: AppPages.routes,
    );
  }
}
