import 'package:flutter/material.dart';
import 'package:lost_found_task_app/controller/theme_controller.dart';
import 'package:lost_found_task_app/view/login_view.dart';
import 'package:lost_found_task_app/view/widgets/custom_button.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'form_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, _) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Lost and Found App'),
          actions: [
            IconButton(
              icon: Icon(
                themeProvider.isDarkMode ? Icons.dark_mode : Icons.light_mode,
              ),
              onPressed: themeProvider.toggleTheme,
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Lottie.asset(
                  'assets/lottie/main_lottie.json',
                  fit: BoxFit.cover,
                  repeat: true,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Welcome to the Lost and Found App!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Text(
                'We Are Searching Your Lost Items',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomElevatedButton(
                  width: MediaQuery.of(context).size.width,
                  label: 'Report Lost/Found Item',
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                         
                            const LoginView(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          const begin = Offset(1.0, 0.0);
                          const end = Offset.zero;
                          const curve = Curves.ease;

                          var tween = Tween(begin: begin, end: end)
                              .chain(CurveTween(curve: curve));
                          var offsetAnimation = animation.drive(tween);

                          return SlideTransition(
                            position: offsetAnimation,
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  borderRadius: 8.0,
                  color: Colors.blue.shade300,
                  labelStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
