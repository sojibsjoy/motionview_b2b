import 'package:dogventurehq/ui/screens/campaign_details/list_item.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class ProductWiseCampaign extends StatelessWidget {
  final String campaignTitle;
  final int selectedBtnIndex;
  const ProductWiseCampaign({
    Key? key,
    required this.campaignTitle,
    required this.selectedBtnIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10.h),
        // height: double.infinity,
        // height: 700.h,
        color: Colors.grey.shade300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              campaignTitle,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            addH(10.h),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return ListItem(
                    titleTxt: 'Amazfit GTS 4 Mini Smartwatch',
                    subTitleTxt: selectedBtnIndex == 2
                        ? 'Amazfit GTS 4 Mini Smartwatch'
                        : null,
                    qty: 5 + index,
                    discount: double.parse('${1 + index}'),
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
