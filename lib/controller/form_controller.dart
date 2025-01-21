import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lost_found_task_app/view/confirmation_screen.dart';

class FormController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final contactController = TextEditingController();
  final descriptionController = TextEditingController();
  final locationController = TextEditingController();
  final dateController = TextEditingController();

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }
    return null;
  }

  String? validateContact(String? value) {
    if (value == null || value.isEmpty) {
      return 'Contact Information is required';
    }
    final emailRegex = RegExp(r"^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    final phoneRegex = RegExp(r"^(?:[+0]9)?[0-9]{10}$");
    if (!emailRegex.hasMatch(value) && !phoneRegex.hasMatch(value)) {
      return 'Please enter a valid email or phone number';
    }
    return null;
  }

  String? validateDescription(String? value) {
    if (value == null || value.isEmpty) {
      return 'Item description is required';
    }
    return null;
  }

  String? validateLocation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Location is required';
    }
    return null;
  }

  String? validateDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Date is required';
    }
    return null;
  }

  List<File> images = [];

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFiles = await picker.pickMultiImage();

    if (pickedFiles != null && pickedFiles.isNotEmpty) {
      images.addAll(pickedFiles.map((file) => File(file.path)).toList());
      update();
    }
  }

  void removeImage(int index) {
    images.removeAt(index);
    update();
  }

  void submitForm() {
    if (formKey.currentState?.validate() ?? false) {
      Map<String, dynamic> formData = {
        'name': nameController.text,
        'contact': contactController.text,
        'description': descriptionController.text,
        'location': locationController.text,
        'date': dateController.text,
        'images': images,
      };

      Get.off(() => ConfirmationScreen(formData: formData),
          transition: Transition.fadeIn, duration: Duration(seconds: 1));
    }
  }
}
