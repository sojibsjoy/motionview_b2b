import 'package:dogventurehq/states/models/dealer_ledger.dart';
import 'package:dogventurehq/states/utils/methods.dart';
import 'package:dogventurehq/ui/screens/ledger_details/ledger_details.dart';
import 'package:dogventurehq/ui/screens/products/product_price.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LedgerItem extends StatelessWidget {
  final DLedgerModel dlModel;
  const LedgerItem({
    Key? key,
    required this.dlModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(LedgerDetailsScreen.routeName),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        width: 375.w,
        height: 95.h,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
        margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Row(
          children: [
            // party image
            // Container(
            //   width: 60.w,
            //   height: 60.h,
            //   margin: EdgeInsets.only(right: 10.w),
            //   decoration: BoxDecoration(
            //     color: Colors.pink,
            //     borderRadius: BorderRadius.circular(5.r),
            //   ),
            // ),
            // party details
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // party name & credit
                Text(
                  dlModel.name,
                  style: const TextStyle(
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
                      dlModel.address,
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
                    ProductPrice(
                      prefix: 'Credit',
                      price: Methods.getFormatedPrice(dlModel.credit),
                      txtClr: Colors.red,
                    ),
                    addW(10.w),
                    //  credit limit
                    ProductPrice(
                      prefix: 'Limit',
                      price: Methods.getFormatedPrice(dlModel.creditLimit),
                      txtClr: Colors.red,
                    ),
                  ],
                )
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ProductPrice(
                  prefix: 'Target',
                  price: Methods.getFormatedPrice(dlModel.target),
                  // price: '99,99,99,999',
                  txtClr: Colors.purple,
                ),
                addW(10.w),
                ProductPrice(
                  prefix: 'Sales  ',
                  price: Methods.getFormatedPrice(dlModel.achived),
                  txtClr: const Color(0xFF4DC016),
                ),
                addW(10.w),
                ProductPrice(
                  prefix: 'Achived:',
                  price:
                      '${((dlModel.achived <= 0 ? 1 : dlModel.achived * dlModel.target <= 0 ? 1 : dlModel.target) * 100)}%',
                  txtClr: const Color(0xFF4DC016),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
