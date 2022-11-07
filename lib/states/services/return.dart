import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/services/base_client.dart';

class ReturnService {
  // order function
  static Future<dynamic> getOrders({
    required String usrToken,
    required bool dealerFlag,
    bool? pFlag,
    bool? rsFlag,
  }) async {
    String apiLink = dealerFlag
        ? ConstantStrings.kDealerAllProducts
        : ConstantStrings.kRetailerReturnOrders;
    // if (dealerFlag) {
    //   if (tFlag != null) {
    //     apiLink = ConstantStrings.kDealerTrendingProducts;
    //   }
    //   if (newAFlag != null) {
    //     apiLink = ConstantStrings.kDealerNewArrivalProducts;
    //   }
    //   if (uFlag != null) {
    //     apiLink = ConstantStrings.kDealerUpcomingProducts;
    //   }
    // } else {
    //   if (tFlag != null) {
    //     apiLink = ConstantStrings.kRetailerTrendingProducts;
    //   }
    //   if (newAFlag != null) {
    //     apiLink = ConstantStrings.kRetailerNewArrivalProducts;
    //   }
    //   if (uFlag != null) {
    //     apiLink = ConstantStrings.kRetailerUpcomingProducts;
    //   }
    // }
    dynamic paramBody;
    if (pFlag != null) {
      paramBody = {
        "type": "pending",
      };
    }
    if (rsFlag != null) {
      paramBody = {
        "type": "history",
      };
    }

    print(apiLink);

    var response = await BaseClient.getData(
      token: usrToken,
      api: apiLink,
      parameter: paramBody,
    );
    return response;
  }

  static Future<dynamic> getProducts({
    required String usrToken,
    required bool dealerFlag,
    String? search,
  }) async {
    var response = await BaseClient.getData(
      token: usrToken,
      api: dealerFlag
          ? ConstantStrings.kDealerAllProducts
          : ConstantStrings.kRetailerReturnProducts,
      parameter: {
        "search": search ?? '',
      },
    );
    return response;
  }
}
