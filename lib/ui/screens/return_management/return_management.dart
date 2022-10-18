import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/utils/methods.dart';
import 'package:dogventurehq/ui/designs/custom_btn.dart';
import 'package:dogventurehq/ui/screens/home/searchbar_design.dart';
import 'package:dogventurehq/ui/screens/ledger_details/statement_sheet.dart';
import 'package:dogventurehq/ui/screens/purchase/flexible_widget.dart';
import 'package:dogventurehq/ui/screens/return_management/top_con.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:dogventurehq/ui/widgets/nav_total_view.dart';
import 'package:dogventurehq/ui/widgets/row_btn.dart';
import 'package:dogventurehq/ui/widgets/selection_product_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dogventurehq/ui/screens/home/custom_appbar.dart';
import 'package:flutter/material.dart';

class ReturnManagementScreen extends StatefulWidget {
  static String routeName = '/return_management';
  const ReturnManagementScreen({super.key});

  @override
  State<ReturnManagementScreen> createState() => _ReturnManagementScreenState();
}

class _ReturnManagementScreenState extends State<ReturnManagementScreen> {
  final TextEditingController remarksCon = TextEditingController();
  final bool _dealerProfile = true;
  bool _toMotionView = true;

  int _selectedBtnIndex = 0;

  final List<String> _btnTxts = [
    'Purchase Return',
    'Pending List',
    'Return Statement',
    'Return Products',
  ];

  final List<String> _purchaseStatementTitles = [
    'SL',
    'Date',
    'Order ID',
    'Amount',
    'Action',
  ];

  final List<List<String>> _purchaseStatementData = [
    [
      '01',
      '02',
      '03',
      '04',
      '05',
      '06',
      '07',
      '08',
      '09',
      '10',
    ],
    [
      '10/9/22',
      '11/9/22',
      '12/9/22',
      '13/9/22',
      '14/9/22',
      '15/9/22',
      '16/9/22',
      '17/9/22',
      '18/9/22',
      '19/9/22',
    ],
    [
      'MV-OSD 32612',
      'MV-OSD 32612',
      'MV-OSD 32612',
      'MV-OSD 32612',
      'MV-OSD 32612',
      'MV-OSD 32612',
      'MV-OSD 32612',
      'MV-OSD 32612',
      'MV-OSD 32612',
      'MV-OSD 32612',
    ],
    [
      '36999',
      '36999',
      '36999',
      '36999',
      '36999',
      '36999',
      '36999',
      '36999',
      '36999',
      '36999',
    ],
    [
      'View Details',
      'View Details',
      'View Details',
      'View Details',
      'View Details',
      'View Details',
      'View Details',
      'View Details',
      'View Details',
      'View Details',
    ],
  ];

  final List<String> _returnedProductsTitles = [
    'SL',
    'Products Name',
    'QTY',
    'Value'
  ];

  final List<List<String>> _returnedProductsData = [
    ['01', '02', '03', '04'],
    [
      'Amazfit band 7 Smart Fitness',
      'Amazfit band 8 Smart Fitness',
      'Amazfit band 9 Smart Fitness',
      'Amazfit band 10 Smart Fitness',
    ],
    ['5', '12', '36', '21'],
    ['36999', '36999', '36999', '36999']
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // appbar
            CustomAppbar(
              title: 'Return Management',
              noMargin: true,
            ),
            // to motion view or from retailer
            if (_dealerProfile)
              Container(
                color: Colors.grey.shade200,
                child: Row(
                  children: [
                    TopCon(
                      txt: 'To Motion View',
                      showBtmBrdr: _toMotionView,
                      onTapFn: () => setState(() => _toMotionView = true),
                    ),
                    Container(
                      height: 30.h,
                      width: 1.w,
                      margin: EdgeInsets.symmetric(horizontal: 5.w),
                      color: Colors.grey.shade400,
                    ),
                    TopCon(
                      txt: 'From Retailer',
                      showBtmBrdr: !_toMotionView,
                      onTapFn: () => setState(() => _toMotionView = false),
                    ),
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
            if (_selectedBtnIndex != 0) const SearchbarDesign(),
            addH(10.h),
            // body
            getBodyView(),
          ],
        ),
      ),
      bottomNavigationBar: getNavView(),
    );
  }

  Widget getBodyView() {
    switch (_selectedBtnIndex) {
      case 0:
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: const SelectionProductList(),
        );
      case 1:
      case 2:
        return StatementSheet(
          statementTitleList: _purchaseStatementTitles,
          statementData: _purchaseStatementData,
          formatIndexNos: const [3],
          txtClrIndex: 4,
          onTapIndex: 4,
        );
      case 3:
        return StatementSheet(
          statementTitleList: _returnedProductsTitles,
          statementData: _returnedProductsData,
          flxIndexNo: 1,
          flx: 3,
          formatIndexNos: const [3],
        );
      default:
        return Padding(
          padding: EdgeInsets.only(top: 300.h),
          child: Text(ConstantStrings.kNoData),
        );
    }
  }

  Widget getNavView() {
    switch (_selectedBtnIndex) {
      case 0:
        return Container(
          height: 205.h,
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
            vertical: 20.h,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 20,
                spreadRadius: 5,
              )
            ],
          ),
          child: Wrap(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const FlexibleWidget(
                        flx: 1,
                        txt: 'Total QTY',
                        value: 'QTY',
                      ),
                      addW(5.w),
                      const FlexibleWidget(
                        flx: 2,
                        txt: 'Total Amount',
                        value: 'Total Amount',
                      ),
                    ],
                  ),
                  addH(20.h),
                  Center(
                    child: CustomBtn(
                      onPressedFn: () {},
                      btnTxt: 'Confirm Order',
                      btnBroderRadius: 10.r,
                      btnSize: Size(double.infinity, 55.h),
                    ),
                  )
                ],
              ),
            ],
          ),
        );
        {}
      case 1:
        return const NavTotalView(
          txt: 'Total Amount: 1,25,69,990',
        );
      case 2:
        return const NavTotalView(
          txt: 'Total Amount: 1,35,69,990',
        );
      case 3:
        int totalQty = 0;
        double totalAmount = 0;
        for (int i = 0; i < _returnedProductsData[0].length; i++) {
          totalQty += int.parse(_returnedProductsData[2][i]);
          totalAmount += double.parse(_returnedProductsData[3][i]);
        }

        return NavTotalView(
          txt:
              'Total QTY: $totalQty  |  Total Amount: ${Methods.getFormatedPrice(totalAmount.round())}',
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
