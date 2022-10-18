import 'package:dogventurehq/constants/colors.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final String titleTxt;
  String? subTitleTxt;
  final int qty;
  final double discount;
  ListItem({
    Key? key,
    required this.titleTxt,
    this.subTitleTxt,
    required this.qty,
    required this.discount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100.h,
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
            margin: EdgeInsets.only(right: 10.w),
            color: Colors.indigo,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                titleTxt,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (subTitleTxt != null)
                Text(
                  subTitleTxt!,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              SizedBox(
                width: 305.w,
                child: Row(
                  children: [
                    Text(
                      'QTY: $qty',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    addW(10.w),
                    Text(
                      'Discount: $discount%',
                      style: TextStyle(
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
