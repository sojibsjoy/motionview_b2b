import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Methods {
  static void showSnackbar({
    // required BuildContext context,
    String? title,
    required String msg,
    IconData? icon,
    SnackPosition? position,
    int? duration,
  }) {
    // ScaffoldMessenger.of(context).showSnackBar(snackBar(
    //   title: title,
    //   msg: msg,
    //   icon: icon,
    //   position: position,
    // ));
    Get.snackbar(
      title ?? 'Error',
      msg,
      icon: Icon(
        icon ?? Icons.error,
        color: Colors.red,
      ),
      snackPosition: position ?? SnackPosition.BOTTOM,
      animationDuration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(bottom: 20),
      duration: Duration(seconds: duration ?? 2),
    );
  }

  static String getFormatedPrice(double value) {
    return '৳${NumberFormat('#,##,###').format(value)}';
  }

  static void showLoading() {
    if (!EasyLoading.isShow) {
      EasyLoading.show(
        status: 'Loading...',
        dismissOnTap: false,
      );
    }
  }

  static void hideLoading() => EasyLoading.dismiss();

  static DropdownMenuItem<dynamic> getDDMenuItem({
    required dynamic item,
    required String txt,
  }) {
    return DropdownMenuItem(
      value: item,
      child: Row(
        children: [
          addW(15.w),
          Text(
            txt,
            style: TextStyle(
              fontSize: 16.sp,
            ),
          ),
        ],
      ),
    );
  }
}
