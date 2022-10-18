import 'package:dogventurehq/ui/screens/purchase/place_order_item_design.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class SelectionProductList extends StatefulWidget {
  const SelectionProductList({super.key});

  @override
  State<SelectionProductList> createState() => _SelectionProductListState();
}

class _SelectionProductListState extends State<SelectionProductList> {
  final List<TextEditingController> _productQtyCon = List.empty(growable: true);
  final List<String> _products = List.empty(growable: true);
  int _qtyConCounter = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      primary: false,
      shrinkWrap: true,
      padding: EdgeInsets.only(bottom: 15.h),
      children: _products.map((e) {
        return InkWell(
            child: PlaceOrderItemDesign(
          index: _products.indexOf(e),
          deleteFn: () => setState(() {
            // TODO: add logic to delete an specific item
            _products.remove(e);
            _qtyConCounter--;
          }),
          unitPrice: e,
          textCon: _productQtyCon[_products.indexOf(e)],
        ));
      }).followedBy([
        InkWell(
          onTap: () => setState(() {
            // TODO: need to add so many logic to prevent multiple empty item
            _qtyConCounter++;
            _productQtyCon.add(TextEditingController());
            _products.add('1000');
          }),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Center(
            child: Container(
              width: 200.w,
              height: 45.w,
              margin: EdgeInsets.only(top: 10.h),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Center(
                child: Text(
                  _products.isEmpty ? 'Add Product' : 'Add More',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
      ]).toList(),
    );
  }
}
