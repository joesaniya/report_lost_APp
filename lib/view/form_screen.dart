import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lost_found_task_app/controller/form_controller.dart';
import 'package:lost_found_task_app/view/widgets/custom_button.dart';
import 'package:lost_found_task_app/view/widgets/custom_textfield.dart';
import 'package:lost_found_task_app/view/widgets/image_grid.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FormController>(builder: (controller) {
      return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.grey[200],
          title: const Text('Lost Found App'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('You pressed bell icon.')));
              },
            ),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
          child: ListView(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                // height: 400,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        label: 'Name',
                        hintText: 'Enter your name',
                        controller: controller.nameController,
                        validator: controller.validateName,
                        backgroundColor: Colors.grey[200],
                      ),
                      CustomTextField(
                        label: 'Contact Information',
                        hintText: 'Enter your contact info',
                        controller: controller.contactController,
                        validator: controller.validateContact,
                        inputType: TextInputType.text,
                        backgroundColor: Colors.grey[200],
                      ),
                      CustomTextField(
                        label: 'Item Description',
                        hintText: 'Describe the item',
                        controller: controller.descriptionController,
                        validator: controller.validateDescription,
                        backgroundColor: Colors.grey[200],
                        maxLines: 4,
                        inputType: TextInputType.multiline,
                      ),
                      CustomTextField(
                        label: 'Location',
                        hintText: 'Enter location',
                        controller: controller.locationController,
                        // validator: controller.validateLocation,
                        backgroundColor: Colors.grey[200],
                      ),
                      CustomTextField(
                        label: 'Date',
                        hintText: 'Pick the date',
                        controller: controller.dateController,
                        // validator: controller.validateDate,
                        isDatePicker: true,
                        onDateSelected: (date) {
                          controller.dateController.text = date;
                        },
                        backgroundColor: Colors.grey[200],
                      ),
                      SizedBox(height: 20),
                      // Image picker button
                      ElevatedButton(
                        onPressed: controller.pickImage,
                        child: const Text('Pick Images'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.shade300,
                        ),
                      ),
                      SizedBox(height: 10),
                      controller.images.isNotEmpty
                          ? ImageGrid(
                              images: controller.images,
                              onRemove: controller.removeImage,
                            )
                          : const Center(child: Text('No images selected')),

                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05),
                    ],
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              CustomElevatedButton(
                width: MediaQuery.of(context).size.width,
                label: 'Submit',
                onPressed: controller.submitForm,
                borderRadius: 8.0,
                color: Colors.blue.shade300,
                labelStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            ],
          ),
        ),
      );
    });
  }
}
