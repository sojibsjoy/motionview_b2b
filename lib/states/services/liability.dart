import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/services/base_client.dart';

class LiabilityService {
  // order function
  static Future<dynamic> getLiabilities({
    required String usrToken,
    required bool dealerFlag,
    // bool? pFlag,
    // bool? rsFlag,
  }) async {
    String apiLink = dealerFlag
        ? ConstantStrings.kDealerLedger
        : ConstantStrings.kRetailerLiabilities;
    // dynamic paramBody;
    // if (pFlag != null) {
    //   paramBody = {
    //     "type": "pending",
    //   };
    // }
    // if (rsFlag != null) {
    //   paramBody = {
    //     "type": "history",
    //   };
    // }

    print(apiLink);

    var response = await BaseClient.getData(
      token: usrToken,
      api: apiLink,
      // parameter: paramBody,
    );
    return response;
  }
}
