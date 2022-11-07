import 'package:dogventurehq/ui/designs/custom_btn.dart';
import 'package:dogventurehq/ui/designs/custom_field.dart';
import 'package:dogventurehq/ui/screens/warranty/claim_item.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class CliamList extends StatefulWidget {
  final bool finishFlag;
  final bool dealerFlag;
  const CliamList({
    Key? key,
    required this.finishFlag,
    required this.dealerFlag,
  }) : super(key: key);

  @override
  State<CliamList> createState() => _CliamListState();
}

class _CliamListState extends State<CliamList> {
  final TextEditingController _searchCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          addH(10.h),
          // search con
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomField(
                textCon: _searchCon,
                hintText: 'Search here...',
                width: 270.w,
                height: 50.h,
                prefixIcon: 'search',
                fillClr: Colors.grey.shade100,
              ),
              CustomBtn(
                onPressedFn: () {},
                btnTxt: 'Saerch',
                btnSize: Size(110.w, 50.h),
                txtSize: 16.sp,
              ),
            ],
          ),
          addH(20.h),
          ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            primary: false,
            itemBuilder: (BuildContext context, int index) {
              return ClaimItem(
                finishFlag: widget.finishFlag,
                dealerFlag: widget.dealerFlag,
              );
            },
          ),
        ],
      ),
    );
  }
}
