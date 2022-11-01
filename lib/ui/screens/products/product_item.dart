import 'package:auto_size_text/auto_size_text.dart';
import 'package:dogventurehq/states/models/products.dart';
import 'package:dogventurehq/states/utils/methods.dart';
import 'package:dogventurehq/ui/screens/products/product_price.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  ProductModel pModel;
  bool? dealerFlag;
  Widget? w1;
  Widget? w2;
  Widget? w3;
  Widget? suffixW;
  ProductItem({
    Key? key,
    required this.pModel,
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
                      width: 315.w,
                      height: 45.h,
                      child: AutoSizeText(
                        pModel.name,
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
              Row(
                children: [
                  w1 != null
                      ? w1!
                      : ProductPrice(
                          prefix: dealerFlag != null ? 'DP' : 'Lifting',
                          price: Methods.getFormatedPrice(
                            dealerFlag != null
                                ? pModel.dpPrice
                                : pModel.liftingPrice,
                          ),
                          txtClr: Colors.red,
                        ),
                  addW(10.w),
                  w2 != null
                      ? w2!
                      : ProductPrice(
                          prefix: 'RP',
                          price: Methods.getFormatedPrice(pModel.rpPrice),
                          txtClr: Colors.blue,
                        ),
                  addW(10.w),
                  w3 != null
                      ? w3!
                      : ProductPrice(
                          prefix: 'MRP',
                          price: Methods.getFormatedPrice(pModel.mrpPrice),
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
