import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lost_found_task_app/view/confirmation_screen.dart';
import 'package:lost_found_task_app/view/widgets/snackbar_widgets.dart';

class FormProvider with ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final contactController = TextEditingController();
  final descriptionController = TextEditingController();
  final locationController = TextEditingController();
  final dateController = TextEditingController();

  List<File> images = [];

  /// Validation Methods
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

  /// Image Management
  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFiles = await picker.pickMultiImage();

    if (pickedFiles != null && pickedFiles.isNotEmpty) {
      images.addAll(pickedFiles.map((file) => File(file.path)).toList());
      notifyListeners();
    }
  }

  void removeImage(int index) {
    images.removeAt(index);
    notifyListeners();
  }

  /// Form Actions
  void submitForm(BuildContext context) {
    if (formKey.currentState?.validate() ?? false) {
      Map<String, dynamic> formData = {
        'name': nameController.text,
        'contact': contactController.text,
        'description': descriptionController.text,
        'location': locationController.text,
        'date': dateController.text,
        'images': images,
      };

      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              ConfirmationScreen(formData: formData),
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

  void clearForm() {
    nameController.clear();
    contactController.clear();
    descriptionController.clear();
    locationController.clear();
    dateController.clear();
    images.clear();
    notifyListeners();
  }

  void refreshForm(BuildContext context) {
    clearForm();
    showAnimatedSnackBar(context, 'Form has been refreshed!');
  }
}
