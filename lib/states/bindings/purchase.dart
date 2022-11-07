import 'package:dogventurehq/states/controllers/purchase.dart';
import 'package:get/instance_manager.dart';

class PurchaseBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PurchaseController());
  }
}
