import 'package:dogventurehq/ui/screens/campaign_details/campaign_details.dart';
import 'package:dogventurehq/ui/screens/home/custom_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CampaignScreen extends StatelessWidget {
  static String routeName = '/campaign';
  CampaignScreen({super.key});

  final List<String> _campaignTypes = const [
    'invoice_d',
    'charger_c',
    'tv_m',
    'bundle_c',
    'combo_c',
    'sale_out',
    'secondary_c',
  ];

  final List<VoidCallback> _campaignOnClickFn = [
    () => Get.toNamed(CampaignDetails.routeName),
    () => Get.toNamed(CampaignDetails.routeName),
    () => Get.toNamed(CampaignDetails.routeName),
    () => Get.toNamed(CampaignDetails.routeName),
    () => Get.toNamed(CampaignDetails.routeName),
    () => Get.toNamed(CampaignDetails.routeName),
    () => Get.toNamed(CampaignDetails.routeName),
  ];

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
              child: ListView.builder(
                itemCount: _campaignTypes.length,
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: InkWell(
                        onTap: _campaignOnClickFn[index],
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Image.asset(
                          'assets/imgs/${_campaignTypes[index]}.png',
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
