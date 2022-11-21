import 'package:dogventurehq/states/models/saleout_report.dart';
import 'package:dogventurehq/states/utils/methods.dart';
import 'package:dogventurehq/ui/screens/sale_out/con_richtxt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SalesHistoryItem extends StatelessWidget {
  final SaleoutReport srModel;
  const SalesHistoryItem({
    super.key,
    required this.srModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 112.h,
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
          // order id & date
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // order id
              ConRichTxt(
                prefixTxt: 'Order ID: ',
                suffixTxt: srModel.orderNo,
              ),
              // date
              Text(
                'Date: ${srModel.date.split('-').reversed.join('/')}',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          // payable amount
          ConRichTxt(
            prefixTxt: 'Payable Amount: ',
            suffixTxt: Methods.getFormatedPrice(
              srModel.total.toDouble(),
            ),
          ),
          // paid amount
          ConRichTxt(
            prefixTxt: 'Paid: ',
            suffixTxt: Methods.getFormatedPrice(
              srModel.paid.toDouble(),
            ),
          ),

          // due amount
          ConRichTxt(
            prefixTxt: 'Due: ',
            suffixTxt: Methods.getFormatedPrice(
              srModel.due.toDouble(),
            ),
          ),
        ],
      ),
    );
  }
}
