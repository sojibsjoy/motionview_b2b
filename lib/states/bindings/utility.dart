import 'package:dogventurehq/states/controllers/purchase.dart';
import 'package:dogventurehq/states/controllers/utility.dart';
import 'package:get/instance_manager.dart';

class UtilityBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UtilityController());
  }
}
