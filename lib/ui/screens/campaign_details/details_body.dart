import 'package:dogventurehq/ui/screens/campaign_details/details_con.dart';
import 'package:dogventurehq/ui/screens/home/custom_appbar.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:dogventurehq/ui/widgets/row_btn.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class DetailsBody extends StatelessWidget {
  const DetailsBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // title
          const Text('Gadget & Accessories'),
          addH(10.h),
          // lifting & discout
          DetailsConItem(
            txt1: 'Lifting',
            txt2: 'Discount',
            topRadiusFlag: true,
            bgClr: const Color(0xFFFCE3DB),
          ),
          ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return DetailsConItem(
                txt1: '${index + 1},50,000',
                txt2: '${index + 1}%',
                bgClr: index % 2 == 0 ? null : const Color(0xFFFFEEE1),
              );
            },
          ),
        ],
      ),
    );
  }
}
