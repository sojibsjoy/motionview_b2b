import 'package:dogventurehq/constants/colors.dart';
import 'package:dogventurehq/ui/designs/custom_field.dart';
import 'package:dogventurehq/ui/screens/home/custom_appbar.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:dogventurehq/ui/widgets/row_btn.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class PurchaseScreen extends StatefulWidget {
  static String routeName = '/purchase';
  const PurchaseScreen({super.key});

  @override
  State<PurchaseScreen> createState() => _PurchaseScreenState();
}

class _PurchaseScreenState extends State<PurchaseScreen> {
  final List<String> _btnTxts = [
    'Place Order',
    'Pending Orders',
    'Shipped Orders',
    'Purchase History',
    'Pre-Order',
  ];

  final bool _campaignSelected = false;
  int _selectedBtnIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppbar(
              title: 'Purchase',
            ),
            RowItem(
              itemList: _btnTxts,
              onTapFn: (value) => setState(() => _selectedBtnIndex = value),
            ),
            addH(20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Eligible Campaign'),
                  addH(10.h),
                  // campaign dropdown and info btn
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // campaign dropdown
                      DropdownDesign(
                        title: 'Select Campaign',
                        ddWidth: 320.w,
                      ),
                      // campaign info button
                      Container(
                        height: 48.h,
                        width: 48.w,
                        decoration: BoxDecoration(
                          color: _campaignSelected
                              ? ConstantColors.primaryColor
                              : Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: const Icon(
                          Icons.info_outline,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  addH(20.h),
                  // payment method & delivery address
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // payment method
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Payment Methods'),
                          addH(10.h),
                          DropdownDesign(
                            title: 'via Bank',
                            ddWidth: 190.w,
                          ),
                        ],
                      ),
                      // delivery store
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Delivery Address'),
                          addH(10.h),
                          DropdownDesign(
                            title: 'Store 1',
                            ddWidth: 190.w,
                          ),
                        ],
                      ),
                    ],
                  ),
                  addH(10.h),
                  const Divider(thickness: 1),
                  addH(10.h),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Column(
                      children: [
                        DropdownDesign(title: 'Select Product'),
                        Row(
                          children: [CustomField(textCon: _, hintText: 'Qu')],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DropdownDesign extends StatelessWidget {
  final String title;
  double? ddWidth;
  DropdownDesign({
    Key? key,
    required this.title,
    this.ddWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ddWidth ?? double.infinity,
      height: 48.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.grey.shade800,
              fontSize: 13.sp,
            ),
          ),
          Icon(
            Icons.arrow_drop_down,
            color: Colors.grey.shade800,
          ),
        ],
      ),
    );
  }
}
