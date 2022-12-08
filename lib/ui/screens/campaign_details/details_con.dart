import 'package:dogventurehq/ui/screens/campaign_details/con_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class DetailsConItem extends StatelessWidget {
  final String txt1;
  final String txt2;
  String? txt3;
  double? conH;
  Color? txtClr;
  Color? bgClr;
  bool? topRadiusFlag;
  bool? btmRadiusFlag;
  DetailsConItem({
    Key? key,
    required this.txt1,
    required this.txt2,
    this.txt3,
    this.conH,
    this.txtClr,
    this.bgClr,
    this.topRadiusFlag,
    this.btmRadiusFlag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: conH ?? 40.h,
      decoration: BoxDecoration(
        color: bgClr ?? const Color(0xFFFFF4EC),
        borderRadius: BorderRadius.vertical(
          top: topRadiusFlag != null ? Radius.circular(10.r) : Radius.zero,
          bottom: btmRadiusFlag != null ? Radius.circular(10.r) : Radius.zero,
        ),
      ),
      child: Row(
        children: [
          ConItem(txt: txt1, txtClr: txtClr),
          const VerticalDivider(thickness: 1),
          ConItem(txt: txt2, txtClr: txtClr),
          if (txt3 != null) const VerticalDivider(thickness: 1),
          if (txt3 != null) ConItem(txt: txt3!, txtClr: txtClr),
        ],
      ),
    );
  }
}
