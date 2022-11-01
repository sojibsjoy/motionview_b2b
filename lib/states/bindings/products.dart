import 'package:dogventurehq/states/controllers/products.dart';
import 'package:get/instance_manager.dart';

class ProductsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductsController());
  }
}
