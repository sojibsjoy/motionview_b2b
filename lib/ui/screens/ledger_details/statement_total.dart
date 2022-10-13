import 'package:dogventurehq/constants/colors.dart';
import 'package:dogventurehq/ui/screens/ledger_details/sheet_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class StatementTotal extends StatelessWidget {
  final List<String> totals;
  double? conWidth;
  StatementTotal({
    Key? key,
    this.conWidth,
    required this.totals,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 272.w,
      height: 45.h,
      margin: EdgeInsets.only(right: 10.w),
      decoration: BoxDecoration(
        color: ConstantColors.primaryColor,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(10.r),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            flex: 1,
            fit: FlexFit.loose,
            child: SheetItem(
              txt: 'Total',
              txtClr: Colors.white,
            ),
          ),
          SizedBox(
            width: 200.w,
            child: Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: totals.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return SheetItem(
                    txt: totals[index],
                    txtClr: Colors.white,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
