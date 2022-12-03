import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/controllers/sale_out.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/states/models/customer.dart';
import 'package:dogventurehq/states/models/login.dart';
import 'package:dogventurehq/states/models/payment_methods.dart';
import 'package:dogventurehq/states/models/purchased_product.dart';
import 'package:dogventurehq/states/utils/methods.dart';
import 'package:dogventurehq/ui/designs/custom_btn.dart';
import 'package:dogventurehq/ui/designs/custom_field.dart';
import 'package:dogventurehq/ui/screens/home/custom_appbar.dart';
import 'package:dogventurehq/ui/screens/sale_out/btm_navbar.dart';
import 'package:dogventurehq/ui/screens/sale_out/con_info_row.dart';
import 'package:dogventurehq/ui/screens/sale_out/sales_history_item.dart';
import 'package:dogventurehq/ui/screens/warranty/field_title.dart';
import 'package:dogventurehq/ui/utility/customer_search_field.dart';
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
  final TextEditingController _cAddCon = TextEditingController();
  final TextEditingController _discountCon = TextEditingController();
  final TextEditingController _paidCon = TextEditingController();
  final TextEditingController _remarksCon = TextEditingController();

  final List<String> _btnTxts = [
    'Sale Out',
    'Sales History',
    'Sold Campaign History',
  ];
  int _selectedBtnIndex = 0;
  late LoginModel _usrInfo;
  bool _dealerFlag = false;

  CustomerModel? _selectedCustomer;
  String _cMobileNo = '';
  PaymentMethod? _selectedPaymentMethod;

  bool _nextFlag = false;

  List<PurchasedProduct> _selectedProducts = List.empty(growable: true);
  int _totalQty = 0;
  int _totalAmount = 0;
  int _discountAmount = 0;
  int _paidAmount = 0;

  @override
  void initState() {
    _usrInfo = Preference.getUserDetails();
    _dealerFlag = Preference.getDealerFlag();
    _soCon.getAllPurchasedProducts(
      token: _usrInfo.data.token,
      dealerFlag: _dealerFlag,
    );
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
              backBtnFn:
                  _nextFlag ? () => setState(() => _nextFlag = false) : null,
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
                        if (value == 0) {
                          _totalQty = 0;
                          _totalAmount = 0;
                          _discountAmount = 0;
                          _paidAmount = 0;
                          _nextFlag = false;
                          _selectedProducts.clear();
                          _soCon.getAllPurchasedProducts(
                            token: _usrInfo.data.token,
                            dealerFlag: _dealerFlag,
                          );
                        }
                        if (value == 1) {
                          _soCon.getSaleOutReports(
                            token: _usrInfo.data.token,
                            dealerFlag: _dealerFlag,
                          );
                        }
                      }),
                    ),
                    addH(20.h),
                    // body
                    Obx(() {
                      if (_soCon.ppLoading.value) {
                        return Padding(
                          padding: EdgeInsets.only(top: 330.h),
                          child: const CircularProgressIndicator(),
                        );
                      } else {
                        if (_soCon.pProductsModel == null ||
                            _soCon.pProductsModel!.purchasedProducts.isEmpty) {
                          return Padding(
                            padding: EdgeInsets.only(top: 330.h),
                            child: Text(
                              ConstantStrings.kNoData,
                            ),
                          );
                        } else {
                          return getBodyView();
                        }
                      }
                    }),
                  ],
                ),
              ),
            ),
            if (!_nextFlag)
              CustomBtn(
                onPressedFn: () => setState(() {
                  if (_selectedCustomer == null &&
                      (_cNameCon.text.isEmpty || _cAddCon.text.isEmpty)) {
                    Methods.showSnackbar(
                      msg: 'Please Enter customer details.',
                    );
                    return;
                  }
                  if (_selectedPaymentMethod == null) {
                    Methods.showSnackbar(
                      msg: 'Please select payment method first.',
                    );
                    return;
                  }
                  _nextFlag = true;
                }),
                btnTxt: 'Next',
              ),
            addH(30.h),
          ],
        ),
      ),
      // nav bar
      bottomNavigationBar: _selectedBtnIndex == 0
          ? BtmNavbar(
              showFlag: _nextFlag,
              totalQty: _totalQty,
              totalAmount: _totalAmount,
              discountAmount: _discountAmount,
              paidAmount: _paidAmount,
              orderNowFn: () {
                var bodyData = <String, dynamic>{
                  "customer_name": _cNameCon.text,
                  "customer_address": _cAddCon.text,
                  "customer_phone": _cMobileNo,
                };
                if (_selectedProducts.isEmpty) {
                  Methods.showSnackbar(
                    msg:
                        'In order to place an order you must add a product first!',
                  );
                  return;
                }
                for (int i = 0; i < _selectedProducts.length; i++) {
                  if (_selectedProducts[i].name.startsWith('Select Product')) {
                    Methods.showSnackbar(
                      msg: 'Please select a product or delete extra field(s)',
                    );
                    return;
                  }
                  if (_selectedProducts[i].qty !=
                      _selectedProducts[i].selectedSlNos.length) {
                    Methods.showSnackbar(
                      msg:
                          'Please Enter Serial Number(s) of selected product(s).',
                    );
                    return;
                  }
                  bodyData.addEntries(
                    {
                      "product[$i][id]": _selectedProducts[i].id,
                      "product[$i][quantity]": _selectedProducts[i].qty,
                      "product[$i][selling_price]":
                          _selectedProducts[i].mrpPrice,
                    }.entries,
                  );
                  if (_selectedProducts[i].selectedSlNos.isNotEmpty) {
                    for (int j = 0;
                        j < _selectedProducts[i].selectedSlNos.length;
                        j++) {
                      bodyData.addEntries(
                        {
                          "product[$i][sn_no][$j]":
                              _selectedProducts[i].selectedSlNos[j].serialNo,
                        }.entries,
                      );
                    }
                  }
                }
                bodyData.addEntries(
                  {
                    "discount": _discountAmount,
                    "payment_type": _selectedPaymentMethod!.id,
                    "remarks": _remarksCon.text,
                    "is_form_app": 1,
                    "paid": _paidAmount,
                  }.entries,
                );
                // print(bodyData.toString());
                _soCon.saleOutCreate(
                  token: _usrInfo.data.token,
                  dealerFlag: _dealerFlag,
                  payload: bodyData,
                );
              },
            )
          : const SizedBox.shrink(),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                  suffixTxt: _selectedCustomer != null
                                      ? _selectedCustomer!.name
                                      : _cNameCon.text.isNotEmpty
                                          ? _cNameCon.text
                                          : 'Unknown',
                                ),
                                ConInfoRow(
                                  prefixTxt: 'Customer Mobile No.',
                                  suffixTxt: _selectedCustomer != null
                                      ? _selectedCustomer!.phone
                                      : _cMobileNo.isNotEmpty
                                          ? _cMobileNo
                                          : 'Unknown',
                                ),
                                ConInfoRow(
                                  prefixTxt: 'Customer Address',
                                  suffixTxt: _selectedCustomer != null
                                      ? _selectedCustomer!.address
                                      : _cAddCon.text.isNotEmpty
                                          ? _cAddCon.text
                                          : 'Unknown',
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
                            allProducts: (value) => setState(
                              () => _selectedProducts = value,
                            ),
                            totalQty: (value) => setState(
                              () => _totalQty = value,
                            ),
                            totalAmount: (value) => setState(
                              () => _totalAmount = value,
                            ),
                          ),
                          addH(20.h),
                          Row(
                            children: [
                              // discount title and field
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const FieldTitle(txt: 'Discount Amount'),
                                    addH(10.h),
                                    CustomField(
                                      textCon: _discountCon,
                                      hintText: 'Discount Amount',
                                      inputType: TextInputType.number,
                                      onCngdFn: (value) => setState(
                                        () {
                                          if (value.isNotEmpty) {
                                            _discountAmount = int.parse(value);
                                          } else {
                                            _discountAmount = 0;
                                            _paidAmount = 0;
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              addW(10.w),
                              // paid title and field
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const FieldTitle(txt: 'Paid Amount'),
                                    addH(10.h),
                                    CustomField(
                                      textCon: _paidCon,
                                      hintText: 'Paid Amount',
                                      onCngdFn: (value) => setState(
                                        () {
                                          if (value.isNotEmpty) {
                                            _paidAmount = int.parse(value);
                                          } else {
                                            _paidAmount = 0;
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          addH(10.h),
                          const FieldTitle(txt: 'Remarks'),
                          addH(10.h),
                          CustomField(
                            textCon: _remarksCon,
                            hintText: 'Remarks',
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomerSearchField(
                            getMethods: (value) => setState(() {
                              _selectedCustomer = value;
                              _cNameCon.text = _selectedCustomer!.name;
                              _cAddCon.text = _selectedCustomer!.address;
                            }),
                            inputNo: (value) => setState(() {
                              _cMobileNo = value;
                            }),
                          ),
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
                            textCon: _cAddCon,
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
        return Obx(() {
          if (_soCon.soReportLoading.value) {
            return Padding(
              padding: EdgeInsets.only(top: 300.h),
              child: const CircularProgressIndicator(),
            );
          } else {
            if (_soCon.saleOutReports == null ||
                _soCon.saleOutReports!.saleoutReports.isEmpty) {
              return Padding(
                padding: EdgeInsets.only(top: 300.h),
                child: Text(ConstantStrings.kNoData),
              );
            } else {
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
            }
          }
        });
      default:
        return Text(
          ConstantStrings.kWentWrong,
        );
    }
  }
}
