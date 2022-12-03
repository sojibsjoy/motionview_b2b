import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class DropdownDesign extends StatelessWidget {
  final String title;
  double? ddWidth;
  DropdownDesign({
    Key? key,
    required this.title,
    this.ddWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ddWidth ?? double.infinity,
      height: 48.h,
      padding: EdgeInsets.only(left: 10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: ddWidth != null ? ddWidth! - 36 : 320.w,
            child: AutoSizeText(
              title,
              overflow: TextOverflow.ellipsis,
              minFontSize: 8,
              maxLines: 1,
              style: TextStyle(
                color: Colors.grey.shade800,
                fontSize: 13.sp,
              ),
            ),
          ),
          Icon(
            Icons.arrow_drop_down,
            color: Colors.grey.shade800,
          ),
        ],
      ),
    );
  }
}
