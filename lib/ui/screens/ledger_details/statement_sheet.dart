import 'package:dogventurehq/states/controllers/return.dart';
import 'package:dogventurehq/ui/designs/custom_btn.dart';
import 'package:dogventurehq/ui/screens/ledger_details/sheet_item.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class StatementSheet extends StatelessWidget {
  final Widget bodyWidget;
  final List<String> statementTitleList;
  int? flxIndexNo;
  int? flx;
  StatementSheet({
    Key? key,
    required this.bodyWidget,
    required this.statementTitleList,
    this.flxIndexNo,
    this.flx,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // sheet title
              for (int i = 0; i < statementTitleList.length; i++)
                SheetItem(
                  txt: statementTitleList[i],
                  flx: i == flxIndexNo ? flx : 1,
                  bgClr: Colors.grey.shade200,
                  radiusTopL: i == 0 ? true : null,
                  radiusTopR: i == statementTitleList.length - 1 ? true : null,
                ),
            ],
          ),
          // sheet body
          bodyWidget,
        ],
      ),
    );
  }
}

class DialogWidget extends StatelessWidget {
  const DialogWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: () => Get.back(),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: SvgPicture.asset(
                'assets/svgs/close.svg',
              ),
            ),
          ],
        ),
        addH(10.h),
        ClipRRect(
          borderRadius: BorderRadius.circular(5.r),
          child: Image.asset(
            'assets/imgs/invoice.png',
          ),
        ),
        addH(10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomBtn(
              onPressedFn: () {},
              btnTxt: 'Print',
              txtSize: 14,
              txtColor: Colors.black,
              btnColor: Colors.white,
              btnSize: Size(105.w, 50.h),
            ),
            CustomBtn(
              onPressedFn: () {},
              btnTxt: 'Receive Now',
              txtSize: 14,
              txtColor: Colors.white,
              btnColor: const Color(0xFF0047FF),
              btnSize: Size(150.w, 50.h),
            ),
            CustomBtn(
              onPressedFn: () {},
              btnTxt: 'Cancel',
              txtSize: 14,
              txtColor: Colors.white,
              btnColor: Colors.red,
              btnSize: Size(105.w, 50.h),
            ),
          ],
        )
      ],
    );
  }
}
