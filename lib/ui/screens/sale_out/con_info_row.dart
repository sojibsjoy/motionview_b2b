import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConInfoRow extends StatelessWidget {
  final String prefixTxt;
  final String suffixTxt;
  const ConInfoRow({
    Key? key,
    required this.prefixTxt,
    required this.suffixTxt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            prefixTxt,
          ),
        ),
        const Text(':'),
        addW(20.w),
        Expanded(
          child: Text(
            suffixTxt,
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}
