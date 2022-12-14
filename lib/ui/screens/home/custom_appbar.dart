import 'package:auto_size_text/auto_size_text.dart';
import 'package:dogventurehq/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/route_manager.dart';

class CustomAppbar extends StatelessWidget {
  String? title;
  bool? noMargin;
  Widget? logo;
  Widget? suffixWidget;
  VoidCallback? backBtnFn;
  CustomAppbar({
    Key? key,
    this.title,
    this.logo,
    this.suffixWidget,
    this.noMargin,
    this.backBtnFn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 63.h,
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 10.h,
      ),
      margin:
          noMargin != null ? EdgeInsets.zero : EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
        // color: Colors.grey.shade200,
        // borderRadius: BorderRadius.vertical(
        //   bottom: Radius.circular(20.r),
        // ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Drawer menu
          SizedBox(
            width: 100.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: ZoomDrawer.of(context) == null
                      ? backBtnFn ?? () => Get.back()
                      : () => ZoomDrawer.of(context)!.toggle(),
                  child: ZoomDrawer.of(context) == null
                      ? const Icon(
                          Icons.arrow_back,
                          size: 25,
                        )
                      : SvgPicture.asset(
                          'assets/svgs/menu.svg',
                          height: 15.h,
                          width: 20.w,
                          fit: BoxFit.contain,
                          color:
                              //  context.isDarkMode ? ConstantColors.kC0C0C4 :
                              ConstantColors.kLightText,
                        ),
                ),
              ],
            ),
          ),
          if (logo == null)
            SizedBox(
              width: 185.w,
              child: Center(
                child: AutoSizeText(
                  title ?? 'Appbar',
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          if (logo != null) logo!,
          SizedBox(
            width: 100.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (suffixWidget != null) suffixWidget!,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
