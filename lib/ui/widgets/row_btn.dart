import 'package:dogventurehq/ui/designs/custom_btn.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class RowItem extends StatefulWidget {
  final List<String> itemList;
  final void Function(int) onTapFn;
  const RowItem({
    super.key,
    required this.itemList,
    required this.onTapFn,
  });

  @override
  State<RowItem> createState() => _RowItemState();
}

class _RowItemState extends State<RowItem> {
  int _selectedBtnIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.h,
      margin: EdgeInsets.only(left: 20.w, top: 10.h),
      child: ListView.builder(
        itemCount: widget.itemList.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: CustomBtn(
              onPressedFn: () {
                // _orderCon.getOrders(
                //   invoiceStatusID: _btnIds[index],
                //   supplierID: _supplierInfo.supplierId,
                // );
                widget.onTapFn(index);
                setState(
                  () => _selectedBtnIndex = index,
                );
              },
              btnTxt: widget.itemList[index],
              btnSize: Size(160.w, 35.h),
              txtSize: 12.sp,
              // btnBorderRadius: 10.r,
              btnColor: _selectedBtnIndex == index ? null : Colors.white,
              txtColor: _selectedBtnIndex == index ? null : Colors.black,
            ),
          );
        },
      ),
    );
  }
}
