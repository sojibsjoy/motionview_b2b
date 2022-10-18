import 'package:dogventurehq/ui/designs/custom_btn.dart';
import 'package:dogventurehq/ui/screens/campaign_details/details_body.dart';
import 'package:dogventurehq/ui/screens/campaign_details/product_wise_campaign.dart';
import 'package:dogventurehq/ui/screens/home/custom_appbar.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:dogventurehq/ui/widgets/row_btn.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class CampaignDetails extends StatefulWidget {
  static String routeName = '/campaign_details';
  const CampaignDetails({super.key});

  @override
  State<CampaignDetails> createState() => _CampaignDetailsState();
}

class _CampaignDetailsState extends State<CampaignDetails> {
  final List<String> _btnTxts = [
    'Normal Campaign',
    'Bundle Campaign',
    'Combo Campaign',
    'Saleout Campaign',
    'Image Campaign',
  ];
  int _selectedBtnIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // appbar
            CustomAppbar(title: 'Campaign Details'),
            // btn list
            RowItem(
              itemList: _btnTxts,
              onTapFn: (value) => setState(() => _selectedBtnIndex = value),
            ),
            addH(10.h),
            // details
            getBodyView(),
          ],
        ),
      ),
    );
  }

  Widget getBodyView() {
    switch (_selectedBtnIndex) {
      case 0:
        return const DetailsBody();
      case 1:
        return ProductWiseCampaign(
          campaignTitle: 'Bundle Offer',
          selectedBtnIndex: _selectedBtnIndex,
        );
      case 2:
        return ProductWiseCampaign(
          campaignTitle: 'Combo Offer',
          selectedBtnIndex: _selectedBtnIndex,
        );
      case 3:
        return ProductWiseCampaign(
          campaignTitle: 'Saleout Offer',
          selectedBtnIndex: _selectedBtnIndex,
        );
      case 4:
        return Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
              width: double.infinity,
              height: 708.h,
              color: Colors.pink,
              child: Image.asset(
                'assets/imgs/img_campaign.png',
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: CustomBtn(
                onPressedFn: () {},
                btnTxt: 'Order Now',
                btnColor: Colors.black,
                btnBroderRadius: 10.r,
                txtSize: 20.sp,
              ),
            ),
          ],
        );
      default:
        return const DetailsBody();
    }
  }
}
