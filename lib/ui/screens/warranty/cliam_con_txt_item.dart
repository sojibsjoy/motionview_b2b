import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class ClaimConTxtItem extends StatelessWidget {
  final String prefixTxt;
  final String suffixTxt;
  bool? statusFlag;
  ClaimConTxtItem({
    Key? key,
    required this.prefixTxt,
    required this.suffixTxt,
    this.statusFlag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '$prefixTxt ',
        style: TextStyle(
          fontSize: 14.sp,
          color: statusFlag != null ? Colors.black : Colors.grey.shade700,
          fontWeight: statusFlag != null ? FontWeight.w600 : null,
        ),
        children: [
          TextSpan(
            text: suffixTxt,
            style: TextStyle(
              fontSize: 14.sp,
              color: statusFlag != null ? Colors.blue : Colors.black,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
