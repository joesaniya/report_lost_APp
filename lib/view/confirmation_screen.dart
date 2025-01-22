import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lost_found_task_app/controller/theme_controller.dart';
import 'package:provider/provider.dart';
import 'package:lost_found_task_app/view/widgets/text_widget.dart';
import 'package:lottie/lottie.dart';

class ConfirmationScreen extends StatelessWidget {
  final Map<String, dynamic> formData;

  const ConfirmationScreen({Key? key, required this.formData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirmation'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(
              themeProvider.isDarkMode ? Icons.dark_mode : Icons.light_mode,
            ),
            onPressed: themeProvider.toggleTheme,
          ),
        ],
      ),
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: const BorderRadius.all(Radius.circular(14)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            width: double.infinity,
            height: 600,
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Lost Data Confirmation',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Lottie.asset(
                    'assets/lottie/confirmation.json',
                    fit: BoxFit.cover,
                    repeat: true,
                  ),
                ),
                TextWidget(
                  label: 'Name: ',
                  Sublabel: formData['name'],
                ),
                TextWidget(
                  label: 'Contact: ',
                  Sublabel: formData['contact'],
                ),
                TextWidget(
                  label: 'Item Description: ',
                  Sublabel: formData['description'],
                ),
                TextWidget(
                  label: 'Location: ',
                  Sublabel: formData['location'],
                ),
                TextWidget(
                  label: 'Date: ',
                  Sublabel: formData['date'],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Text(
                  'Images:',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                formData['images'] != null && formData['images'].isNotEmpty
                    ? Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: List.generate(
                          formData['images'].length,
                          (index) => Image.file(
                            formData['images'][index] as File,
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : const Text('No images uploaded'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
