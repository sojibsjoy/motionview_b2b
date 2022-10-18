import 'package:dogventurehq/ui/designs/custom_btn.dart';
import 'package:dogventurehq/ui/designs/custom_field.dart';
import 'package:dogventurehq/ui/screens/purchase/flexible_widget.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class PlaceOrderNavBar extends StatelessWidget {
  final bool enableFlag;
  final TextEditingController remarksCon;

  const PlaceOrderNavBar({
    Key? key,
    required this.enableFlag,
    required this.remarksCon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: enableFlag ? 275.h : 0,
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 20.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 20,
            spreadRadius: 5,
          )
        ],
      ),
      child: Wrap(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const FlexibleWidget(
                    flx: 1,
                    txt: 'Total QTY',
                    value: 'QTY',
                  ),
                  addW(5.w),
                  const FlexibleWidget(
                    flx: 2,
                    txt: 'Total Amount',
                    value: 'Total Amount',
                  ),
                  addW(5.w),
                  const FlexibleWidget(
                    flx: 2,
                    txt: 'Eligible Discount',
                    value: 'Discount',
                  ),
                ],
              ),
              addH(10.h),
              const Text(
                "Remarks",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              addH(5.h),
              CustomField(
                width: double.infinity,
                textCon: remarksCon,
                hintText: 'Type Here...',
              ),
              addH(10.h),
              Center(
                child: CustomBtn(
                  onPressedFn: () {},
                  btnTxt: 'Confirm Order',
                  btnBroderRadius: 10.r,
                  btnSize: Size(double.infinity, 55.h),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
