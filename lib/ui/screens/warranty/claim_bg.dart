import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class ClaimBg extends StatelessWidget {
  final Widget childW;
  const ClaimBg({
    super.key,
    required this.childW,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            spreadRadius: 3,
            color: Colors.grey.shade300,
          )
        ],
      ),
      child: childW,
    );
  }
}
