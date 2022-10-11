import 'package:dogventurehq/constants/colors.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomBtn extends StatelessWidget {
  final VoidCallback onPressedFn;
  final String btnTxt;
  double? txtSize;
  FontWeight? txtWeight;
  Size? btnSize;
  Color? btnColor;
  Color? txtColor;
  Color? btnBorderColor;
  double? btnBroderRadius;
  String? btnIcon;
  CustomBtn({
    Key? key,
    required this.onPressedFn,
    required this.btnTxt,
    this.txtSize,
    this.txtWeight,
    this.btnSize,
    this.btnColor,
    this.txtColor,
    this.btnBorderColor,
    this.btnBroderRadius,
    this.btnIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressedFn,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        fixedSize: MaterialStateProperty.all(
          btnSize ?? Size(354.w, 58.h),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          btnColor ?? ConstantColors.primaryColor,
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(btnBroderRadius ?? 5),
            side: BorderSide(
              color: btnBorderColor ?? ConstantColors.primaryColor,
              width: 1.0,
            ),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (btnIcon != null)
            SvgPicture.asset(
              btnIcon!,
              fit: BoxFit.fill,
            ),
          if (btnIcon != null) addW(5.w),
          Text(
            btnTxt,
            style: TextStyle(
              color: txtColor,
              fontSize: txtSize ?? 22.sp,
              fontWeight: txtWeight ?? FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
