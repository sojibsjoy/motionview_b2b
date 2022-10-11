import 'package:dogventurehq/constants/colors.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class PageBody extends StatelessWidget {
  final String img;
  final String title;
  final String description;
  final Color bgClr;
  const PageBody({
    super.key,
    required this.img,
    required this.title,
    required this.description,
    required this.bgClr,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: bgClr,
      child: Column(
        children: [
          addH(100.h),
          SizedBox(
            height: 377.h,
            width: 377.h,
            child: Image.asset(
              img,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 130.h),
          // title text
          SizedBox(
            height: 72.h,
            width: 354.w,
            child: Text(
              title,
              textAlign: TextAlign.left,
              style: TextStyle(
                height: 1.2.h,
                fontWeight: FontWeight.w700,
                fontSize: 28.sp,
                color:
                    // context.isDarkMode ? ConstantColors.kC0C0C4 :
                    ConstantColors.kLightText,
              ),
            ),
          ),
          // description text
          SizedBox(
            height: 56.h,
            width: 354.w,
            child: Text(
              description,
              textAlign: TextAlign.start,
              style: TextStyle(
                height: 1.2.h,
                color: Colors.grey.shade200,
                fontSize: 16.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
