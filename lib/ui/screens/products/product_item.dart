import 'package:auto_size_text/auto_size_text.dart';
import 'package:dogventurehq/states/utils/methods.dart';
import 'package:dogventurehq/ui/designs/custom_img.dart';
import 'package:dogventurehq/ui/screens/products/product_price.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String pImg;
  final String pName;
  double? pNameW;
  bool? dealerFlag;
  final double dpPrice;
  final double liftingPrice;
  final double rpPrice;
  final double mrpPrice;
  Widget? w1;
  Widget? w2;
  Widget? w3;
  Widget? suffixW;
  ProductItem({
    Key? key,
    required this.pImg,
    required this.pName,
    this.pNameW,
    required this.dpPrice,
    required this.liftingPrice,
    required this.rpPrice,
    required this.mrpPrice,
    this.dealerFlag,
    this.w1,
    this.w2,
    this.w3,
    this.suffixW,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      height: 90.h,
      padding: EdgeInsets.all(10.w),
      margin: EdgeInsets.only(top: 10.w),
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
            child: Center(
              child: CustomImg(
                imgUrl: pImg,
              ),
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
                    SizedBox(
                      width: pNameW ?? 315.w,
                      height: 45.h,
                      child: AutoSizeText(
                        pName,
                        minFontSize: 10,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    if (suffixW != null) suffixW!
                  ],
                ),
              ),
              SizedBox(
                width: 315.w,
                child: Row(
                  children: [
                    w1 != null
                        ? w1!
                        : Flexible(
                            child: ProductPrice(
                              prefix: dealerFlag != null ? 'DP' : 'Lifting',
                              price: Methods.getFormatedPrice(
                                dealerFlag != null ? dpPrice : liftingPrice,
                              ),
                              txtClr: Colors.red,
                            ),
                          ),
                    w2 != null
                        ? w2!
                        : Flexible(
                            child: ProductPrice(
                              prefix: 'RP',
                              price: Methods.getFormatedPrice(rpPrice),
                              txtClr: Colors.blue,
                            ),
                          ),
                    w3 != null
                        ? w3!
                        : Flexible(
                            child: ProductPrice(
                              prefix: 'MRP',
                              price: Methods.getFormatedPrice(mrpPrice),
                              txtClr: Colors.green,
                            ),
                          ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
