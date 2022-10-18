import 'package:dogventurehq/ui/designs/custom_field.dart';
import 'package:dogventurehq/ui/screens/purchase/dropdown_design.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class PlaceOrderItemDesign extends StatelessWidget {
  final int index;
  final VoidCallback deleteFn;
  final String unitPrice;
  final TextEditingController textCon;
  const PlaceOrderItemDesign({
    Key? key,
    required this.index,
    required this.deleteFn,
    required this.unitPrice,
    required this.textCon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: Key('$index'),
      endActionPane: ActionPane(
        extentRatio: 0.17,
        motion: const ScrollMotion(),
        children: [
          InkWell(
            onTap: deleteFn,
            child: Container(
              width: 60.w,
              height: 125.h,
              margin: const EdgeInsets.only(left: 5, bottom: 8),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: const Icon(
                Icons.delete_outline,
                size: 32,
                color: Colors.white,
              ),
            ),
          )
          // SlidableAction(
          //   onPressed: (_) {},
          //   borderRadius: BorderRadius.circular(10.r),
          //   backgroundColor: Colors.red,
          //   icon: Icons.delete,
          // ),
        ],
      ),
      child: Container(
        height: 126.h,
        padding: const EdgeInsets.all(8),
        margin: EdgeInsets.only(bottom: 10.h),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // product dd
            DropdownDesign(title: 'Select Product'),
            // qty, unit price & sub total
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: CustomField(
                    textCon: textCon,
                    hintText: 'QTY',
                    fillClr: Colors.white,
                    inputType: TextInputType.number,
                  ),
                ),
                addW(5.w),
                ExpandedCon(price: unitPrice),
                addW(5.w),
                ExpandedCon(price: textCon.text * int.parse(unitPrice)),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ExpandedCon extends StatelessWidget {
  final String price;
  const ExpandedCon({
    Key? key,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        height: 50.h,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Center(
          child: Text(
            price,
          ),
        ),
      ),
    );
  }
}
