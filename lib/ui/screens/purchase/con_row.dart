import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class ConRow extends StatelessWidget {
  final String prefixTxt1;
  final String prefixTxt2;
  final Widget suffixChild;
  const ConRow({
    Key? key,
    required this.prefixTxt1,
    required this.prefixTxt2,
    required this.suffixChild,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // invoice number
        RichText(
          text: TextSpan(
            text: prefixTxt1,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14.sp,
            ),
            children: [
              TextSpan(
                text: prefixTxt2,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        suffixChild,
      ],
    );
  }
}
