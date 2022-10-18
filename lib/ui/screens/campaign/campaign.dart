import 'package:dogventurehq/ui/screens/campaign_details/campaign_details.dart';
import 'package:dogventurehq/ui/screens/home/custom_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CampaignScreen extends StatelessWidget {
  static String routeName = '/campaign';
  const CampaignScreen({super.key});

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
                itemCount: 10,
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: InkWell(
                        onTap: () => Get.toNamed(CampaignDetails.routeName),
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Image.asset(
                          'assets/imgs/campaign.png',
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
