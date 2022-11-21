import 'package:dogventurehq/states/models/product.dart';
import 'package:dogventurehq/ui/screens/purchase/place_order_item_design.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class SelectionProductList extends StatefulWidget {
  final String token;
  final bool dFlag;
  final Function(int) totalQty;
  final Function(int) totalAmount;
  const SelectionProductList({
    super.key,
    required this.token,
    required this.dFlag,
    required this.totalQty,
    required this.totalAmount,
  });

  @override
  State<SelectionProductList> createState() => _SelectionProductListState();
}

class _SelectionProductListState extends State<SelectionProductList> {
  final List<ProductModel> _products = List.empty(growable: true);
  final ProductModel _dummyProduct = ProductModel(
    id: 0,
    productNo: 'prod',
    name: 'Select Product',
    url: 'fjlk',
    categoryId: 'kjl',
    brandId: 'fdfdk',
    unitId: 'kjdlaf',
    warrantyId: 'lkjdla',
    dpPrice: 0,
    rpPrice: 0,
    mrpPrice: 0,
    qty: 1,
    remarks: 'k good',
    liftingPrice: 0,
  );

  int _totalQty = 0;
  int _totalAmount = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      primary: false,
      shrinkWrap: true,
      padding: EdgeInsets.only(bottom: 15.h),
      children: _products.map((e) {
        return InkWell(
          onTap: () {},
          child: PlaceOrderItemDesign(
            deleteFn: () => setState(
              () => _products.remove(e),
            ),
            pItem: e,
            productSelectFn: (value) => setState(() {
              _products[_products.indexOf(e)] = value;

              // int tAmount = 0;
              // for(ProductModel item in _products) {
              //   tAmount =
              // }
              // widget.totalQty(_)
            }),
            qtyCngFn: () => setState(() {
              _totalQty = 0;
              _totalAmount = 0;
              for (ProductModel item in _products) {
                _totalQty += item.qty;
                _totalAmount += item.qty * item.mrpPrice;
              }
              widget.totalQty(_totalQty);
              widget.totalAmount(_totalAmount);
            }),
          ),
        );
      }).followedBy([
        InkWell(
          onTap: () => setState(() {
            // TODO: need to add so many logic to prevent multiple empty item
            _products.add(_dummyProduct);
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
