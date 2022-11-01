import 'package:dogventurehq/ui/screens/home/custom_appbar.dart';
import 'package:dogventurehq/ui/screens/home/searchbar_design.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:dogventurehq/ui/widgets/nav_total_view.dart';
import 'package:dogventurehq/ui/widgets/row_btn.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class StockManagementScreen extends StatefulWidget {
  static String routeName = '/stock_management';
  const StockManagementScreen({super.key});

  @override
  State<StockManagementScreen> createState() => _StockManagementScreenState();
}

class _StockManagementScreenState extends State<StockManagementScreen> {
  final List<String> _btnTxts = [
    'Stock',
    'EOL',
  ];
  int _selectedBtnIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // appbar
            CustomAppbar(title: 'Stock Management'),
            // stock & eol btn
            RowItem(
              itemList: _btnTxts,
              onTapFn: (value) => setState(() => _selectedBtnIndex = value),
            ),
            addH(10.h),
            // search bar
            const SearchbarDesign(),
            // stock list
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: 10,
            //     shrinkWrap: true,
            //     itemBuilder: (BuildContext context, int index) {
            //       return ProductItem(
            //         w1: const ProductPrice(
            //           prefix: 'Lifting',
            //           price: '40,890',
            //           txtClr: Colors.red,
            //         ),
            //         w2: const ProductPrice(
            //           prefix: 'RP',
            //           price: '43,990',
            //           txtClr: Colors.blue,
            //         ),
            //         w3: const ProductPrice(
            //           prefix: 'MRP',
            //           price: '49,990',
            //           txtClr: Colors.green,
            //         ),
            //         suffixW: RichText(
            //           text: TextSpan(
            //             text: 'Stock ',
            //             style: TextStyle(
            //               fontSize: 8,
            //               color: ConstantColors.primaryColor,
            //             ),
            //             children: [
            //               TextSpan(
            //                 text: '500',
            //                 style: TextStyle(
            //                   fontSize: 10,
            //                   color: ConstantColors.primaryColor,
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
      bottomNavigationBar: const NavTotalView(
        txt: 'Total Stock: 1,290  |  Total Amount: 80,000',
      ),
    );
  }
}
