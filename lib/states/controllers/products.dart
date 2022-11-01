import 'dart:convert';

import 'package:dogventurehq/states/models/products.dart';
import 'package:dogventurehq/states/services/products.dart';
import 'package:get/state_manager.dart';

class ProductsController extends GetxController {
  RxBool productsLoading = true.obs;

  ProductsModel? productsModel;

  void getAllProducts({
    required String token,
    required bool dealerFlag,
    bool? trendingFlag,
    bool? newArrivalFlag,
    bool? upcomingFlag,
    int? page,
    int? perPage,
    String? brand,
    String? category,
    String? search,
  }) async {
    productsLoading(true);
    try {
      var response = await ProductsService.getAllProducts(
        usrToken: token,
        dealerFlag: dealerFlag,
        page: page,
        perPage: perPage,
        brand: brand,
        category: category,
        search: search,
        tFlag: trendingFlag,
        newAFlag: newArrivalFlag,
        uFlag: upcomingFlag,
      );
      productsModel = productsModelFromJson(jsonEncode(response));
      if (productsModel != null) {
        print(productsModel!.data.length);
      }
    } finally {
      productsLoading(false);
    }
  }
}
