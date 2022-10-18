import 'package:dogventurehq/ui/screens/home/custom_appbar.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:dogventurehq/ui/widgets/row_btn.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class ConItem extends StatelessWidget {
  final String txt;
  Color? txtClr;
  ConItem({
    Key? key,
    required this.txt,
    this.txtClr,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text(
          txt,
          style: TextStyle(
            color: txtClr ?? Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
