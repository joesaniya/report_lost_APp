import 'package:flutter/material.dart';
import 'package:lost_found_task_app/controller/form_controller.dart';
import 'package:lost_found_task_app/controller/theme_controller.dart';
import 'package:lost_found_task_app/view/widgets/custom_button.dart';
import 'package:lost_found_task_app/view/widgets/custom_textfield.dart';
import 'package:lost_found_task_app/view/widgets/image_grid.dart';
import 'package:provider/provider.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FormProvider>(builder: (context, controller, _) {
      final themeController = Provider.of<ThemeProvider>(context);
      return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          title: Text(
            'Lost Found App',
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyLarge?.color,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                themeController.isDarkMode ? Icons.dark_mode : Icons.light_mode,
              ),
              onPressed: () => themeController.toggleTheme(),
            ),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
          child: ListView(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
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
                  key: controller.formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        label: 'Name',
                        hintText: 'Enter your name',
                        controller: controller.nameController,
                        validator: controller.validateName,
                        backgroundColor:
                            Theme.of(context).inputDecorationTheme.fillColor,
                      ),
                      CustomTextField(
                        label: 'Contact Information',
                        hintText: 'Enter your contact info',
                        controller: controller.contactController,
                        validator: controller.validateContact,
                        inputType: TextInputType.number,
                        backgroundColor:
                            Theme.of(context).inputDecorationTheme.fillColor,
                      ),
                      CustomTextField(
                        label: 'Item Description',
                        hintText: 'Describe the item',
                        controller: controller.descriptionController,
                        validator: controller.validateDescription,
                        backgroundColor:
                            Theme.of(context).inputDecorationTheme.fillColor,
                        maxLines: 4,
                        inputType: TextInputType.multiline,
                      ),
                      CustomTextField(
                        label: 'Location',
                        hintText: 'Enter location',
                        controller: controller.locationController,
                        backgroundColor:
                            Theme.of(context).inputDecorationTheme.fillColor,
                      ),
                      CustomTextField(
                        label: 'Date',
                        hintText: 'Pick the date',
                        controller: controller.dateController,
                        isDatePicker: true,
                        onDateSelected: (date) {
                          controller.dateController.text = date;
                        },
                        backgroundColor:
                            Theme.of(context).inputDecorationTheme.fillColor,
                      ),
                      const SizedBox(height: 20),
                      InkWell(
                        onTap: controller.pickImage,
                        child: Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColorLight,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: const Icon(Icons.upload_file,
                              color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 10),
                      controller.images.isNotEmpty
                          ? ImageGrid(
                              images: controller.images,
                              onRemove: controller.removeImage,
                            )
                          : const Center(child: Text('No images selected')),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: controller.clearForm,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent,
                            ),
                            child: const Text(
                              'Clear Form',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              controller.refreshForm(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                            ),
                            child: const Text(
                              'Refresh Form',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
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
                onPressed: () {
                  controller.submitForm(context);
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
            ],
          ),
        ),
      );
    });
  }
}
