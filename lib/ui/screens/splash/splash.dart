import 'package:dogventurehq/constants/colors.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/ui/screens/drawer.dart';
import 'package:dogventurehq/ui/screens/login/login.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dogventurehq/ui/screens/onboard/onboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = '/splash';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigating();
  }

  void navigating() async {
    if (Preference.getOnboardFlag()) {
      if (Preference.getLoggedInFlag()) {
        Future.delayed(
          const Duration(seconds: 2),
          () => Get.offAllNamed(DrawerSetup.routeName),
        );
      } else {
        Future.delayed(
          const Duration(seconds: 2),
          () => Get.offAllNamed(LoginScreen.routeName),
        );
      }
    } else {
      Future.delayed(
        const Duration(seconds: 2),
        () => Get.offAllNamed(OnboardScreen.routeName),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              // context.isDarkMode ? 'assets/svg/logo_white.svg' :
              'assets/svgs/logo.svg',
              width: 210.w,
              fit: BoxFit.fitWidth,
            ),
            addH(20.h),
            SpinKitRipple(
              color: ConstantColors.primaryColor,
              size: 50.h,
              duration: const Duration(milliseconds: 1500),
              borderWidth: 3,
            ),
          ],
        ),
      ),
    );
  }
}
