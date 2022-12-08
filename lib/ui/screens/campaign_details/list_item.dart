import 'package:auto_size_text/auto_size_text.dart';
import 'package:dogventurehq/constants/colors.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final String titleTxt;
  String? subTitleTxt;
  String? qty;
  final String discount;
  ListItem({
    Key? key,
    required this.titleTxt,
    this.subTitleTxt,
    this.qty,
    required this.discount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: subTitleTxt == null ? 100.h : 115.h,
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          Container(
            width: 70.w,
            height: 70.h,
            padding: const EdgeInsets.only(left: 5),
            margin: EdgeInsets.only(right: 10.w),
            color: Colors.indigo,
            child: Text(
              titleTxt.substring(0, 2),
              style: TextStyle(
                fontSize: 40.sp,
                color: Colors.white,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 305.w,
                height: 35.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      titleTxt,
                      minFontSize: 8,
                      maxLines: 2,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              if (subTitleTxt != null)
                SizedBox(
                  width: 305.w,
                  height: 30.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        subTitleTxt!,
                        minFontSize: 8,
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              SizedBox(
                width: 305.w,
                child: Row(
                  children: [
                    if (qty != null)
                      Text(
                        'QTY: $qty',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    if (qty != null) addW(10.w),
                    Text(
                      'Discount: $discount',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {},
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Container(
                        width: 70.w,
                        height: 25.h,
                        decoration: BoxDecoration(
                          color: ConstantColors.primaryColor,
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: Center(
                          child: Text(
                            'Order Now',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.sp,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
