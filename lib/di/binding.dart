import 'package:blnk_demo/pages/login/viewModel/logn_view_model.dart';
import 'package:blnk_demo/pages/register/viewModel/register_view_model.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterViewModel());
    Get.lazyPut(() => LoginViewModel());
  }
}