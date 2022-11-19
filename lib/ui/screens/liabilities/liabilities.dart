import 'package:dogventurehq/constants/colors.dart';
import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/utils/methods.dart';
import 'package:dogventurehq/ui/screens/home/custom_appbar.dart';
import 'package:dogventurehq/ui/screens/home/searchbar_design.dart';
import 'package:dogventurehq/ui/screens/ledger_details/total_con.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:dogventurehq/ui/widgets/nav_total_view.dart';
import 'package:dogventurehq/ui/widgets/row_btn.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class LiabilitiesScreen extends StatefulWidget {
  static String routeName = '/liabilities';
  const LiabilitiesScreen({super.key});

  @override
  State<LiabilitiesScreen> createState() => _LiabilitiesScreenState();
}

class _LiabilitiesScreenState extends State<LiabilitiesScreen> {
  final List<String> _btnTxts = [
    'Statement',
    'Purchase Statement',
    'Payment Statement',
    'Return Statement',
    'Sold Products',
  ];

  final List<String> _statementTitles = [
    'SL',
    'Date',
    'ID',
    'Dabit',
    'Credit',
    'Balance'
  ];

  final List<String> _purchaseStatementTitles = [
    'SL',
    'Date',
    'Order ID',
    'Amount',
    'Action',
  ];

  final List<String> _paymentStatementTitles = [
    'SL',
    'Date',
    'Payment ID',
    'Amount',
    'Action',
  ];

  final List<String> _returnStatementTitles = [
    'SL',
    'Date',
    'Return ID',
    'Amount',
    'Action',
  ];

  final List<String> _soldProductsTitles = [
    'SL',
    'Products Name',
    'QTY',
    'Value'
  ];

  int _selectedBtnIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // appbar
            CustomAppbar(
              title: 'Liabilities',
              noMargin: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // btn list
                    RowItem(
                      itemList: _btnTxts,
                      onTapFn: (value) =>
                          setState(() => _selectedBtnIndex = value),
                    ),
                    addH(10.h),
                    // search bar
                    const SearchbarDesign(),
                    addH(10.h),
                    // statement total
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: EdgeInsets.only(bottom: 20.h),
                      height: _selectedBtnIndex == 0 ? 120.h : 0,
                      child: Wrap(
                        alignment: WrapAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TotalCon(
                                icon: 'dabit',
                                txt: 'Total Dabit',
                                clr: Colors.amber,
                                value: Methods.getFormatedPrice(9999.99),
                                index: 0,
                              ),
                              TotalCon(
                                icon: 'credit',
                                txt: 'Total Credit',
                                clr: Colors.red,
                                value: Methods.getFormatedPrice(9999.99),
                                index: 1,
                              ),
                              TotalCon(
                                icon: 'balance',
                                txt: 'Total Balance',
                                clr: Colors.green,
                                value: Methods.getFormatedPrice(9999.99),
                                index: 2,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // statement sheet
                    getBodyView(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: double.infinity,
        height: _selectedBtnIndex != 0 ? 65.h : 0,
        padding: EdgeInsets.only(bottom: 10.h),
        decoration: BoxDecoration(
          color: ConstantColors.primaryColor,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(10.r),
          ),
        ),
        child: getNavView(),
      ),
    );
  }

  Widget getBodyView() {
    switch (_selectedBtnIndex) {
      case 0:
      // return Obx(() {
      //   if (_rCon.ordersLoading.value) {
      //     return const Padding(
      //       padding: EdgeInsets.only(top: 250),
      //       child: CircularProgressIndicator(),
      //     );
      //   } else {
      //     if (_rCon.rOrdersModel == null ||
      //         _rCon.rOrdersModel!.data.isEmpty) {
      //       return Text(ConstantStrings.kNoData);
      //     } else {
      //       return StatementSheet(
      //         rCon: _rCon,
      //         statementTitleList: _purchaseStatementTitles,
      //         bodyWidget: ListView.builder(
      //           itemCount: _rCon.rOrdersModel!.data.length,
      //           shrinkWrap: true,
      //           primary: false,
      //           itemBuilder: (BuildContext context, int i) {
      //             return FiveItemRow(
      //               bgClrFlag: i % 2 == 0,
      //               slNo: '${i + 1}',
      //               date: _rCon.rOrdersModel!.data[i].date
      //                   .toString()
      //                   .split('-')
      //                   .reversed
      //                   .join('/'),
      //               id: _rCon.rOrdersModel!.data[i].orderNo,
      //               amount: Methods.getFormatedPrice(
      //                 _rCon.rOrdersModel!.data[i].amount,
      //               ),
      //               actionFn: () {},
      //             );
      //           },
      //         ),
      //       );
      //     }
      //   }
      // });
      // case 1:
      //   return StatementSheet(
      //     statementTitleList: _purchaseStatementTitles,
      //     statementData: _purchaseStatementData,
      //     formatIndexNos: const [3],
      //     txtClrIndex: 4,
      //     onTapIndex: 4,
      //   );
      // case 2:
      //   return StatementSheet(
      //     statementTitleList: _paymentStatementTitles,
      //     statementData: _purchaseStatementData,
      //     formatIndexNos: const [3],
      //     txtClrIndex: 4,
      //     onTapIndex: 4,
      //   );

      // case 3:
      //   return StatementSheet(
      //     statementTitleList: _returnStatementTitles,
      //     statementData: _purchaseStatementData,
      //     formatIndexNos: const [3],
      //     txtClrIndex: 4,
      //     onTapIndex: 4,
      //   );
      // case 4:
      //   return StatementSheet(
      //     statementTitleList: _soldProductsTitles,
      //     statementData: _soldProductsData,
      //     formatIndexNos: const [3],
      //     flxIndexNo: 1,
      //     flx: 3,
      //   );
      default:
        return Text(ConstantStrings.kWentWrong);
    }
  }

  Widget getNavView() {
    switch (_selectedBtnIndex) {
      case 0:
        return const SizedBox.shrink();
      case 1:
        double totalAmount = 0;
        // for (int i = 0; i < _purchaseStatementData[0].length; i++) {
        //   totalAmount += double.parse(_purchaseStatementData[3][i]);
        // }
        return NavTotalView(
          txt: 'Total Amount: ${Methods.getFormatedPrice(totalAmount)}',
        );
      case 2:
        double totalAmount = 0;
        // for (int i = 0; i < _purchaseStatementData[0].length; i++) {
        //   totalAmount += double.parse(_purchaseStatementData[3][i]);
        // }
        return NavTotalView(
          txt: 'Total Amount: ${Methods.getFormatedPrice(totalAmount)}',
        );
      case 3:
        double totalAmount = 0;
        // for (int i = 0; i < _purchaseStatementData[0].length; i++) {
        //   totalAmount += double.parse(_purchaseStatementData[3][i]);
        // }
        return NavTotalView(
          txt: 'Total Amount: ${Methods.getFormatedPrice(totalAmount)}',
        );
      case 4:
        int totalQty = 0;
        double totalAmount = 0;
        // for (int i = 0; i < _soldProductsData[0].length; i++) {
        //   totalQty += int.parse(_soldProductsData[2][i]);
        //   totalAmount += double.parse(_soldProductsData[3][i]);
        // }
        return NavTotalView(
          txt:
              'Total QTY: $totalQty  |  Total Amount: ${Methods.getFormatedPrice(totalAmount)}',
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
