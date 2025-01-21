import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:lost_found_task_app/view/confirmation_screen.dart';
import 'package:lost_found_task_app/view/form_screen.dart';
import 'package:lost_found_task_app/view/home_screen.dart';

class AppPages with WidgetsBindingObserver {
  AppPages._();
  static const INITIAL = '/';
  static final routes = [
    GetPage(
      name: '/',
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: '/form',
      page: () => const FormScreen(),
    ),
  ];
}
