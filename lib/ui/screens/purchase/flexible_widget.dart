import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class FlexibleWidget extends StatelessWidget {
  final int flx;
  final String txt;
  final String value;
  const FlexibleWidget({
    Key? key,
    required this.flx,
    required this.txt,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: flx,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            txt,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          addH(10.h),
          Container(
            height: 50.h,
            padding: EdgeInsets.only(left: 10.w),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.grey.shade300,
              ),
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: Row(
              children: [
                Text(
                  value,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
