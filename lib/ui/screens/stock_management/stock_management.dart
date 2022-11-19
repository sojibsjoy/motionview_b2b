import 'package:dogventurehq/constants/colors.dart';
import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/controllers/stock.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/states/models/login.dart';
import 'package:dogventurehq/states/utils/methods.dart';
import 'package:dogventurehq/ui/screens/home/custom_appbar.dart';
import 'package:dogventurehq/ui/screens/home/searchbar_design.dart';
import 'package:dogventurehq/ui/screens/products/product_item.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:dogventurehq/ui/widgets/nav_total_view.dart';
import 'package:dogventurehq/ui/widgets/row_btn.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StockManagementScreen extends StatefulWidget {
  static String routeName = '/stock_management';
  const StockManagementScreen({super.key});

  @override
  State<StockManagementScreen> createState() => _StockManagementScreenState();
}

class _StockManagementScreenState extends State<StockManagementScreen> {
  final StockController _sCon = Get.find<StockController>();
  final List<String> _btnTxts = [
    'Stock',
    'EOL',
  ];
  int _selectedBtnIndex = 0;
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
            CustomAppbar(title: 'Stock Management'),
            // stock & eol btn
            RowItem(
              itemList: _btnTxts,
              onTapFn: (value) => setState(() {
                _selectedBtnIndex = value;
                _sCon.getEOl(
                  token: userInfo.data.token,
                  dealerFlag: _dealerFlag,
                  eolFlag: _selectedBtnIndex == 1,
                );
              }),
            ),
            addH(10.h),
            // search bar
            const SearchbarDesign(),
            // stock list
            Obx(() {
              if (_sCon.stockLoading.value) {
                return const Padding(
                  padding: EdgeInsets.only(top: 250),
                  child: CircularProgressIndicator(),
                );
              } else {
                if (_sCon.stocks == null) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 250),
                    child: Text(ConstantStrings.kWentWrong),
                  );
                } else if (_sCon.stocks!.data.isEmpty) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 250),
                    child: Text(ConstantStrings.kNoData),
                  );
                } else {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: _sCon.stocks!.data.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        // int eolTime = 0;
                        // if (_selectedBtnIndex == 1) {
                        //   eolTime = _sCon.stocks!.data[index].eolDate
                        //       .difference(DateTime.now())
                        //       .inDays;
                        // }
                        return ProductItem(
                          pImg: '',
                          pName: _sCon.stocks!.data[index].name,
                          dealerFlag: _dealerFlag ? true : null,
                          pNameW: 265.w,
                          dpPrice:
                              _sCon.stocks!.data[index].stockValue.liftingPrice,
                          liftingPrice:
                              _sCon.stocks!.data[index].stockValue.liftingPrice,
                          rpPrice: _sCon.stocks!.data[index].rpPrice,
                          mrpPrice: _sCon.stocks!.data[index].mrpPrice,
                          w2: _selectedBtnIndex == 1
                              ? const SizedBox.shrink()
                              : null,
                          w3: _selectedBtnIndex == 1
                              ? SizedBox(
                                  width: 200.w,
                                  child: Text(
                                    'Expire Date: ${_sCon.stocks!.data[index].eolDate.split('-').reversed.join('/')}',
                                    // eolTime <= 0
                                    //     ? 'Product Expired!'
                                    //     : 'Only $eolTime Days left',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                )
                              : null,
                          suffixW: RichText(
                            text: TextSpan(
                              text: 'Stock ',
                              style: TextStyle(
                                fontSize: 8,
                                color: ConstantColors.primaryColor,
                              ),
                              children: [
                                TextSpan(
                                  text: _sCon
                                      .stocks!.data[index].stockValue.stock
                                      .toString(),
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: ConstantColors.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              }
            }),
          ],
        ),
      ),
      bottomNavigationBar: Obx(() {
        if (_sCon.stockLoading.value) {
          return const SizedBox.shrink();
        } else {
          if (_sCon.stocks != null && _sCon.stocks!.data.isNotEmpty) {
            return NavTotalView(
              txt: getTotal(),
            );
          } else {
            return const SizedBox.shrink();
          }
        }
      }),
    );
  }

  String getTotal() {
    double totalS = 0;
    double totalA = 0;
    for (int i = 0; i < _sCon.stocks!.data.length; i++) {
      totalA += _sCon.stocks!.data[i].mrpPrice;
      totalS += _sCon.stocks!.data[i].stockValue.stock;
    }
    String formatedA = Methods.getFormatedPrice(totalA);
    return 'Total Stock: $totalS  |  Total Amount: $formatedA';
  }
}
