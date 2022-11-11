import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/services/base_client.dart';

class LedgerService {
  static Future<dynamic> getLedgers({
    required String usrToken,
    required bool dealerFlag,
    int? billNo,
    String? sDate,
    String? eDate,
  }) async {
    String apiLink = dealerFlag
        ? ConstantStrings.kDealerLedger
        : ConstantStrings.kRetailerLedger;
    // dynamic paramBody;
    // if (pFlag != null) {
    //   paramBody = {
    //     "type": "pending",
    //   };
    // }
    // if (sFlag != null) {
    //   paramBody = {
    //     "type": "shipped",
    //   };
    // }
    // if (phFlag != null) {
    //   paramBody = {
    //     "type": "history",
    //   };
    // }

    var response = await BaseClient.getData(
      token: usrToken,
      api: apiLink,
      // parameter: paramBody,
    );
    return response;
  }
}
