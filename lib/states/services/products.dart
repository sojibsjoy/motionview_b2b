import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/services/base_client.dart';

class ProductsService {
  // Login Function
  static Future<dynamic> getAllProducts({
    required String usrToken,
    required bool dealerFlag,
    bool? tFlag,
    bool? newAFlag,
    bool? uFlag,
    int? page,
    int? perPage,
    String? brand,
    String? category,
    String? search,
  }) async {
    String apiLink = dealerFlag
        ? ConstantStrings.kDealerAllProducts
        : ConstantStrings.kRetailerAllProducts;
    if (dealerFlag) {
      if (tFlag != null) {
        apiLink = ConstantStrings.kDealerTrendingProducts;
      }
      if (newAFlag != null) {
        apiLink = ConstantStrings.kDealerNewArrivalProducts;
      }
      if (uFlag != null) {
        apiLink = ConstantStrings.kDealerUpcomingProducts;
      }
    } else {
      if (tFlag != null) {
        apiLink = ConstantStrings.kRetailerTrendingProducts;
      }
      if (newAFlag != null) {
        apiLink = ConstantStrings.kRetailerNewArrivalProducts;
      }
      if (uFlag != null) {
        apiLink = ConstantStrings.kRetailerUpcomingProducts;
      }
    }

    print(apiLink);

    var response = await BaseClient.getData(
      token: usrToken,
      api: apiLink,
      parameter: {
        "page": page ?? 1,
        "per_page": perPage ?? 10,
        // "brand": brand ?? '',
        // "category": category ?? '',
        // "search": search ?? '',
      },
    );
    return response;
  }
}
