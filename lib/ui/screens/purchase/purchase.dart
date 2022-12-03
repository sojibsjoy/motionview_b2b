import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/controllers/purchase.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/states/models/login.dart';
import 'package:dogventurehq/ui/screens/home/custom_appbar.dart';
import 'package:dogventurehq/ui/screens/purchase/order_list.dart';
import 'package:dogventurehq/ui/screens/purchase/place_order_nav_bar.dart';
import 'package:dogventurehq/ui/screens/purchase/place_order_view.dart';
import 'package:dogventurehq/ui/widgets/row_btn.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PurchaseScreen extends StatefulWidget {
  static String routeName = '/purchase';
  const PurchaseScreen({super.key});

  @override
  State<PurchaseScreen> createState() => _PurchaseScreenState();
}

class _PurchaseScreenState extends State<PurchaseScreen> {
  final PurchaseController _purchaseCon = Get.find<PurchaseController>();
  final TextEditingController _remarksCon = TextEditingController();
  final List<String> _btnTxts = [
    'Place Order',
    'Pending Orders',
    'Shipped Orders',
    'Purchase History',
    'Pre-Order',
  ];

  int _selectedBtnIndex = 0;

  late LoginModel _usrInfo;
  bool _dealerFlag = false;

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
            CustomAppbar(title: 'Purchase'),
            // btn list
            RowItem(
              itemList: _btnTxts,
              onTapFn: (value) => setState(
                () {
                  _selectedBtnIndex = value;
                  if (_selectedBtnIndex != 0 && _selectedBtnIndex != 4) {
                    _purchaseCon.getAllOrders(
                      token: _usrInfo.data.token,
                      dealerFlag: _dealerFlag,
                      pendingFlag: _selectedBtnIndex == 1 ? true : null,
                      shippingFlag: _selectedBtnIndex == 2 ? true : null,
                      purchaseHistoryFlag: _selectedBtnIndex == 3 ? true : null,
                    );
                  }
                },
              ),
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
        return PlaceOrderView(
          pCon: _purchaseCon,
        );
      case 1:
      case 2:
      case 3:
        return OrderList(pCon: _purchaseCon);
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
