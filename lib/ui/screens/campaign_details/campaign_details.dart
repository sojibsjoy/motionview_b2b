import 'package:dogventurehq/states/controllers/campaign.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/states/models/campaign/campaing.dart';
import 'package:dogventurehq/states/models/login.dart';
import 'package:dogventurehq/ui/screens/campaign_details/details_body.dart';
import 'package:dogventurehq/ui/screens/campaign_details/product_wise_campaign.dart';
import 'package:dogventurehq/ui/screens/home/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CampaignDetails extends StatefulWidget {
  static String routeName = '/campaign_details';
  const CampaignDetails({super.key});

  @override
  State<CampaignDetails> createState() => _CampaignDetailsState();
}

class _CampaignDetailsState extends State<CampaignDetails> {
  final CampaignController _cCon = Get.find<CampaignController>();
  late CampaignModel _camModel;

  late LoginModel _usrInfo;
  bool _dealerFlag = false;

  @override
  void initState() {
    _usrInfo = Preference.getUserDetails();
    _dealerFlag = Preference.getDealerFlag();
    _camModel = Get.arguments;

    _cCon.getCampaignDetails(
      token: _usrInfo.data.token,
      dealerFlag: _dealerFlag,
      campaignID: _camModel.id,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // appbar
            CustomAppbar(title: _camModel.name),
            // details
            getBodyView(),
          ],
        ),
      ),
    );
  }

  Widget getBodyView() {
    switch (_camModel.id) {
      case 1: // invoice
      case 2: // charger & cable
        return DetailsBody(
          camID: _camModel.id,
        );
      case 3: // tv-monitor-laptop
        return DetailsBody(
          camID: _camModel.id,
        );
      case 4:
        return ProductWiseCampaign(
          campaignTitle: 'Combo Campaign',
          camID: _camModel.id,
          dFlag: _dealerFlag,
        );
      case 5:
        return ProductWiseCampaign(
          campaignTitle: 'Bundle Campaign',
          camID: _camModel.id,
          dFlag: _dealerFlag,
        );
      case 6:
        return ProductWiseCampaign(
          campaignTitle: 'Saleout Campaign',
          camID: _camModel.id,
          dFlag: _dealerFlag,
        );
      default:
        return DetailsBody(
          camID: _camModel.id,
        );
    }
  }
}
