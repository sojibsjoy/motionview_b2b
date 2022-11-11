import 'package:dogventurehq/states/controllers/ledger.dart';
import 'package:get/instance_manager.dart';

class LedgerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LedgerController());
  }
}
