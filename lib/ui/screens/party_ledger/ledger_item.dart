import 'package:dogventurehq/ui/screens/ledger_details/ledger_details.dart';
import 'package:dogventurehq/ui/screens/products/product_price.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LedgerItem extends StatelessWidget {
  const LedgerItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(LedgerDetailsScreen.routeName),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        width: 375.w,
        height: 95.h,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Row(
          children: [
            // party image
            Container(
              width: 60.w,
              height: 60.h,
              margin: EdgeInsets.only(right: 10.w),
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(5.r),
              ),
            ),
            // party details
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // party name & credit
                const Text(
                  'Star Tech Ltd.',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                // party address
                Row(
                  children: [
                    // location icon
                    SvgPicture.asset(
                      'assets/svgs/location.svg',
                    ),
                    addW(5.w),
                    Text(
                      'Dhaka',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    addW(5.w),
                    //  credit
                    const ProductPrice(
                      prefix: 'Credit',
                      price: '43,990',
                      txtClr: Colors.red,
                    ),
                    addW(10.w),
                    //  credit limit
                    const ProductPrice(
                      prefix: 'Limit',
                      price: '50,990',
                      txtClr: Colors.red,
                    ),
                  ],
                )
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const ProductPrice(
                  prefix: 'Target',
                  price: '40,890',
                  txtClr: Colors.purple,
                ),
                addW(10.w),
                const ProductPrice(
                  prefix: 'Sales  ',
                  price: '43,990',
                  txtClr: Color(0xFF4DC016),
                ),
                addW(10.w),
                const ProductPrice(
                  prefix: 'Achived:',
                  price: '79%',
                  txtClr: Color(0xFF4DC016),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
