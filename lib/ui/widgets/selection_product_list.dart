import 'package:dogventurehq/states/models/purchased_product.dart';
import 'package:dogventurehq/states/utils/methods.dart';
import 'package:dogventurehq/ui/screens/purchase/place_order_item_design.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class SelectionProductList extends StatefulWidget {
  final String token;
  final bool dFlag;
  final Function(int) totalQty;
  final Function(int) totalAmount;
  final Function(List<PurchasedProduct>) allProducts;
  const SelectionProductList({
    super.key,
    required this.token,
    required this.dFlag,
    required this.totalQty,
    required this.allProducts,
    required this.totalAmount,
  });

  @override
  State<SelectionProductList> createState() => _SelectionProductListState();
}

class _SelectionProductListState extends State<SelectionProductList> {
  final List<PurchasedProduct> _products = List.empty(growable: true);
  final PurchasedProduct _dummyProduct = PurchasedProduct(
    id: 0,
    productNo: "Unknown",
    name: 'Select Product',
    warrantyId: 'Unknown',
    rpPrice: 0,
    mrpPrice: 0,
    remarks: 'Unknown',
    qty: 1,
    slNos: [],
    selectedSlNos: List.empty(growable: true),
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
            iNo: _products.indexOf(e),
            deleteFn: () => setState(() {
              _products.remove(e);
              updateAllValues();
            }),
            pItem: e,
            productSelectFn: (value) => setState(() {
              if (_products[_products.indexOf(e)] != value &&
                  !_products.contains(value)) {
                _products[_products.indexOf(e)] = value;
              } else {
                Future.delayed(
                  const Duration(milliseconds: 400),
                  () => Methods.showSnackbar(
                    title: 'Item already added!',
                    msg: 'Please just update the quantity of that product.',
                  ),
                );
              }
            }),
            qtyCngFn: () => setState(() => updateAllValues()),
          ),
        );
      }).followedBy([
        InkWell(
          onTap: () => setState(() {
            _products.add(_dummyProduct);
            updateAllValues();
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

  void updateAllValues() {
    _totalQty = 0;
    _totalAmount = 0;
    for (PurchasedProduct item in _products) {
      _totalQty += item.qty;
      _totalAmount += item.qty * item.mrpPrice;
    }
    widget.totalQty(_totalQty);
    widget.totalAmount(_totalAmount);
    widget.allProducts(_products);
  }
}
