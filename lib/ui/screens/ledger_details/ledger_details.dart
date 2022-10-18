import 'package:dogventurehq/constants/colors.dart';
import 'package:dogventurehq/states/utils/methods.dart';
import 'package:dogventurehq/ui/screens/home/custom_appbar.dart';
import 'package:dogventurehq/ui/screens/home/searchbar_design.dart';
import 'package:dogventurehq/ui/screens/ledger_details/statement_sheet.dart';
import 'package:dogventurehq/ui/screens/ledger_details/sub_row.dart';
import 'package:dogventurehq/ui/screens/ledger_details/total_con.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:dogventurehq/ui/widgets/nav_total_view.dart';
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

  final List<String> _statementTitles = [
    'SL',
    'Date',
    'ID',
    'Dabit',
    'Credit',
    'Balance'
  ];

  final List<List<String>> _statementData = [
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
      '38999',
      '38999',
      '38999',
      '38999',
      '38999',
      '38999',
      '38999',
      '38999',
      '38999',
      '38999',
    ],
    [
      '45590',
      '45590',
      '45590',
      '45590',
      '45590',
      '45590',
      '45590',
      '45590',
      '45590',
      '45590',
    ]
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

  final List<List<String>> _soldProductsData = [
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

  int _selectedBtnIndex = 0;

  @override
  Widget build(BuildContext context) {
    int totalDabit = 0;
    int totalCredit = 0;
    int totalBalance = 0;
    for (int i = 0; i < _statementData[0].length; i++) {
      totalDabit += int.parse(_statementData[3][i]);
      totalCredit += int.parse(_statementData[4][i]);
      totalBalance += int.parse(_statementData[5][i]);
    }
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // appbar
            CustomAppbar(
              title: 'Ledger Details',
              noMargin: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                                icon: Icons.download_rounded,
                                txt: 'Total Dabit',
                                value: Methods.getFormatedPrice(totalDabit),
                                index: 0,
                              ),
                              TotalCon(
                                icon: Icons.upload_rounded,
                                txt: 'Total Credit',
                                value: Methods.getFormatedPrice(totalCredit),
                                index: 1,
                              ),
                              TotalCon(
                                icon: Icons.assignment_turned_in_sharp,
                                txt: 'Total Balance',
                                value: Methods.getFormatedPrice(totalBalance),
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
        return StatementSheet(
          statementTitleList: _statementTitles,
          statementData: _statementData,
          formatIndexNos: const [3, 4, 5],
        );
      case 1:
        return StatementSheet(
          statementTitleList: _purchaseStatementTitles,
          statementData: _purchaseStatementData,
          formatIndexNos: const [3],
          txtClrIndex: 4,
          onTapIndex: 4,
        );
      case 2:
        return StatementSheet(
          statementTitleList: _paymentStatementTitles,
          statementData: _purchaseStatementData,
          formatIndexNos: const [3],
          txtClrIndex: 4,
          onTapIndex: 4,
        );

      case 3:
        return StatementSheet(
          statementTitleList: _returnStatementTitles,
          statementData: _purchaseStatementData,
          formatIndexNos: const [3],
          txtClrIndex: 4,
          onTapIndex: 4,
        );
      case 4:
        return StatementSheet(
          statementTitleList: _soldProductsTitles,
          statementData: _soldProductsData,
          formatIndexNos: const [3],
          flxIndexNo: 1,
          flx: 3,
        );
      default:
        return StatementSheet(
          statementTitleList: _soldProductsTitles,
          statementData: _soldProductsData,
          flxIndexNo: 1,
          flx: 2,
        );
    }
  }

  Widget getNavView() {
    switch (_selectedBtnIndex) {
      case 0:
        return const SizedBox.shrink();
      case 1:
        double totalAmount = 0;
        for (int i = 0; i < _purchaseStatementData[0].length; i++) {
          totalAmount += double.parse(_purchaseStatementData[3][i]);
        }
        return NavTotalView(
          txt: 'Total Amount: ${Methods.getFormatedPrice(totalAmount.round())}',
        );
      case 2:
        double totalAmount = 0;
        for (int i = 0; i < _purchaseStatementData[0].length; i++) {
          totalAmount += double.parse(_purchaseStatementData[3][i]);
        }
        return NavTotalView(
          txt: 'Total Amount: ${Methods.getFormatedPrice(totalAmount.round())}',
        );
      case 3:
        double totalAmount = 0;
        for (int i = 0; i < _purchaseStatementData[0].length; i++) {
          totalAmount += double.parse(_purchaseStatementData[3][i]);
        }
        return NavTotalView(
          txt: 'Total Amount: ${Methods.getFormatedPrice(totalAmount.round())}',
        );
      case 4:
        int totalQty = 0;
        double totalAmount = 0;
        for (int i = 0; i < _soldProductsData[0].length; i++) {
          totalQty += int.parse(_soldProductsData[2][i]);
          totalAmount += double.parse(_soldProductsData[3][i]);
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
