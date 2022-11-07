import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class FieldTitle extends StatelessWidget {
  final String txt;
  const FieldTitle({
    Key? key,
    required this.txt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
