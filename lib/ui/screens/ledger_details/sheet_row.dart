import 'package:dogventurehq/ui/screens/ledger_details/sheet_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class SheetRow extends StatelessWidget {
  final List<String> txtItems;
  Color? bgClr;
  bool? topRadius;
  bool? noTxtClr;
  double? conH;
  SheetRow({
    Key? key,
    required this.txtItems,
    this.bgClr,
    this.topRadius,
    this.noTxtClr,
    this.conH,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55.h,
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        color: bgClr ?? Colors.grey.shade100,
        border: Border.all(
          color: Colors.grey.shade300,
        ),
        borderRadius: BorderRadius.vertical(
          top: topRadius != null ? Radius.circular(10.r) : Radius.zero,
        ),
      ),
      child: Row(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: txtItems.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return SheetItem(txt: txtItems[index]);
            },
          ),
        ],
      ),
      // Row(
      //   children: [

      //     SheetItem(txt: txtItems[0]),
      //     SheetItem(txt: txtItems[1]),
      //     SheetItem(
      //       txt: txtItems[2],
      //       txtClr: noTxtClr != null ? null : Colors.blue,
      //       maxLine: 2,
      //     ),
      //     SheetItem(txt: txtItems[3]),
      //     SheetItem(txt: txtItems[4]),
      //     SheetItem(txt: txtItems[5], noRightBar: true),
      //   ],
      // ),
    );
  }
}
