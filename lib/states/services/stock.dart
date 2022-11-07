import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/services/base_client.dart';

class StockService {
  // Login Function
  static Future<dynamic> getStocks({
    required String usrToken,
    required bool dealerFlag,
    required bool eolFlag,
    String? search,
    int? perPage,
    String? category,
    String? brand,
  }) async {
    String apiLink = dealerFlag
        ? ConstantStrings.kDealerAllProducts
        : eolFlag
            ? ConstantStrings.kRetailerEOL
            : ConstantStrings.kRetailerStock;
    // if (dealerFlag) {
    //   if (pendingFlag != null) {
    //     apiLink = ConstantStrings.kDealerTrendingProducts;
    //   }
    //   if (shippedFlag != null) {
    //     apiLink = ConstantStrings.kDealerNewArrivalProducts;
    //   }
    //   if (purchaseHistoryFlag != null) {
    //     apiLink = ConstantStrings.kDealerUpcomingProducts;
    //   }
    // } else {
    //   if (pendingFlag != null) {
    //     apiLink = ConstantStrings.kRetailerTrendingProducts;
    //   }
    //   if (shippedFlag != null) {
    //     apiLink = ConstantStrings.kRetailerNewArrivalProducts;
    //   }
    //   if (purchaseHistoryFlag != null) {
    //     apiLink = ConstantStrings.kRetailerUpcomingProducts;
    //   }
    // }

    print(apiLink);

    var response = await BaseClient.getData(
      token: usrToken,
      api: apiLink,
      parameter: {
        "search": search ?? '',
        "per_page": perPage ?? 10,
        "category": category ?? '',
        "brand": brand ?? '',
      },
    );
    return response;
  }
}
