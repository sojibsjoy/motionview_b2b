import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/ui/screens/login/login.dart';
import 'package:dogventurehq/ui/screens/party_ledger/party_ledger.dart';
import 'package:dogventurehq/ui/screens/products/products.dart';
import 'package:dogventurehq/ui/screens/purchase/purchase.dart';
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
  List<String> menuIcons = [
    'assets/icons/dashboard.png',
    'assets/icons/analitics.png',
    'assets/icons/retailer.png',
    'assets/icons/products.png',
    'assets/icons/purchase.png',
    'assets/icons/party_ledger.png',
    'assets/icons/stock.png',
    'assets/icons/money_receipt.png',
    'assets/icons/campaign.png',
  ];

  List<String> menuTitles = [
    'Dashboard',
    'Analitics',
    'Retailer',
    'Products',
    'Purchase',
    'Party Ledger',
    'Stock Management',
    'Money Receipt',
    'Campaign',
  ];

  List<VoidCallback> menuOnTapFn = [
    () {},
    () {},
    () {},
    () => Get.toNamed(ProductsScreen.routeName),
    () => Get.toNamed(PurchaseScreen.routeName),
    () => Get.toNamed(PartyLedger.routeName),
    () {},
    () {},
    () {},
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                          'Md. Sojib Sarker',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        addH(3.h),
                        Text(
                          'sojib.vu@gmail.com',
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
                    itemCount: menuIcons.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          buildMenuItems(
                            icon: menuIcons[index],
                            title: menuTitles[index],
                            onTapFn: menuOnTapFn[index],
                          ),
                          if (index != (menuIcons.length - 1)) addH(13.h),
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
