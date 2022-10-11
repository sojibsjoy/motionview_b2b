import 'package:dogventurehq/ui/screens/products/product_price.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
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
              const Text(
                'Amazfit GTS 4 Mini Smartwatch',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                children: [
                  const ProductPrice(
                    prefix: 'DP',
                    price: '40,890',
                    txtClr: Colors.red,
                  ),
                  addW(10.w),
                  const ProductPrice(
                    prefix: 'RP',
                    price: '43,990',
                    txtClr: Colors.blue,
                  ),
                  addW(10.w),
                  const ProductPrice(
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
