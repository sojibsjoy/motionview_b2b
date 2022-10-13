import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class SheetItem extends StatelessWidget {
  final String txt;
  Color? txtClr;
  Color? bgClr;
  int? maxLine;
  bool? radiusTopL;
  bool? radiusTopR;
  bool? radiusBtmL;
  bool? radiusBtmR;
  SheetItem({
    Key? key,
    required this.txt,
    this.txtClr,
    this.bgClr,
    this.maxLine,
    this.radiusTopL,
    this.radiusTopR,
    this.radiusBtmL,
    this.radiusBtmR,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      decoration: BoxDecoration(
        color: bgClr,
        borderRadius: BorderRadius.only(
          topLeft: radiusTopL != null ? Radius.circular(10.r) : Radius.zero,
          topRight: radiusTopR != null ? Radius.circular(10.r) : Radius.zero,
          bottomLeft: radiusBtmL != null ? Radius.circular(10.r) : Radius.zero,
          bottomRight: radiusBtmR != null ? Radius.circular(10.r) : Radius.zero,
        ),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Center(
        child: AutoSizeText(
          txt,
          textAlign: TextAlign.center,
          maxLines: maxLine ?? 1,
          minFontSize: 8,
          style: TextStyle(
            color: txtClr,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
