import 'package:flutter/material.dart';
import 'package:lost_found_task_app/view/form_screen.dart';

class LoginProvider with ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final pwdController = TextEditingController();
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email ID is required';
    }

    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? ValidatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    return null;
  }

  void submitForm(BuildContext context) {
    if (formKey.currentState?.validate() ?? false) {
      Map<String, dynamic> formData = {
        'name': emailController.text,
        'password': pwdController.text
      };

      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => FormScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.ease;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        ),
      );
    }
  }
  /* void onPasswordChanged(String text) {
    checkInputTextNotNull();
    notifyListeners();
  }

  void checkInputTextNotNull() {
    if (usernameController.text.length >= 2 && passwordController.text.length >= 2) {
      inputTextNotNull = true;
    } else {
      inputTextNotNull = false;
    }
  } */
}
