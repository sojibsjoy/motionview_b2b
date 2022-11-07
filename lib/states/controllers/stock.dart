import 'dart:convert';

import 'package:dogventurehq/states/models/stock.dart';
import 'package:dogventurehq/states/services/stock.dart';
import 'package:get/state_manager.dart';

class StockController extends GetxController {
  RxBool stockLoading = true.obs;

  StocksModel? stocks;

  void getEOl({
    required String token,
    required bool dealerFlag,
    required bool eolFlag,
    String? search,
    int? perPage,
    String? category,
    String? brand,
  }) async {
    stockLoading(true);
    try {
      var response = await StockService.getStocks(
        usrToken: token,
        dealerFlag: dealerFlag,
        eolFlag: eolFlag,
        search: search,
        perPage: perPage,
        category: category,
        brand: brand,
      );
      stocks = stocksModelFromJson(jsonEncode(response));
      if (stocks != null) {
        print(stocks!.data.length);
      }
    } finally {
      stockLoading(false);
    }
  }
}
