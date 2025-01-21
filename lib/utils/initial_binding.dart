import 'package:get/get.dart';
import 'package:lost_found_task_app/controller/form_controller.dart';
import 'package:lost_found_task_app/controller/theme_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.put(FormController());
  }
}
