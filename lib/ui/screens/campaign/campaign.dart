import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/controllers/campaign.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/states/models/login.dart';
import 'package:dogventurehq/ui/designs/custom_img.dart';
import 'package:dogventurehq/ui/screens/campaign_details/campaign_details.dart';
import 'package:dogventurehq/ui/screens/home/custom_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CampaignScreen extends StatefulWidget {
  static String routeName = '/campaign';
  const CampaignScreen({super.key});

  @override
  State<CampaignScreen> createState() => _CampaignScreenState();
}

class _CampaignScreenState extends State<CampaignScreen> {
  final CampaignController _cCon = Get.find<CampaignController>();

  late LoginModel _usrInfo;
  bool _dealerFlag = false;

  @override
  void initState() {
    _usrInfo = Preference.getUserDetails();
    _dealerFlag = Preference.getDealerFlag();
    _cCon.getAllCampaigns(
      token: _usrInfo.data.token,
      dealerFlag: _dealerFlag,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // appbar
            CustomAppbar(title: 'Campaign'),
            // campaign list
            Expanded(
              child: Obx(() {
                if (_cCon.campaignsLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  if (_cCon.campaigns.isEmpty) {
                    return Center(
                      child: Text(ConstantStrings.kNoData),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: _cCon.campaigns.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.r),
                            child: InkWell(
                              onTap: () => Get.toNamed(
                                CampaignDetails.routeName,
                                arguments: _cCon.campaigns[index],
                              ),
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              child: CustomImg(
                                imgUrl: ConstantStrings.kCampaignPrefix +
                                    _cCon.campaigns[index].banner,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
