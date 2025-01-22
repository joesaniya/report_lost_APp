import 'package:flutter/material.dart';
import 'package:lost_found_task_app/view/form_screen.dart';
import 'package:lost_found_task_app/view/home_screen.dart';
import 'package:lost_found_task_app/view/login_view.dart';
import 'package:lost_found_task_app/view/signUp_view.dart';

class AppPages {
  AppPages._();

  static const String INITIAL = '/';

  static final Map<String, WidgetBuilder> routes = {
    '/': (context) => const HomeScreen(),
    '/login': (context) => const LoginView(),
    '/signUp': (context) => const SignUpView(),
    '/form': (context) => const FormScreen(),
  };
}
