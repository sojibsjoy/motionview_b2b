import 'package:dogventurehq/states/controllers/sale_out.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/states/models/login.dart';
import 'package:dogventurehq/states/models/purchased_product.dart';
import 'package:dogventurehq/ui/designs/custom_field.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductSearchDialog extends StatefulWidget {
  final Function(PurchasedProduct) onSelectFn;
  const ProductSearchDialog({
    Key? key,
    required this.onSelectFn,
  }) : super(key: key);

  @override
  State<ProductSearchDialog> createState() => _ProductSearchDialogState();
}

class _ProductSearchDialogState extends State<ProductSearchDialog> {
  final SaleOutController _soCon = Get.find<SaleOutController>();
  final TextEditingController _searchCon = TextEditingController();
  final bool _isSearching = false;
  late LoginModel _usrInfo;
  bool _dFlag = false;
  @override
  void initState() {
    _usrInfo = Preference.getUserDetails();
    _dFlag = Preference.getDealerFlag();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 430.h,
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        children: [
          Text(
            "Available Product",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          addH(10.h),
          // number field
          CustomField(
            textCon: _searchCon,
            hintText: 'Search products by name...',
            inputType: TextInputType.number,
            onCngdFn: (value) {
              // if (value.length >= 2) {
              //   _soCon.getAllProducts(
              //     token: _usrInfo.data.token,
              //     dealerFlag: _dFlag,
              //     search: value,
              //   );
              //   _isSearching = true;
              // } else {
              //   _soCon.productsModel = null;
              // }
            },
          ),
          addH(10.h),
          Expanded(
            child: SizedBox(
              width: 388.w,
              child: ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: _soCon.pProductsModel!.purchasedProducts.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      widget.onSelectFn(
                        _soCon.pProductsModel!.purchasedProducts[index],
                      );
                      Get.back();
                    },
                    child: Container(
                      height: 65.h,
                      padding: EdgeInsets.all(10.w),
                      margin: EdgeInsets.only(bottom: 10.h),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Text(
                        _soCon.pProductsModel!.purchasedProducts[index].name,
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
