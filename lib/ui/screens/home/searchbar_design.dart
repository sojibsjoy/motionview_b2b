import 'package:dogventurehq/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SearchbarDesign extends StatelessWidget {
  const SearchbarDesign({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () => Get.toNamed(SearchScreen.routeName),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        color: context.isDarkMode
            ? ConstantColors.k292E32
            : ConstantColors.kLightTheme,
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 15.w,
            vertical: 5.h,
          ),
          decoration: BoxDecoration(
            color: context.isDarkMode
                ? ConstantColors.k0F1113
                : ConstantColors.kLightTheme2,
            borderRadius: BorderRadius.circular(15.r),
          ),
          padding: EdgeInsets.all(10.h),
          height: 50.h,
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/svgs/search.svg',
                height: 25.h,
                width: 25.w,
                fit: BoxFit.contain,
                color: context.isDarkMode
                    ? ConstantColors.kC0C0C4
                    : ConstantColors.kLightText,
              ),
              SizedBox(width: 5.w),
              Text(
                'Search what you want...',
                style: TextStyle(
                  color:
                      // context.isDarkMode ? ConstantColors.k595E63 :
                      ConstantColors.k595E63,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
