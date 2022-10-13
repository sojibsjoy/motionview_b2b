import 'package:dogventurehq/constants/colors.dart';
import 'package:dogventurehq/ui/screens/home/custom_appbar.dart';
import 'package:dogventurehq/ui/screens/home/searchbar_design.dart';
import 'package:dogventurehq/ui/screens/ledger_details/statement_body.dart';
import 'package:dogventurehq/ui/screens/ledger_details/sub_row.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:dogventurehq/ui/widgets/row_btn.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class LedgerDetailsScreen extends StatefulWidget {
  static String routeName = '/ledger_details';
  const LedgerDetailsScreen({super.key});

  @override
  State<LedgerDetailsScreen> createState() => _LedgerDetailsScreenState();
}

class _LedgerDetailsScreenState extends State<LedgerDetailsScreen> {
  final List<String> _btnTxts = [
    'Statement',
    'Purchase Statement',
    'Payment Statement',
    'Return Statement',
    'Sold Products',
  ];

  int _selectedBtnIndex = 0;

  List<List<String>> soldProducts = [
    [
      'Amazfit band 7 Smart Fitness',
      'Amazfit band 8 Smart Fitness',
      'Amazfit band 9 Smart Fitness',
      'Amazfit band 10 Smart Fitness',
    ],
    ['5', '12', '36', '21'],
    ['36,999', '36,999', '36,999', '36,999']
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // appbar
            CustomAppbar(title: 'Ledger Details'),
            // party info box
            Container(
              width: double.infinity,
              height: 100.h,
              color: ConstantColors.k1D3557,
              child: Row(
                children: [
                  // party image
                  Container(
                    width: 60.w,
                    height: 55.h,
                    margin: EdgeInsets.all(20.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(3.r),
                    ),
                  ),
                  // party details
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // party name
                      Text(
                        'Star Tech Ltd.',
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      addH(5.h),
                      // location and phone number
                      Row(
                        children: const [
                          SubRow(icon: 'location', txt: 'Dhaka'),
                          SubRow(icon: 'call', txt: '01766682044'),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            // btn list
            RowItem(
              itemList: _btnTxts,
              onTapFn: (value) => setState(() => _selectedBtnIndex = value),
            ),
            addH(10.h),
            // search bar
            const SearchbarDesign(),
            addH(10.h),
            // statement sheet
            getBodyView(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: 300.w,
        height: 100.h,
        color: Colors.amber,
      ),
    );
  }

  Widget getBodyView() {
    switch (_selectedBtnIndex) {
      case 0:
        return StatementBody(
          titleList: const ['SL', 'Products Name', 'QTY', 'Value'],
          itemList: soldProducts,
          indexNo: 1,
          indexWidth: 203.w,
        );
      case 1:
        return StatementBody(
          titleList: const ['SL', 'Products Name', 'QTY', 'Value'],
          itemList: soldProducts,
          indexNo: 1,
          indexWidth: 100.w,
        );
      case 4:
        return StatementBody(
          titleList: const ['SL', 'Products Name', 'QTY', 'Value'],
          itemList: soldProducts,
          indexNo: 1,
          indexWidth: 203.w,
        );
      default:
        return StatementBody(
          titleList: const ['SL', 'Products Name', 'QTY', 'Value'],
          itemList: soldProducts,
          indexNo: 1,
          indexWidth: 100.w,
        );
    }
  }
}
