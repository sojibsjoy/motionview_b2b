import 'package:dogventurehq/ui/designs/custom_btn.dart';
import 'package:dogventurehq/ui/screens/ledger_details/sheet_item.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class StatementSheet extends StatelessWidget {
  final List<String> statementTitleList;
  final List<List<String>> statementData;
  int? flxIndexNo;
  List<int>? formatIndexNos;
  int? txtClrIndex;
  int? onTapIndex;
  int? flx;
  StatementSheet({
    Key? key,
    required this.statementTitleList,
    required this.statementData,
    this.flxIndexNo,
    this.formatIndexNos,
    this.flx,
    this.txtClrIndex,
    this.onTapIndex,
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
          for (int i = 0; i < statementData[0].length; i++)
            Row(
              children: [
                for (int j = 0; j < statementData.length; j++)
                  SheetItem(
                    txt: statementData[j][i],
                    flx: j == flxIndexNo ? flx : 1,
                    formatTxt:
                        formatIndexNos != null && formatIndexNos!.contains(j)
                            ? true
                            : null,
                    onTapFn: j == onTapIndex
                        ? () {
                            showDialog(
                              context: context,
                              builder: (_) => const Dialog(
                                backgroundColor: Colors.transparent,
                                insetPadding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: Center(
                                  child: DialogWidget(),
                                ),
                              ),
                            );
                            // Get.defaultDialog(
                            //   titlePadding: EdgeInsets.zero,
                            //   contentPadding: EdgeInsets.zero,
                            //   title: '',
                            //   barrierDismissible: false,
                            //   backgroundColor: Colors.transparent,
                            //   content: const DialogWidget(),
                            // );
                            // for (int k = 0;
                            //     k < statementTitleList.length;
                            //     k++) {
                            //   print(statementData[k][i]);
                            // }
                          }
                        : null,
                    bgClr: i % 2 == 0 ? null : Colors.grey.shade200,
                    maxLine: j == 2 ? 2 : 1,
                    txtClr: txtClrIndex != null
                        ? j == txtClrIndex
                            ? Colors.blue
                            : null
                        : null,
                    radiusBtmL: i == statementData[0].length - 1 && j == 0
                        ? true
                        : null,
                    radiusBtmR: i == statementData[0].length - 1 &&
                            j == statementData.length - 1
                        ? true
                        : null,
                  ),
              ],
            ),
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
