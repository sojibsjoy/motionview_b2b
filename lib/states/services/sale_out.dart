import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/services/base_client.dart';

class SaleOutService {
  static Future<dynamic> getSaleOutReport({
    required String token,
    required bool dFlag,
  }) async {
    var response = await BaseClient.getData(
      api: dFlag
          ? ConstantStrings.kPaymentMethods
          : ConstantStrings.kRetailerSaleOut,
      token: token,
    );
    return response;
  }
}
