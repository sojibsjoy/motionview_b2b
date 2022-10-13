import 'package:dogventurehq/ui/screens/ledger_details/sheet_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class StatementBody extends StatelessWidget {
  final List<String> titleList;
  final List<List<String>> itemList;
  int? indexNo;
  double? indexWidth;
  StatementBody({
    Key? key,
    required this.titleList,
    required this.itemList,
    this.indexNo,
    this.indexWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: ListView.builder(
          itemCount: itemList.length + 1,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              width: indexNo == index ? indexWidth : 68.w,
              // color: Colors.pink,
              child: ListView.builder(
                itemCount: titleList.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int indx) {
                  if (indx == 0) {
                    return Column(
                      children: [
                        SheetItem(
                          txt: titleList[index],
                          bgClr: Colors.grey.shade200,
                          radiusTopL: index == 0 ? true : null,
                          radiusTopR:
                              index == titleList.length - 1 ? true : null,
                        ),
                        SheetItem(
                          txt: index == 0
                              ? '${indx + 1}'
                              : itemList[index - 1][indx],
                          bgClr: Colors.white,
                        ),
                      ],
                    );
                  }
                  return SheetItem(
                    txt: index == 0 ? '${indx + 1}' : itemList[index - 1][indx],
                    bgClr: indx % 2 == 0 ? Colors.white : Colors.grey.shade200,
                    radiusBtmL:
                        indx == itemList.length && index == 0 ? true : null,
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
