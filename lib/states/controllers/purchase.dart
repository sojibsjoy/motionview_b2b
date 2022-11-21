import 'dart:convert';

import 'package:dogventurehq/states/models/purchase_order.dart';
import 'package:dogventurehq/states/services/purchase.dart';
import 'package:get/state_manager.dart';

class PurchaseController extends GetxController {
  RxBool ordersLoading = true.obs;

  PurchaseOrdersModel? pOrdersModel;

  void getAllOrders({
    required String token,
    required bool dealerFlag,
    bool? pendingFlag,
    bool? shippingFlag,
    bool? purchaseHistoryFlag,
  }) async {
    ordersLoading(true);
    try {
      var response = await PurchaseService.getOrders(
        usrToken: token,
        dealerFlag: dealerFlag,
        pFlag: pendingFlag,
        sFlag: shippingFlag,
        phFlag: purchaseHistoryFlag,
      );
      pOrdersModel = purchaseOrdersModelFromJson(jsonEncode(response));
      if (pOrdersModel != null) {
        print(pOrdersModel!.data.length);
      }
    } finally {
      ordersLoading(false);
    }
  }
}
