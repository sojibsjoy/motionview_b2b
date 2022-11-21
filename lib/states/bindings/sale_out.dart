import 'package:dogventurehq/states/controllers/sale_out.dart';
import 'package:get/instance_manager.dart';

class SaleOutBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SaleOutController());
  }
}
