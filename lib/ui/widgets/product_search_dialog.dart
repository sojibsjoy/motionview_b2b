import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/controllers/utility.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/states/models/login.dart';
import 'package:dogventurehq/states/models/product.dart';
import 'package:dogventurehq/ui/designs/custom_field.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductSearchDialog extends StatefulWidget {
  final Function(ProductModel) onSelectFn;
  const ProductSearchDialog({
    Key? key,
    required this.onSelectFn,
  }) : super(key: key);

  @override
  State<ProductSearchDialog> createState() => _ProductSearchDialogState();
}

class _ProductSearchDialogState extends State<ProductSearchDialog> {
  final UtilityController _uCon = Get.find<UtilityController>();
  final TextEditingController _searchCon = TextEditingController();
  bool _isSearching = false;
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
            "Select Product",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          addH(10.h),
          CustomField(
            textCon: _searchCon,
            hintText: 'Search products by name...',
            onCngdFn: (value) {
              if (value.length >= 2) {
                _uCon.getAllProducts(
                  token: _usrInfo.data.token,
                  dealerFlag: _dFlag,
                  search: value,
                );
                _isSearching = true;
              } else {
                _uCon.productsModel = null;
              }
            },
          ),
          addH(10.h),
          Expanded(
            child: SizedBox(
              width: 388.w,
              child: Obx(() {
                if (_uCon.productsLoading.value) {
                  return Center(
                    child: _isSearching
                        ? const CircularProgressIndicator()
                        : const SizedBox.shrink(),
                  );
                } else {
                  if (_uCon.productsModel == null &&
                      _uCon.productsModel!.data.isEmpty) {
                    return Text(ConstantStrings.kNoData);
                  } else {
                    return ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: _uCon.productsModel!.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            widget.onSelectFn(
                              _uCon.productsModel!.data[index],
                            );
                            Get.back();
                          },
                          child: Container(
                            height: 50.h,
                            padding: EdgeInsets.all(10.w),
                            margin: EdgeInsets.only(bottom: 10.h),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Text(
                              _uCon.productsModel!.data[index].name,
                            ),
                          ),
                        );
                      },
                    );
                  }
                }
              }),
            ),
          )
        ],
      ),
    );
  }
}
