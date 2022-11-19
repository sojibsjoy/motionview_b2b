import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TotalCon extends StatelessWidget {
  final String icon;
  final Color clr;
  final String txt;
  final String value;
  final int index;
  const TotalCon({
    Key? key,
    required this.icon,
    required this.clr,
    required this.txt,
    required this.value,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130.w,
      height: 120.h,
      padding: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        border: Border.all(color: clr),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // icon
          Container(
            width: 50.w,
            height: 50.h,
            decoration: BoxDecoration(
              color: clr,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SvgPicture.asset(
                'assets/svgs/$icon.svg',
                color: Colors.white,
              ),
            ),
          ),
          addH(5.h),
          Text(
            txt,
            style: const TextStyle(
              fontSize: 11,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
