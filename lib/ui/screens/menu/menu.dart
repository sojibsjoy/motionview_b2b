import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/states/models/login.dart';
import 'package:dogventurehq/ui/screens/campaign/campaign.dart';
import 'package:dogventurehq/ui/screens/liabilities/liabilities.dart';
import 'package:dogventurehq/ui/screens/login/login.dart';
import 'package:dogventurehq/ui/screens/party_ledger/party_ledger.dart';
import 'package:dogventurehq/ui/screens/products/products.dart';
import 'package:dogventurehq/ui/screens/purchase/purchase.dart';
import 'package:dogventurehq/ui/screens/return_management/return_management.dart';
import 'package:dogventurehq/ui/screens/stock_management/stock_management.dart';
import 'package:dogventurehq/ui/screens/warranty/warranty.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final List<String> _menuIcons = [
    'assets/icons/dashboard.png',
    'assets/icons/products.png',
    'assets/icons/purchase.png',
    'assets/icons/sale_out.png',
    'assets/icons/sale_out.png',
    'assets/icons/liabilities.png',
    'assets/icons/party_ledger.png',
    'assets/icons/stock.png',
    'assets/icons/return.png',
    'assets/icons/money_receipt.png',
    'assets/icons/campaign.png',
    'assets/icons/warranty.png',
    'assets/icons/analitics.png',
  ];

  final List<String> _menuTitles = [
    'Dashboard',
    'Products',
    'Purchase',
    'Sale Out',
    'Sale Order',
    'Liabilities',
    'Party Ledger',
    'Stock Management',
    'Return Management',
    'Money Receipt',
    'Campaign',
    'Warranty',
    'Analitics',
  ];

  final List<VoidCallback> _menuOnTapFn = [
    () {},
    () => Get.toNamed(ProductsScreen.routeName),
    () => Get.toNamed(PurchaseScreen.routeName),
    () {},
    () {},
    () => Get.toNamed(LiabilitiesScreen.routeName),
    () => Get.toNamed(PartyLedgerScreen.routeName),
    () => Get.toNamed(StockManagementScreen.routeName),
    () => Get.toNamed(ReturnManagementScreen.routeName),
    () {},
    () => Get.toNamed(CampaignScreen.routeName),
    () => Get.toNamed(WarrantyScreen.routeName),
    () {},
  ];

  late LoginModel _userInfo;
  bool _dealerFlag = false;

  @override
  void initState() {
    _userInfo = Preference.getUserDetails();
    _dealerFlag = Preference.getDealerFlag();
    if (!_dealerFlag) {
      // removing sale order
      _menuIcons.removeAt(4);
      _menuTitles.removeAt(4);
      _menuOnTapFn.removeAt(4);

      // removing party ledger
      _menuIcons.removeAt(5);
      _menuTitles.removeAt(5);
      _menuOnTapFn.removeAt(5);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // it will close the drawer as dashboard will appear on the homescreen
    _menuOnTapFn[0] = () => ZoomDrawer.of(context)!.close();
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 10.h, left: 30.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 370.w,
                child: Row(
                  children: [
                    Container(
                      height: 45.h,
                      width: 45.w,
                      margin: EdgeInsets.only(right: 10.w),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _userInfo.data.name,
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        addH(3.h),
                        Text(
                          _userInfo.data.designation,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () => ZoomDrawer.of(context)!.close(),
                      splashRadius: 1,
                      splashColor: Colors.transparent,
                      icon: const Icon(
                        Icons.clear,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              // item list
              Expanded(
                child: Center(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: _menuIcons.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          buildMenuItems(
                            icon: _menuIcons[index],
                            title: _menuTitles[index],
                            onTapFn: _menuOnTapFn[index],
                          ),
                          if (index != (_menuIcons.length - 1)) addH(13.h),
                        ],
                      );
                    },
                  ),
                ),
              ),
              // log out button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // IconButton(
                  //   onPressed: () => _themeCon.changeTheme(),
                  //   icon: Icon(
                  //     context.isDarkMode
                  //         ? Icons.sunny
                  //         : Icons.nightlight_outlined,
                  //     color: Colors.white,
                  //     size: 25,
                  //   ),
                  // ),
                  InkWell(
                    onTap: () => AwesomeDialog(
                      context: context,
                      dialogType: DialogType.warning,
                      animType: AnimType.bottomSlide,
                      title: "Log out",
                      // dialogBackgroundColor: context.isDarkMode
                      //     ? null
                      //     : ConstantColors.k595E63,
                      desc: "Are you sure?",
                      btnCancelOnPress: () {},
                      btnOkOnPress: () {
                        Preference.logout();
                        Get.offAndToNamed(LoginScreen.routeName);
                        // _userInfoCon.signOut(userItems[0].uToken);
                        // userItems[0].delete();
                        // defaultAddress.clear();
                        // wishItems.clear();
                      },
                    ).show(),
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/svgs/logout.svg',
                          height: 30.h,
                          width: 30.h,
                          color: const Color(0xFFFF5722),
                          fit: BoxFit.contain,
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          "Log out",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFFFF5722),
                          ),
                        ),
                        SizedBox(width: 35.w),
                      ],
                    ),
                  ),
                ],
              ),
              addH(50.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMenuItems({
    required String icon,
    required String title,
    required VoidCallback onTapFn,
  }) {
    return InkWell(
      onTap: onTapFn,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Row(
        children: [
          Image.asset(
            icon,
            height: 30.h,
            width: 30.h,
            fit: BoxFit.contain,
          ),
          SizedBox(width: 10.w),
          Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
