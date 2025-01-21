import 'package:flutter/material.dart';
import 'dart:io';

import 'package:lost_found_task_app/view/widgets/text_widget.dart';

class ConfirmationScreen extends StatelessWidget {
  final Map<String, dynamic> formData;

  // Constructor to accept form data
  const ConfirmationScreen({Key? key, required this.formData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[200],
        child: Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(14))),
            width: double.infinity,
            height: 600,
            padding: EdgeInsets.all(15),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Lost Data Confirmation',
                  style: TextStyle(
                      color: const Color(0xff1529e8),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
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
                const SizedBox(height: 20),
                Text(
                  'Images:',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                formData['images'] != null && formData['images'].isNotEmpty
                    ? Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: List.generate(
                          formData['images'].length,
                          (index) => Image.file(
                            formData['images'][index],
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
