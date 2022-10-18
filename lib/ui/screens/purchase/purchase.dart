import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/ui/screens/home/custom_appbar.dart';
import 'package:dogventurehq/ui/screens/home/searchbar_design.dart';
import 'package:dogventurehq/ui/screens/purchase/con_row.dart';
import 'package:dogventurehq/ui/screens/purchase/pending_order_view.dart';
import 'package:dogventurehq/ui/screens/purchase/place_order_nav_bar.dart';
import 'package:dogventurehq/ui/screens/purchase/place_order_view.dart';
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
  final TextEditingController _remarksCon = TextEditingController();
  final List<String> _btnTxts = [
    'Place Order',
    'Pending Orders',
    'Shipped Orders',
    'Purchase History',
    'Pre-Order',
  ];

  int _selectedBtnIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // appbar
            CustomAppbar(title: 'Purchase'),
            // btn list
            RowItem(
              itemList: _btnTxts,
              onTapFn: (value) => setState(() => _selectedBtnIndex = value),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: _selectedBtnIndex == 0 ? 20.w : 0,
                  ),
                  child: getBodyView(),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: PlaceOrderNavBar(
        enableFlag: _selectedBtnIndex == 0,
        remarksCon: _remarksCon,
      ),
    );
  }

  Widget getBodyView() {
    switch (_selectedBtnIndex) {
      case 0:
        return const PlaceOrderView();
      case 1:
      case 2:
      case 3:
        return const PendingOrderView();
      default:
        return Padding(
          padding: EdgeInsets.only(top: 350.h),
          child: Text(
            ConstantStrings.kNoData,
          ),
        );
    }
  }
}
