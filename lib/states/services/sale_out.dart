import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/services/base_client.dart';

class SaleOutService {
  static Future<dynamic> getAllPP({
    required String usrToken,
    required bool dFlag,
  }) async {
    var response = await BaseClient.getData(
      api: dFlag
          ? ConstantStrings.kDealerPurchasedProducts
          : ConstantStrings.kRetailerPurchasedProducts,
      token: usrToken,
    );
    return response;
  }

  static Future<dynamic> getSaleOutReport({
    required String usrToken,
    required bool dFlag,
  }) async {
    var response = await BaseClient.getData(
      api: dFlag
          ? ConstantStrings.kPaymentMethods
          : ConstantStrings.kRetailerSaleOutReport,
      token: usrToken,
    );
    return response;
  }

  static Future<dynamic> saleOutCreate({
    required String usrToken,
    required bool dFlag,
    required dynamic pBody,
  }) async {
    var response = await BaseClient.postData(
      api: dFlag
          ? ConstantStrings.kDealerSaleOutCreate
          : ConstantStrings.kRetailerSaleOutCreate,
      token: usrToken,
      body: pBody,
    );
    return response;
  }
}
