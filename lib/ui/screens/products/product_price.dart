import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductPrice extends StatelessWidget {
  final String prefix;
  final String price;
  final Color txtClr;
  const ProductPrice({
    Key? key,
    required this.prefix,
    required this.price,
    required this.txtClr,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          margin: EdgeInsets.only(right: 5.w),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(5.r),
          ),
          child: Text(
            prefix,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Text(
          price,
          style: TextStyle(
            fontSize: 12.sp,
            color: txtClr,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
