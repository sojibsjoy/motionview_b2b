import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/controllers/sale_out.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/states/models/login.dart';
import 'package:dogventurehq/states/models/payment_methods.dart';
import 'package:dogventurehq/states/utils/methods.dart';
import 'package:dogventurehq/ui/designs/custom_btn.dart';
import 'package:dogventurehq/ui/designs/custom_field.dart';
import 'package:dogventurehq/ui/screens/home/custom_appbar.dart';
import 'package:dogventurehq/ui/screens/sale_out/con_info_row.dart';
import 'package:dogventurehq/ui/screens/sale_out/sales_history_item.dart';
import 'package:dogventurehq/ui/screens/warranty/field_title.dart';
import 'package:dogventurehq/ui/utility/payment_methods_dd.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:dogventurehq/ui/widgets/row_btn.dart';
import 'package:dogventurehq/ui/widgets/selection_product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SaleOutScreen extends StatefulWidget {
  static String routeName = '/sale_out';
  const SaleOutScreen({super.key});

  @override
  State<SaleOutScreen> createState() => _SaleOutScreenState();
}

class _SaleOutScreenState extends State<SaleOutScreen> {
  final SaleOutController _soCon = Get.find<SaleOutController>();
  final TextEditingController _cNameCon = TextEditingController();
  final TextEditingController _cMobileNoCon = TextEditingController();
  final TextEditingController _cAddCon = TextEditingController();

  final List<String> _btnTxts = [
    'Sale Out',
    'Sales History',
    'Sold Campaign History',
  ];
  int _selectedBtnIndex = 0;
  late LoginModel _usrInfo;
  bool _dealerFlag = false;

  PaymentMethod? _selectedPaymentMethod;

  bool _nextFlag = false;

  int _totalQty = 0;
  int _totalAmount = 0;

  @override
  void initState() {
    _usrInfo = Preference.getUserDetails();
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
              title: 'Sale Out',
              noMargin: true,
            ),
            // screen body
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // btn list
                    RowItem(
                      itemList: _btnTxts,
                      onTapFn: (value) => setState(() {
                        _selectedBtnIndex = value;
                        if (_selectedBtnIndex == 1) {
                          _soCon.getSaleOutReports(
                            token: _usrInfo.data.token,
                            dealerFlag: _dealerFlag,
                          );
                        }
                      }),
                    ),
                    addH(20.h),
                    getBodyView(),
                  ],
                ),
              ),
            ),
            if (!_nextFlag)
              CustomBtn(
                onPressedFn: () => setState(
                  () => _nextFlag = true,
                ),
                btnTxt: 'Next',
              ),
            addH(30.h),
          ],
        ),
      ),
      bottomNavigationBar: AnimatedContainer(
        width: double.infinity,
        height: _nextFlag ? 230.h : 0,
        color: Colors.grey.shade200,
        padding: const EdgeInsets.all(10),
        duration: const Duration(milliseconds: 300),
        child: Wrap(
          children: [
            Card(
              child: Container(
                height: 120.h,
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ConInfoRow(
                      prefixTxt: 'Total Quantity',
                      suffixTxt: _totalQty.toString(),
                    ),
                    ConInfoRow(
                      prefixTxt: 'Total Amount',
                      suffixTxt:
                          Methods.getFormatedPrice(_totalAmount.toDouble()),
                    ),
                    ConInfoRow(
                      prefixTxt: 'Discount',
                      suffixTxt: Methods.getFormatedPrice(0),
                    ),
                    ConInfoRow(
                      prefixTxt: 'Payable Amount',
                      suffixTxt: Methods.getFormatedPrice(
                        _totalAmount.toDouble(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: CustomBtn(
                onPressedFn: () {},
                btnTxt: 'Order Now',
                btnSize: Size(double.infinity, 58.h),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getBodyView() {
    switch (_selectedBtnIndex) {
      case 0:
        return Column(
          children: [
            // customer field title
            if (!_dealerFlag)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: _nextFlag
                    ? Column(
                        children: [
                          // customer details
                          Container(
                            width: double.infinity,
                            height: 150.h,
                            padding: const EdgeInsets.all(10),
                            margin: EdgeInsets.only(bottom: 20.h),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ConInfoRow(
                                  prefixTxt: 'Customer Name',
                                  suffixTxt: _cNameCon.text,
                                ),
                                ConInfoRow(
                                  prefixTxt: 'Customer Mobile No.',
                                  suffixTxt: _cMobileNoCon.text,
                                ),
                                ConInfoRow(
                                  prefixTxt: 'Customer Address',
                                  suffixTxt: _cAddCon.text,
                                ),
                                ConInfoRow(
                                  prefixTxt: 'Payment Method',
                                  suffixTxt: _selectedPaymentMethod != null
                                      ? _selectedPaymentMethod!.name
                                      : 'UnKnown',
                                ),
                              ],
                            ),
                          ),
                          // selected product list
                          SelectionProductList(
                            token: _usrInfo.data.token,
                            dFlag: _dealerFlag,
                            totalQty: (value) => setState(
                              () => _totalQty = value,
                            ),
                            totalAmount: (value) => setState(
                              () => _totalAmount = value,
                            ),
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const FieldTitle(
                            txt: 'Customer Mobile No.',
                          ),
                          addH(10.h),
                          // mobile no field
                          CustomField(
                            textCon: _cMobileNoCon,
                            hintText: 'Ex: 01xxxxxxxxx',
                          ),
                          addH(20.h),
                          const FieldTitle(
                            txt: 'Customer Name',
                          ),
                          addH(10.h),
                          // name field
                          CustomField(
                            textCon: _cNameCon,
                            hintText: 'Ex: Md. Sojib Sarker',
                          ),
                          addH(20.h),

                          const FieldTitle(
                            txt: 'Customer Address',
                          ),
                          addH(10.h),
                          // address field
                          CustomField(
                            textCon: _cNameCon,
                            hintText:
                                'Ex: 536/A Ramchandra pur, Kedur Mor, Rajshahi',
                          ),
                          addH(20.h),
                          const FieldTitle(txt: 'Payment Methods'),
                          addH(10.h),
                          PaymentMethodsDD(
                            getMethods: (value) => setState(
                              () => _selectedPaymentMethod = value,
                            ),
                          ),
                          addH(20.h),
                        ],
                      ),
              ),
          ],
        );

      case 1:
        return ListView.builder(
          primary: false,
          shrinkWrap: true,
          itemCount: _soCon.saleOutReports!.saleoutReports.length,
          itemBuilder: (BuildContext context, int index) {
            return SalesHistoryItem(
              srModel: _soCon.saleOutReports!.saleoutReports[index],
            );
          },
        );
      default:
        return Text(
          ConstantStrings.kWentWrong,
        );
    }
  }
}
