import 'package:dogventurehq/constants/colors.dart';
import 'package:dogventurehq/ui/screens/purchase/dropdown_design.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:dogventurehq/ui/widgets/selection_product_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class PlaceOrderView extends StatefulWidget {
  const PlaceOrderView({super.key});

  @override
  State<PlaceOrderView> createState() => _PlaceOrderViewState();
}

class _PlaceOrderViewState extends State<PlaceOrderView> {
  final List<TextEditingController> _productQtyCon = List.empty(growable: true);
  final List<String> _products = List.empty(growable: true);
  final bool _campaignSelected = false;
  final int _qtyConCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        addH(20.h),
        // eligible campaign
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
        // selected product list
        const SelectionProductList(),
      ],
    );
  }
}
