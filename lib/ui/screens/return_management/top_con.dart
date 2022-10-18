import 'package:dogventurehq/ui/widgets/row_btn.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dogventurehq/ui/screens/home/custom_appbar.dart';
import 'package:flutter/material.dart';

class TopCon extends StatelessWidget {
  final String txt;
  final bool showBtmBrdr;
  final VoidCallback onTapFn;
  const TopCon({
    Key? key,
    required this.txt,
    required this.showBtmBrdr,
    required this.onTapFn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: InkWell(
        onTap: onTapFn,
        child: Container(
          height: 60.h,
          decoration: BoxDecoration(
            border: Border(
              bottom: showBtmBrdr
                  ? const BorderSide(
                      color: Colors.blue,
                      width: 3,
                    )
                  : BorderSide.none,
            ),
          ),
          child: Center(
            child: Text(
              txt,
              style: TextStyle(
                color: showBtmBrdr ? Colors.blue : null,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
