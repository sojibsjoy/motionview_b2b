import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/states/models/login.dart';
import 'package:dogventurehq/states/models/purchased_product.dart';
import 'package:dogventurehq/ui/designs/custom_btn.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductSlNoDialog extends StatefulWidget {
  final List<SlNo> slNoList;
  final Function(SlNo) onSelectFn;
  const ProductSlNoDialog({
    Key? key,
    required this.slNoList,
    required this.onSelectFn,
  }) : super(key: key);

  @override
  State<ProductSlNoDialog> createState() => _ProductSlNoDialogState();
}

class _ProductSlNoDialogState extends State<ProductSlNoDialog> {
  final bool _isSearching = false;
  late LoginModel _usrInfo;
  bool _dFlag = false;
  @override
  void initState() {
    _usrInfo = Preference.getUserDetails();
    _dFlag = Preference.getDealerFlag();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 430.h,
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        children: [
          Text(
            "Available Serial Numbers",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          addH(10.h),
          Expanded(
            child: SizedBox(
              width: 388.w,
              child: widget.slNoList.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: widget.slNoList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            widget.onSelectFn(widget.slNoList[index]);
                            Get.back();
                          },
                          child: Container(
                            height: 50.h,
                            padding: EdgeInsets.all(10.w),
                            margin: EdgeInsets.only(bottom: 10.h),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Text(
                              widget.slNoList[index].serialNo,
                            ),
                          ),
                        );
                      },
                    )
                  : Column(
                      children: [
                        const Expanded(
                          child: Center(
                            child: Text(
                              "No Serial Number Found!\nPlease select any other product to sell.",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        CustomBtn(
                          onPressedFn: () => Get.back(),
                          btnTxt: 'Close',
                        ),
                      ],
                    ),
            ),
          )
        ],
      ),
    );
  }
}
