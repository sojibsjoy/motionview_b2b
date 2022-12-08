import 'package:dogventurehq/states/controllers/campaign.dart';
import 'package:get/instance_manager.dart';

class CampaignBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CampaignController());
  }
}
