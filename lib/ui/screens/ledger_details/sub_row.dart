import 'package:dogventurehq/constants/colors.dart';
import 'package:dogventurehq/ui/screens/home/custom_appbar.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SubRow extends StatelessWidget {
  final String icon;
  final String txt;
  const SubRow({
    Key? key,
    required this.icon,
    required this.txt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/svgs/$icon.svg',
          height: 15,
          color: Colors.amber,
          fit: BoxFit.fitHeight,
        ),
        addW(5.w),
        Text(
          txt,
          style: const TextStyle(
            color: Colors.amber,
          ),
        ),
        addW(5.w),
      ],
    );
  }
}
