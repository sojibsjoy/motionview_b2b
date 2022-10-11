import 'package:dogventurehq/constants/colors.dart';
import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/ui/screens/drawer.dart';
import 'package:dogventurehq/ui/screens/login/login.dart';
import 'package:dogventurehq/ui/screens/onboard/page_body.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardScreen extends StatefulWidget {
  static String routeName = '/onboard';
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  final LiquidController _pageCon = LiquidController();

  List<String> introImgs = [
    'assets/imgs/ob1.png',
    'assets/imgs/ob2.png',
    'assets/imgs/ob3.png',
  ];

  List<String> introTitles = [
    ConstantStrings.obTitle1,
    ConstantStrings.obTitle2,
    ConstantStrings.obTitle3,
  ];

  List<String> introDescriptions = [
    ConstantStrings.obDes1,
    ConstantStrings.obDes2,
    ConstantStrings.obDes3,
  ];

  int _index = 0;

  void navigating() async {
    Preference.setOnboardFlag(true);
    if (Preference.getLoggedInFlag()) {
      Get.offAllNamed(DrawerSetup.routeName);
    } else {
      Get.offAllNamed(LoginScreen.routeName);
    }
  }

  final List<Color> _clrList = [
    Colors.green.shade300,
    Colors.pink,
    Colors.purple,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _clrList[_index],
      body: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          LiquidSwipe(
            liquidController: _pageCon,
            onPageChangeCallback: (page) => setState(() => _index = page),
            enableLoop: false,
            initialPage: 0,
            pages: [
              PageBody(
                img: introImgs[0],
                title: introTitles[0],
                description: ConstantStrings.obDes1,
                bgClr: _clrList[0],
              ),
              PageBody(
                img: introImgs[1],
                title: introTitles[1],
                description: ConstantStrings.obDes2,
                bgClr: _clrList[1],
              ),
              PageBody(
                img: introImgs[2],
                title: introTitles[2],
                description: ConstantStrings.obDes3,
                bgClr: _clrList[2],
              ),
            ],
          ),
          Positioned(
            top: 50.h,
            right: 10.h,
            child: TextButton(
              onPressed: navigating,
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
              ),
              child: Text(
                "Skip",
                style: TextStyle(
                  fontSize: 15.sp,
                  color:
                      // context.isDarkMode ? ConstantColors.kC0C0C4 :
                      Colors.black,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 50.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                buildIndicator(),
                InkWell(
                  onTap: _index != 2
                      ? () {
                          _pageCon.animateToPage(page: _index);
                          setState(() => _index++);
                          // _pageCon.jumpToPage(_index);
                        }
                      : navigating,
                  child: Container(
                    height: 60.h,
                    width: _index != 2 ? 60.h : 196.w,
                    decoration: BoxDecoration(
                      color: ConstantColors.primaryColor,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: _index != 2
                        ? Center(
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 28.sm,
                            ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Get Started",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20.sp,
                                ),
                              ),
                              SizedBox(width: 17.w),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 28.sm,
                              ),
                            ],
                          ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: _index,
        count: 3,
        effect: ExpandingDotsEffect(
          dotColor: Colors.grey.shade500,
          activeDotColor: ConstantColors.primaryColor,
          dotHeight: 7.h,
          dotWidth: 7.w,
        ),
      );
}
