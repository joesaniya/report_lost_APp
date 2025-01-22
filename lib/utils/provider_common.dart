import 'package:lost_found_task_app/controller/Login_provider.dart';
import 'package:lost_found_task_app/controller/form_controller.dart';
import 'package:lost_found_task_app/controller/signUp_provider.dart';
import 'package:lost_found_task_app/controller/theme_controller.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ProviderHelperClass {
  static ProviderHelperClass? _instance;

  static ProviderHelperClass get instance {
    _instance ??= ProviderHelperClass();
    return _instance!;
  }

  List<SingleChildWidget> providerLists = [
    ChangeNotifierProvider(create: (context) => ThemeProvider()),
    ChangeNotifierProvider(create: (context) => LoginProvider()),
    ChangeNotifierProvider(create: (context) => SignupProvider()),
    ChangeNotifierProvider(create: (context) => FormProvider()),
  ];
}
