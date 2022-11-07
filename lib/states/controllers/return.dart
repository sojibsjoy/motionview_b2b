import 'dart:convert';

import 'package:dogventurehq/states/models/return_order.dart';
import 'package:dogventurehq/states/models/return_product.dart';
import 'package:dogventurehq/states/services/return.dart';
import 'package:get/state_manager.dart';

class ReturnController extends GetxController {
  RxBool ordersLoading = true.obs;
  RxBool productsLoading = true.obs;

  ReturnOrdersModel? rOrdersModel;
  ReturnProductsModel? rProdutsModel;

  void getAllOrders({
    required String token,
    required bool dealerFlag,
    bool? pendingFlag,
    bool? returnSFlag,
  }) async {
    ordersLoading(true);
    try {
      var response = await ReturnService.getOrders(
        usrToken: token,
        dealerFlag: dealerFlag,
        pFlag: pendingFlag,
        rsFlag: returnSFlag,
      );
      rOrdersModel = returnOrdersModelFromJson(jsonEncode(response));
      if (rOrdersModel != null) {
        print(rOrdersModel!.data.length);
      }
    } finally {
      ordersLoading(false);
    }
  }

  void getAllProducts({
    required String token,
    required bool dealerFlag,
    String? search,
  }) async {
    productsLoading(true);
    try {
      var response = await ReturnService.getProducts(
        usrToken: token,
        dealerFlag: dealerFlag,
        search: search,
      );
      rProdutsModel = returnProductsModelFromJson(jsonEncode(response));
      if (rProdutsModel != null) {
        print(rProdutsModel!.data.length);
      }
    } finally {
      productsLoading(false);
    }
  }
}
