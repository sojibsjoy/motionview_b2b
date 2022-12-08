import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/services/base_client.dart';

class CampaignService {
  static Future<dynamic> getCampaigns({
    required String usrToken,
    required bool dFlag,
  }) async {
    var response = await BaseClient.getData(
      api: dFlag
          ? ConstantStrings.kDealerCampaignList
          : ConstantStrings.kRetailerCampaignList,
      token: usrToken,
    );
    return response;
  }

  static Future<dynamic> getCamDetails({
    required String usrToken,
    required bool dFlag,
    required int cID,
  }) async {
    var response = await BaseClient.postData(
      api: dFlag
          ? ConstantStrings.kDealerSubCampaignList
          : ConstantStrings.kRetailerSaleOutCampaignList,
      token: usrToken,
      body: {
        "campaign_id": cID,
      },
    );
    return response;
  }
}
