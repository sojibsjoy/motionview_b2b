import 'package:dogventurehq/states/utils/methods.dart';
import 'package:dogventurehq/ui/designs/custom_btn.dart';
import 'package:dogventurehq/ui/screens/sale_out/con_info_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BtmNavbar extends StatefulWidget {
  final bool showFlag;
  final int totalQty;
  final int totalAmount;
  final int discountAmount;
  final int paidAmount;
  final VoidCallback orderNowFn;
  // final void Function(String) getRemarks;
  const BtmNavbar({
    Key? key,
    required this.showFlag,
    required this.totalQty,
    required this.totalAmount,
    required this.discountAmount,
    required this.paidAmount,
    required this.orderNowFn,
    // required this.getRemarks,
  }) : super(key: key);

  @override
  State<BtmNavbar> createState() => _BtmNavbarState();
}

class _BtmNavbarState extends State<BtmNavbar> {
  final TextEditingController _remarksCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: double.infinity,
      height: widget.showFlag ? 210.h : 0,
      // height: widget.showFlag ? 290.h : 0,
      color: Colors.grey.shade200,
      padding: const EdgeInsets.all(10),
      duration: const Duration(milliseconds: 300),
      child: Wrap(
        children: [
          // CustomField(
          //   textCon: _remarksCon,
          //   hintText: 'Remarks...',
          //   width: double.infinity,
          //   onCngdFn: (value) => widget.getRemarks(value),
          // ),
          Container(
            height: 120.h,
            padding: const EdgeInsets.all(10.0),
            // margin: EdgeInsets.only(top: 10.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ConInfoRow(
                  prefixTxt: 'Total Quantity',
                  suffixTxt: widget.totalQty.toString(),
                ),
                ConInfoRow(
                  prefixTxt: 'Total Amount',
                  suffixTxt: Methods.getFormatedPrice(
                    widget.totalAmount.toDouble(),
                  ),
                ),
                ConInfoRow(
                  prefixTxt: 'Discount',
                  suffixTxt: Methods.getFormatedPrice(
                    widget.discountAmount.toDouble(),
                  ),
                ),
                ConInfoRow(
                  prefixTxt: 'Payable Amount',
                  suffixTxt: Methods.getFormatedPrice(
                    (widget.totalAmount - widget.discountAmount).toDouble(),
                  ),
                ),
                ConInfoRow(
                  prefixTxt: 'Paid',
                  suffixTxt: Methods.getFormatedPrice(
                    widget.paidAmount.toDouble(),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: CustomBtn(
              onPressedFn: widget.orderNowFn,
              btnTxt: 'Order Now',
              btnSize: Size(double.infinity, 58.h),
            ),
          ),
        ],
      ),
    );
  }
}
