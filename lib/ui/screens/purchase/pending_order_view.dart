import 'package:dogventurehq/ui/screens/home/searchbar_design.dart';
import 'package:dogventurehq/ui/screens/purchase/con_row.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class PendingOrderView extends StatelessWidget {
  const PendingOrderView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        addH(10.h),
        // search bar
        const SearchbarDesign(),
        // pending order list
        ListView.builder(
          itemCount: 10,
          shrinkWrap: true,
          primary: false,
          padding: EdgeInsets.symmetric(
            horizontal: 15.w,
            vertical: 10.h,
          ),
          itemBuilder: (BuildContext context, int index) {
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
                  const ConRow(
                    prefixTxt1: 'Invoice No: ',
                    prefixTxt2: '#MVDH23456788',
                    suffixChild: Text(
                      'Date: 12/09/2022',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  ConRow(
                    prefixTxt1: 'Amount: ',
                    prefixTxt2: '\$33,80,878',
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
          },
        ),
      ],
    );
  }
}
