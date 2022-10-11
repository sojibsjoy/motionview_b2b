import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dogventurehq/constants/colors.dart';
import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/states/utils/methods.dart';
import 'package:dogventurehq/ui/designs/custom_btn.dart';
import 'package:dogventurehq/ui/designs/custom_field.dart';
import 'package:dogventurehq/ui/designs/custom_txt_btn.dart';
import 'package:dogventurehq/ui/screens/drawer.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = '/login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passCon = TextEditingController();

  final FocusNode _emailFieldNode = FocusNode();
  final FocusNode _passFieldNode = FocusNode();

  bool _rememberMeFlag = false;

  late StreamSubscription _subscription;
  bool isOffline = false;

  @override
  void initState() {
    if (Preference.getRememberMeFlag()) {
      _emailCon.text = Preference.getLoginEmail();
      _passCon.text = Preference.getLoginPass();
      _rememberMeFlag = true;
    }

    // _subscription = InternetConnectionChecker().onStatusChange.listen((status) {
    //   final hasInternet = status == InternetConnectionStatus.connected;
    //   setState(() {
    //     isOffline = !hasInternet;
    //   });
    // });

    super.initState();
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Padding(
            //   padding: EdgeInsets.only(left: 16.w, top: 16.h),
            //   child: IconButton(
            //     highlightColor: Colors.transparent,
            //     splashColor: Colors.transparent,
            //     onPressed: () => Get.back(),
            //     icon: const Icon(
            //       Icons.arrow_back,
            //       color:
            //           // context.isDarkMode ? ConstantColors.kC0C0C4 :
            //           Colors.black,
            //     ),
            //   ),
            // ),
            addH(110.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // sign in title
                  Text(
                    "Sign In",
                    style: TextStyle(
                      color:
                          // context.isDarkMode ? ConstantColors.kC0C0C4 :
                          const Color(0xFF1D3557),
                      fontSize: 36.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  addH(30.h),
                  // email title
                  buildFieldTitle("Email or phone number"),
                  addH(10.h),
                  // email field
                  CustomField(
                    textCon: _emailCon,
                    hintText: 'Enter email or phone no.',
                  ),
                  addH(20.h),
                  // password title
                  buildFieldTitle('Password'),
                  addH(10.h),
                  // password field
                  CustomField(
                    textCon: _passCon,
                    hintText: 'Enter password',
                    isPassField: true,
                  ),
                  addH(10.h),
                  // remember me & forgot password btn
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // remember me
                      SizedBox(
                        width: 165.w,
                        height: 22.h,
                        child: Row(
                          children: [
                            Checkbox(
                              value: _rememberMeFlag,
                              onChanged: (value) => setState(
                                () => _rememberMeFlag = value!,
                              ),
                              activeColor: ConstantColors.primaryColor,
                              splashRadius: 0,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                side: BorderSide(
                                  color: Colors.grey.shade300,
                                  width: 1,
                                ),
                              ),
                            ),
                            Text(
                              'Remember Me',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // forgot password btn
                      CustomTxtBtn(
                        onTapFn: () => AwesomeDialog(
                          context: context,
                          dialogType: DialogType.question,
                          headerAnimationLoop: false,
                          title: "Forgot Password",
                          desc: "how you want to reset your password?",
                          btnCancelColor: Colors.green,
                          btnOkColor: Colors.green,
                          btnOkText: "via Phone",
                          btnOkOnPress: () {},
                          // btnOkOnPress: () => Get.toNamed(
                          //   ForgetPasswordScreen.routeName,
                          //   arguments: false, // false means phone
                          // ),
                          btnCancelText: "via Email",
                          btnCancelOnPress: () {},
                          // btnCancelOnPress: () => Get.toNamed(
                          //   ForgetPasswordScreen.routeName,
                          //   arguments: true, // true means email
                          // ),
                        ).show(),
                        text: 'Forgot Password?',
                      ),
                    ],
                  ),
                  addH(20.h),
                  CustomBtn(
                    onPressedFn: () {
                      if (_emailCon.text.isEmpty || _passCon.text.isEmpty) {
                        Methods.showSnackbar(msg: ConstantStrings.kEmptyFields);
                        return;
                      }
                      if (_rememberMeFlag) {
                        Preference.setLoginEmail(_emailCon.text);
                        Preference.setLoginPass(_passCon.text);
                        Preference.setRememberMeFlag(true);
                      }
                      Preference.setLoggedInFlag(true);
                      Get.toNamed(DrawerSetup.routeName);
                    },
                    btnTxt: 'Sign In',
                  ),
                  addH(280.h),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an acocunt?",
                            style: TextStyle(
                              color: context.isDarkMode
                                  ? ConstantColors.kC0C0C4
                                  : ConstantColors.kLightText,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            // onPressed: () =>
                            //     Get.toNamed(RegisterScreen.routeName),
                            child: Text(
                              "Request Now!",
                              style: TextStyle(
                                fontSize: 16.sp,
                                decoration: TextDecoration.underline,
                                color: const Color(0xFF4A74FF),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text buildFieldTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16.sp,
        color:
            //  context.isDarkMode ? ConstantColors.kC0C0C4 :
            const Color(0xFF1D3557),
      ),
    );
  }
}
