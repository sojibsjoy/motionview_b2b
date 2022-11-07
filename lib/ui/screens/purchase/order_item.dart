import 'package:dogventurehq/states/models/purchase_order.dart';
import 'package:dogventurehq/states/utils/methods.dart';
import 'package:dogventurehq/ui/screens/purchase/con_row.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  final PurchaseOrderModel pOrderModel;
  const OrderItem({
    Key? key,
    required this.pOrderModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // invoice number & date
          ConRow(
            prefixTxt1: 'Invoice No: ',
            prefixTxt2: pOrderModel.orderNo,
            suffixChild: Text(
              'Date: ${pOrderModel.date.split('-').reversed.join('-')}',
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ),
          ConRow(
            prefixTxt1: 'Amount: ',
            prefixTxt2: Methods.getFormatedPrice(pOrderModel.amount),
            suffixChild: Container(
              width: 100.w,
              height: 25.h,
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                border: Border.all(color: Colors.blue, width: 0.5),
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Center(
                child: Text(
                  'View Details',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
