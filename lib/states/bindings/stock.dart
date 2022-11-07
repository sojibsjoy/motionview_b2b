import 'package:dogventurehq/states/controllers/stock.dart';
import 'package:get/instance_manager.dart';

class StockBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StockController());
  }
}
