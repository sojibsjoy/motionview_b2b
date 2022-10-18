import 'package:dogventurehq/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class NavTotalView extends StatelessWidget {
  final String txt;
  const NavTotalView({
    Key? key,
    required this.txt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 65.h,
      decoration: BoxDecoration(
        color: ConstantColors.primaryColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10.r),
        ),
      ),
      child: Center(
        child: Text(
          txt,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
