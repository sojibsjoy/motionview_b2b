import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/services/base_client.dart';

class PurchaseService {
  // Login Function
  static Future<dynamic> getOrders({
    required String usrToken,
    required bool dealerFlag,
    bool? pFlag,
    bool? sFlag,
    bool? phFlag,
  }) async {
    String apiLink = dealerFlag
        ? ConstantStrings.kDealerAllProducts
        : ConstantStrings.kRetailerOrderView;
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
    dynamic paramBody;
    if (pFlag != null) {
      paramBody = {
        "type": "pending",
      };
    }
    if (sFlag != null) {
      paramBody = {
        "type": "shipped",
      };
    }
    if (phFlag != null) {
      paramBody = {
        "type": "history",
      };
    }

    var response = await BaseClient.getData(
      token: usrToken,
      api: apiLink,
      parameter: paramBody,
    );
    return response;
  }

  static Future<dynamic> getPaymentMethods({
    required String token,
  }) async {
    var response = await BaseClient.getData(
      api: ConstantStrings.kPaymentMethods,
      token: token,
    );
    return response;
  }
}
