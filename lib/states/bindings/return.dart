import 'package:dogventurehq/states/controllers/return.dart';
import 'package:get/instance_manager.dart';

class ReturnBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReturnController());
  }
}
