import 'package:dogventurehq/constants/colors.dart';
import 'package:dogventurehq/ui/designs/custom_btn.dart';
import 'package:dogventurehq/ui/designs/custom_field.dart';
import 'package:dogventurehq/ui/screens/home/searchbar_design.dart';
import 'package:dogventurehq/ui/screens/products/product_item.dart';
import 'package:dogventurehq/ui/screens/purchase/purchase.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:dogventurehq/ui/widgets/row_btn.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dogventurehq/ui/screens/home/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsScreen extends StatefulWidget {
  static String routeName = '/products';
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final TextEditingController _pNameCon = TextEditingController();
  final List<String> _btnTxts = [
    'All Products',
    'Trending',
    'New Arrival',
    'Upcoming',
    'Special Requisition',
  ];

  int _selectedBtnIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppbar(
                title: 'Products',
                suffixWidget: const Icon(
                  Icons.menu,
                ),
              ),
              // products btn list
              RowItem(
                itemList: _btnTxts,
                onTapFn: (value) => setState(() => _selectedBtnIndex = value),
              ),
              addH(10.h),
              _selectedBtnIndex != 4
                  ? Column(
                      children: [
                        // search bar
                        const SearchbarDesign(),
                        // product list
                        ListView.builder(
                          itemCount: 10,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return ProductItem();
                          },
                        ),
                      ],
                    )
                  : Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          addH(20.h),
                          const Text('Product Name'),
                          addH(10.h),
                          // product name field
                          CustomField(
                            textCon: _pNameCon,
                            hintText: 'Ex: Amazfit GTR 4 Smartwatch',
                          ),
                          addH(20.h),
                          // color & quantity field
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // color field
                              horizontalField(
                                title: 'Color',
                                hintTxt: 'Ex: Black',
                                txtCon: _pNameCon,
                              ),
                              // quantity field
                              horizontalField(
                                title: 'Required Quantity',
                                hintTxt: 'Ex: 1000',
                                txtCon: _pNameCon,
                              ),
                            ],
                          ),
                          addH(20.h),
                          // asking price field
                          const Text('Asking Price'),
                          addH(10.h),
                          CustomField(
                            textCon: _pNameCon,
                            hintText: 'Ex: 19,000',
                          ),
                          addH(20.h),
                          // web link field
                          const Text('Web Link (if available)'),
                          addH(10.h),
                          CustomField(
                            textCon: _pNameCon,
                            hintText:
                                'Ex: https://motionview.com.bd/product/amazfit-gtr-4-smart-watch-global-version',
                          ),
                          addH(20.h),
                          // photo upload
                          const Text('Upload Photo'),
                          addH(10.h),
                          Container(
                            width: double.infinity,
                            height: 190.h,
                            margin: EdgeInsets.only(right: 10.w),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Icon(
                                  Icons.image,
                                  size: 80,
                                ),
                                const Text(
                                  'Select a photo to upload',
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                ),
                                CustomBtn(
                                  onPressedFn: () {},
                                  btnTxt: 'Browse',
                                  btnColor: Colors.white,
                                  txtSize: 14.sp,
                                  btnBroderRadius: 30.r,
                                  txtColor: ConstantColors.primaryColor,
                                  btnSize: Size(160.w, 36.h),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 50.h,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors:
                // context.isDarkMode  ? ConstantColors.navColorGradiantDark :
                ConstantColors.navColorGradiant,
          ),
        ),
        child: Center(
          child: CustomBtn(
            onPressedFn: _selectedBtnIndex != 4
                ? () => Get.toNamed(PurchaseScreen.routeName)
                : () {},
            btnTxt: _selectedBtnIndex != 4 ? 'Order Now' : 'Submit Now',
            txtSize: 18.sp,
            btnSize: Size(366.w, 48.h),
          ),
        ),
      ),
    );
  }

  Column horizontalField({
    required String title,
    required String hintTxt,
    required TextEditingController txtCon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        addH(10.h),
        SizedBox(
          width: 190.w,
          child: CustomField(
            textCon: txtCon,
            hintText: hintTxt,
          ),
        ),
      ],
    );
  }
}
