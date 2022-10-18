import 'package:dogventurehq/ui/screens/products/product_price.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  Widget? w1;
  Widget? w2;
  Widget? w3;
  Widget? suffixW;
  ProductItem({
    Key? key,
    this.w1,
    this.w2,
    this.w3,
    this.suffixW,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      height: 80.h,
      padding: EdgeInsets.all(10.w),
      margin: EdgeInsets.all(10.h),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Row(
        children: [
          // product image
          Container(
            width: 60.w,
            height: 60.h,
            margin: EdgeInsets.only(right: 10.w),
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(5.r),
            ),
          ),
          // product details
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // product name
              SizedBox(
                width: 315.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(
                      child: Text(
                        'Amazfit GTS 4 Mini Smartwatch',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    if (suffixW != null) suffixW!
                  ],
                ),
              ),
              Row(
                children: [
                  w1 != null
                      ? w1!
                      : const ProductPrice(
                          prefix: 'DP',
                          price: '40,890',
                          txtClr: Colors.red,
                        ),
                  addW(10.w),
                  w2 != null
                      ? w2!
                      : const ProductPrice(
                          prefix: 'RP',
                          price: '43,990',
                          txtClr: Colors.blue,
                        ),
                  addW(10.w),
                  w3 != null
                      ? w3!
                      : const ProductPrice(
                          prefix: 'MRP',
                          price: '49,990',
                          txtClr: Colors.green,
                        ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
