import 'package:dogventurehq/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppbarIcon extends StatelessWidget {
  final String icon;
  final VoidCallback onTapFn;
  const AppbarIcon({
    Key? key,
    required this.icon,
    required this.onTapFn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapFn,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: SizedBox(
        height: 45.h,
        width: 40.w,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            SvgPicture.asset(
              'assets/svgs/$icon.svg',
              height: 22.h,
              width: 22.h,
              color:
                  // context.isDarkMode ? ConstantColors.kC0C0C4 :
                  ConstantColors.kLightText,
            ),
          ],
        ),
      ),
    );
  }
}
