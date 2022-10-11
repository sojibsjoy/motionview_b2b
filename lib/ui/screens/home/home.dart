import 'package:dogventurehq/ui/screens/home/appbar_icon.dart';
import 'package:dogventurehq/ui/screens/home/searchbar_design.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dogventurehq/ui/screens/home/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppbar(
              // Motionview Logo
              logo: InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                // onTap: () => showEntryDialog(
                //   onTapFn: () =>
                //       AllMethods.sliderNavigationFn(
                //     homeController.entryPopup.data.url!,
                //   ),
                //   imgUrl: ConstantStrings
                //           .entryPopupImgPrefixLink +
                //       homeController.entryPopup.data.image!,
                // ),
                // onTap: () => homeController.refreshAllFn(),
                child: SizedBox(
                  height: 48.h,
                  width: 120.w,
                  child: SvgPicture.asset(
                    // context.isDarkMode ? 'assets/svg/logo_white.svg' :
                    'assets/svgs/logo.svg',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              suffixWidget: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppbarIcon(
                    icon: 'bell',
                    onTapFn: () {},
                  ),
                  AppbarIcon(
                    icon: 'cart',
                    onTapFn: () {},
                  ),
                ],
              ),
            ),
            const SearchbarDesign(),
          ],
        ),
      ),
    );
  }
}
