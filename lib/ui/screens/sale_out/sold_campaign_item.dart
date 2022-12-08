import 'package:dogventurehq/states/models/sale_out/sold_campaign.dart';
import 'package:dogventurehq/states/utils/methods.dart';
import 'package:dogventurehq/ui/screens/sale_out/con_richtxt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SoldCampaignItem extends StatelessWidget {
  final SoldCampaign scModel;
  const SoldCampaignItem({
    super.key,
    required this.scModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120.h,
      padding: EdgeInsets.all(10.w),
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // product name
          ConRichTxt(
            prefixTxt: '',
            suffixTxt: scModel.product.name,
          ),
          // order id
          ConRichTxt(
            prefixTxt: 'Order ID: ',
            suffixTxt: scModel.orderNo,
          ),
          // quantity
          ConRichTxt(
            prefixTxt: 'Quantity: ',
            suffixTxt: scModel.qty.toString(),
          ),
          // discount amount
          ConRichTxt(
            prefixTxt: 'Discount Amount: ',
            suffixTxt: Methods.getFormatedPrice(
              scModel.discountAmount.toDouble(),
            ),
          ),
          // status & date
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // due amount
              ConRichTxt(
                prefixTxt: 'Status: ',
                suffixTxt: scModel.status,
              ),
              // date
              Text(
                'Date: ${scModel.date.split('-').reversed.join('/')}',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
