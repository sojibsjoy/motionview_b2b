import 'dart:convert';

import 'package:dogventurehq/states/models/campaign/bundle.dart';
import 'package:dogventurehq/states/models/campaign/campaing.dart';
import 'package:dogventurehq/states/models/campaign/combo.dart';
import 'package:dogventurehq/states/models/campaign/sale_out.dart';
import 'package:dogventurehq/states/models/campaign/saleout.dart';
import 'package:dogventurehq/states/models/campaign/invoice.dart';
import 'package:dogventurehq/states/services/campaign.dart';
import 'package:get/state_manager.dart';

class CampaignController extends GetxController {
  RxBool campaignsLoading = true.obs;
  RxBool camDetailsLoading = true.obs;

  List<CampaignModel> campaigns = List.empty();

  List<InvoiceCam> invoiceCams = List.empty();
  List<ComboCam> comboCams = List.empty();
  List<BundleCam> bundleCams = List.empty();
  List<DSaleoutCam> dSaleoutCams = List.empty();
  List<SaleoutCam> saleoutCams = List.empty();

  void getAllCampaigns({
    required String token,
    required bool dealerFlag,
  }) async {
    campaignsLoading(true);
    try {
      var response = await CampaignService.getCampaigns(
        usrToken: token,
        dFlag: dealerFlag,
      );
      if (dealerFlag) {
        DealerCampaignsModel obj = dealerCampaignsModelFromJson(
          jsonEncode(response),
        );
        campaigns = obj.campaigns;
      } else {
        RetailerCampaignsModel obj = retailerCampaignsModelFromJson(
          jsonEncode(response),
        );
        campaigns = obj.campaigns;
      }
      if (campaigns.isNotEmpty) {
        print(campaigns.length);
      }
    } finally {
      campaignsLoading(false);
    }
  }

  void getCampaignDetails({
    required String token,
    required bool dealerFlag,
    required int campaignID,
  }) async {
    camDetailsLoading(true);
    try {
      var response = await CampaignService.getCamDetails(
        usrToken: token,
        dFlag: dealerFlag,
        cID: campaignID,
      );
      switch (campaignID) {
        case 1:
        case 2:
        case 3:
          InvoiceCamModel obj = invoiceCamModelFromJson(
            jsonEncode(response),
          );
          invoiceCams = obj.invoiceCams;
          break;
        case 4:
          ComboCamModel obj = comboCamModelFromJson(
            jsonEncode(response),
          );
          comboCams = obj.comboCams;
          break;
        case 5:
          BundleCampaignsModel obj = bundleCampaignsModelFromJson(
            jsonEncode(response),
          );
          bundleCams = obj.bundleCams;
          break;
        case 6:
          if (dealerFlag) {
            DealerSaleoutCamModel obj = dealerSaleoutCamModelFromJson(
              jsonEncode(response),
            );
            dSaleoutCams = obj.dSaleoutCams;
          } else {
            SaleoutCampaignsModel obj = saleoutCampaignsModelFromJson(
              jsonEncode(response),
            );
            saleoutCams = obj.saleoutCams;
          }
          break;
        default:
      }
    } finally {
      camDetailsLoading(false);
    }
  }
}
