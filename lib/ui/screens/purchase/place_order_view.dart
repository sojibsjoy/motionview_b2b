import 'package:dogventurehq/constants/colors.dart';
import 'package:dogventurehq/states/controllers/purchase.dart';
import 'package:dogventurehq/states/models/utility/payment_methods.dart';
import 'package:dogventurehq/ui/designs/custom_field.dart';
import 'package:dogventurehq/ui/screens/purchase/dropdown_design.dart';
import 'package:dogventurehq/ui/utility/payment_methods_dd.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class PlaceOrderView extends StatefulWidget {
  final PurchaseController pCon;
  const PlaceOrderView({
    super.key,
    required this.pCon,
  });

  @override
  State<PlaceOrderView> createState() => _PlaceOrderViewState();
}

class _PlaceOrderViewState extends State<PlaceOrderView> {
  final TextEditingController _dAddCon = TextEditingController();
  final List<TextEditingController> _productQtyCon = List.empty(growable: true);
  final List<String> _products = List.empty(growable: true);
  final bool _campaignSelected = false;
  final int _qtyConCounter = 0;

  List<String> pMethods = [
    'via Bank',
    'via ATM',
    'via Cash',
    'via Nagad',
  ];
  PaymentMethod? _selectedMethods;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        addH(20.h),
        // only for dealer
        // eligible campaign
        const Text('Campaign Type'),
        addH(10.h),
        // campaign dropdown and info btn
        DropdownDesign(
          title: 'Select Campaign',
          ddWidth: 388.w,
        ),
        addH(20.h),
        // eligible campaign
        const Text('Available Campaigns'),
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
        const Text('Payment Methods'),
        addH(10.h),
        PaymentMethodsDD(
          getMethods: (value) => setState(
            () => _selectedMethods = value,
          ),
        ),
        addH(20.h),
        const Text('Delivery Address (Optional)'),
        addH(10.h),
        CustomField(
          textCon: _dAddCon,
          hintText: 'Ex: 10/95 Eastern Plaza, Hatirpool, Dhaka',
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     // payment method
        //     Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         const Text('Payment Methods'),
        //         addH(10.h),
        //         Obx(() {
        //           if (widget.pCon.pmLoading.value) {
        //             return DropdownDesign(
        //               title: 'Loading...',
        //               ddWidth: 190.w,
        //             );
        //           } else {
        //             if (widget.pCon.pmModel == null ||
        //                 widget.pCon.pmModel!.data.isEmpty) {
        //               return DropdownDesign(
        //                 title: 'No Methods Found!',
        //                 ddWidth: 190.w,
        //               );
        //             } else {
        //               return CustomDD(
        //                 givenValue: _selectedMethods,
        //                 hintTxt: 'Select Methods',
        //                 ddWidth: 190.w,
        //                 items: widget.pCon.pmModel!.data.map((e) {
        //                   return Methods.getDDMenuItem(
        //                     item: e,
        //                     txt: e.name,
        //                   );
        //                 }).toList(),
        //                 onChangedFn: (value) => setState(
        //                   () => _selectedMethods = value,
        //                 ),
        //               );
        //             }
        //           }
        //         }),
        //         // DropdownDesign(
        //         //   title: 'via Bank',
        //         //   ddWidth: 190.w,
        //         // ),
        //       ],
        //     ),
        //     // delivery store
        //     Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         const Text('Delivery Address'),
        //         addH(10.h),
        //         DropdownDesign(
        //           title: 'Store 1',
        //           ddWidth: 190.w,
        //         ),
        //       ],
        //     ),
        //   ],
        // ),
        addH(10.h),
        const Divider(thickness: 1),
        addH(10.h),
        // selected product list
        // const SelectionProductList(),
      ],
    );
  }
}
