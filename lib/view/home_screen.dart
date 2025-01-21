import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lost_found_task_app/controller/theme_controller.dart';
import 'package:lost_found_task_app/view/widgets/custom_button.dart';
import 'package:lottie/lottie.dart';
import 'form_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Lost and Found App'),
          actions: [
            /* Switch(
              value: controller.isDarkMode.value,
              onChanged: (value) => controller.toggleTheme(),
              activeColor: Colors.blue,
              inactiveThumbColor: Colors.grey,
            ),*/
            IconButton(
              icon: Icon(
                controller.isDarkMode.value
                    ? Icons.dark_mode
                    : Icons.light_mode,
              ),
              onPressed: () => controller.toggleTheme(),
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
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomElevatedButton(
                  width: MediaQuery.of(context).size.width,
                  label: 'Report Lost/Found Item',
                  onPressed: () => Get.off(() => FormScreen(),
                      transition: Transition.fadeIn,
                      duration: Duration(seconds: 1)),
                  borderRadius: 8.0,
                  color: Colors.blue.shade300,
                  labelStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
