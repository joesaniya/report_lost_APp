import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lost_found_task_app/controller/Login_provider.dart';
import 'package:lost_found_task_app/controller/signUp_provider.dart';
import 'package:lost_found_task_app/controller/theme_controller.dart';
import 'package:lost_found_task_app/view/login_view.dart';
import 'package:lost_found_task_app/view/widgets/custom_button.dart';
import 'package:lost_found_task_app/view/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SignupProvider>(builder: (context, provider, _) {
      final themeController = Provider.of<ThemeProvider>(context);
      return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          actions: [
            IconButton(
              icon: Icon(
                themeController.isDarkMode ? Icons.dark_mode : Icons.light_mode,
              ),
              onPressed: () => themeController.toggleTheme(),
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Lost Found App',
              style: TextStyle(
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: MediaQuery.of(context).size.height * 0.6,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Form(
                key: provider.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomTextField(
                      label: 'Username',
                      hintText: 'Enter Username',
                      controller: provider.nameController,
                      validator: provider.validateEmail,
                      inputType: TextInputType.emailAddress,
                      backgroundColor:
                          Theme.of(context).inputDecorationTheme.fillColor,
                    ),
                    CustomTextField(
                      label: 'Email Id',
                      hintText: 'Enter your email id',
                      controller: provider.emailController,
                      validator: provider.validateEmail,
                      inputType: TextInputType.emailAddress,
                      backgroundColor:
                          Theme.of(context).inputDecorationTheme.fillColor,
                    ),
                    CustomTextField(
                      label: 'Password',
                      hintText: 'Enter your Password',
                      controller: provider.pwdController,
                      validator: provider.ValidatePassword,
                      inputType: TextInputType.text,
                      backgroundColor:
                          Theme.of(context).inputDecorationTheme.fillColor,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    CustomElevatedButton(
                      width: MediaQuery.of(context).size.width,
                      label: 'Sign Up',
                      onPressed: () {
                        provider.submitForm(context);
                      },
                      borderRadius: 8.0,
                      color: Colors.blue.shade300,
                      labelStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                    RichText(
                      text: TextSpan(
                        text: 'Already have an account?',
                        style: TextStyle(
                          fontSize: 15,
                          color: Theme.of(context).textTheme.bodyLarge?.color,
                        ),
                        children: [
                          TextSpan(
                            text: ' Sign In',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        const LoginView(),
                                    transitionsBuilder: (context, animation,
                                        secondaryAnimation, child) {
                                      const begin = Offset(1.0, 0.0);
                                      const end = Offset.zero;
                                      const curve = Curves.ease;

                                      var tween = Tween(begin: begin, end: end)
                                          .chain(CurveTween(curve: curve));
                                      var offsetAnimation =
                                          animation.drive(tween);

                                      return SlideTransition(
                                        position: offsetAnimation,
                                        child: child,
                                      );
                                    },
                                  ),
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
