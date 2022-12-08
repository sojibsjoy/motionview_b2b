import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/controllers/return.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/states/models/login.dart';
import 'package:dogventurehq/states/utils/methods.dart';
import 'package:dogventurehq/ui/designs/custom_btn.dart';
import 'package:dogventurehq/ui/screens/home/searchbar_design.dart';
import 'package:dogventurehq/ui/screens/ledger_details/sheet_item.dart';
import 'package:dogventurehq/ui/screens/ledger_details/statement_sheet.dart';
import 'package:dogventurehq/ui/screens/purchase/flexible_widget.dart';
import 'package:dogventurehq/ui/screens/return_management/top_con.dart';
import 'package:dogventurehq/ui/widgets/five_item_row.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:dogventurehq/ui/widgets/nav_total_view.dart';
import 'package:dogventurehq/ui/widgets/row_btn.dart';
import 'package:dogventurehq/ui/widgets/selection_product_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dogventurehq/ui/screens/home/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReturnManagementScreen extends StatefulWidget {
  static String routeName = '/return_management';
  const ReturnManagementScreen({super.key});

  @override
  State<ReturnManagementScreen> createState() => _ReturnManagementScreenState();
}

class _ReturnManagementScreenState extends State<ReturnManagementScreen> {
  final ReturnController _rCon = Get.find<ReturnController>();
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
    'Return ID',
    'Amount',
    'Action',
  ];

  final List<String> _returnedProductsTitles = [
    'SL',
    'Products Name',
    'QTY',
    'Value'
  ];

  late LoginModel userInfo;
  bool _dealerFlag = false;

  @override
  void initState() {
    userInfo = Preference.getUserDetails();
    _dealerFlag = Preference.getDealerFlag();
    super.initState();
  }

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
            if (_dealerFlag)
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
              onTapFn: (value) => setState(() {
                _selectedBtnIndex = value;
                if (_selectedBtnIndex != 0 && _selectedBtnIndex != 3) {
                  _rCon.getAllOrders(
                    token: userInfo.data.token,
                    dealerFlag: _dealerFlag,
                    pendingFlag: _selectedBtnIndex == 1 ? true : null,
                    returnSFlag: _selectedBtnIndex == 2 ? true : null,
                  );
                }
                if (_selectedBtnIndex == 3) {
                  print("object");
                  _rCon.getAllProducts(
                    token: userInfo.data.token,
                    dealerFlag: _dealerFlag,
                  );
                }
              }),
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
          // child: const SelectionProductList(),
        );
      case 1:
      case 2:
        return Obx(() {
          if (_rCon.ordersLoading.value) {
            return const Padding(
              padding: EdgeInsets.only(top: 250),
              child: CircularProgressIndicator(),
            );
          } else {
            if (_rCon.rOrdersModel == null ||
                _rCon.rOrdersModel!.data.isEmpty) {
              return Text(ConstantStrings.kNoData);
            } else {
              return StatementSheet(
                statementTitleList: _purchaseStatementTitles,
                bodyWidget: ListView.builder(
                  itemCount: _rCon.rOrdersModel!.data.length,
                  shrinkWrap: true,
                  primary: false,
                  itemBuilder: (BuildContext context, int i) {
                    return FiveItemRow(
                      bgClrFlag: i % 2 == 0,
                      slNo: '${i + 1}',
                      date: _rCon.rOrdersModel!.data[i].date
                          .toString()
                          .split('-')
                          .reversed
                          .join('/'),
                      id: _rCon.rOrdersModel!.data[i].orderNo,
                      amount: Methods.getFormatedPrice(
                        _rCon.rOrdersModel!.data[i].amount,
                      ),
                      actionFn: () {},
                    );
                  },
                ),
              );
            }
          }
        });
      case 3:
        return Obx(() {
          if (_rCon.productsLoading.value) {
            return const Padding(
              padding: EdgeInsets.only(top: 250),
              child: CircularProgressIndicator(),
            );
          } else {
            if (_rCon.rProdutsModel == null ||
                _rCon.rProdutsModel!.data.isEmpty) {
              return Text(ConstantStrings.kNoData);
            } else {
              return StatementSheet(
                statementTitleList: _returnedProductsTitles,
                flxIndexNo: 1,
                flx: 3,
                bodyWidget: ListView.builder(
                  itemCount: _rCon.rProdutsModel!.data.length,
                  shrinkWrap: true,
                  primary: false,
                  itemBuilder: (BuildContext context, int i) {
                    return Row(
                      children: [
                        SheetItem(
                          txt: '${i + 1}',
                          bgClr: i % 2 == 0 ? null : Colors.grey.shade200,
                        ),
                        SheetItem(
                          txt: _rCon.rProdutsModel!.data[i].product,
                          bgClr: i % 2 == 0 ? null : Colors.grey.shade200,
                          flx: 3,
                          maxLine: 2,
                        ),
                        SheetItem(
                          txt: _rCon.rProdutsModel!.data[i].quantity,
                          bgClr: i % 2 == 0 ? null : Colors.grey.shade200,
                        ),
                        SheetItem(
                          txt: Methods.getFormatedPrice(
                            _rCon.rProdutsModel!.data[i].total,
                          ),
                          bgClr: i % 2 == 0 ? null : Colors.grey.shade200,
                        ),
                      ],
                    );
                  },
                ),
              );
            }
          }
        });
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
        // for (int i = 0; i < _returnedProductsData[0].length; i++) {
        //   totalQty += int.parse(_returnedProductsData[2][i]);
        //   totalAmount += double.parse(_returnedProductsData[3][i]);
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
