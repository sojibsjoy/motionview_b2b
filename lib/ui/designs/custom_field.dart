import 'package:dogventurehq/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomField extends StatefulWidget {
  final TextEditingController textCon;
  String? prefixIcon;
  final String hintText;
  bool? isPassField;
  TextInputType? inputType;
  double? width, height;
  FontWeight? txtFontWeight;
  Color? fillClr;
  Color? brdrClr;
  double? txtSize;
  CustomField({
    Key? key,
    required this.textCon,
    this.prefixIcon,
    required this.hintText,
    this.isPassField,
    this.inputType,
    this.width,
    this.height,
    this.txtFontWeight,
    this.fillClr,
    this.brdrClr,
    this.txtSize,
  }) : super(key: key);

  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  bool obscureText = false;

  @override
  void initState() {
    obscureText = widget.isPassField ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? 388.w,
      height: widget.height ?? 50.h,
      child: TextField(
        cursorColor: ConstantColors.primaryColor,
        style: TextStyle(
          fontSize: widget.txtSize ?? 16.sp,
          // fontFamily: ConstantStrings.kFontFamily,
          fontWeight: widget.txtFontWeight ?? FontWeight.normal,
        ),
        controller: widget.textCon,
        keyboardType: widget.inputType,
        obscureText: obscureText,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          filled: widget.fillClr != null,
          fillColor: widget.fillClr,
          contentPadding: EdgeInsets.only(left: 15.w),
          border: getInputBorder(),
          enabledBorder: getInputBorder(),
          focusedBorder: getInputBorder(),
          prefixIcon: widget.prefixIcon != null
              ? SizedBox(
                  width: 20.w,
                  height: 20.h,
                  child: Center(
                    child: SvgPicture.asset(
                      widget.prefixIcon!,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : null,
          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontSize: widget.txtSize ?? 16.sp,
            // fontFamily: ConstantStrings.kFontFamily,
            color: Colors.grey.shade600,
            fontWeight: widget.txtFontWeight,
          ),
          suffixIcon: widget.isPassField != null
              ? IconButton(
                  onPressed: () => setState(() => obscureText = !obscureText),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  icon: Icon(
                    obscureText
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: Colors.grey.shade600,
                  ),
                )
              : null,
        ),
      ),
    );
  }

  InputBorder getInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: BorderSide(
        color: widget.brdrClr ?? Colors.grey.shade300,
        width: 1,
      ),
    );
  }
}
