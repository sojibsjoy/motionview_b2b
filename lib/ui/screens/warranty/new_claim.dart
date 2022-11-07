import 'package:dogventurehq/constants/colors.dart';
import 'package:dogventurehq/ui/designs/custom_btn.dart';
import 'package:dogventurehq/ui/designs/custom_field.dart';
import 'package:dogventurehq/ui/screens/warranty/field_title.dart';
import 'package:dogventurehq/ui/screens/warranty/manually_cliam.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';

class NewClaim extends StatefulWidget {
  const NewClaim({
    Key? key,
  }) : super(key: key);

  @override
  State<NewClaim> createState() => _NewClaimState();
}

class _NewClaimState extends State<NewClaim> {
  final TextEditingController _snCon = TextEditingController();
  bool _menuallyFlag = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        addH(10.h),
        _menuallyFlag
            ? const ManuallyClaim()
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const FieldTitle(txt: 'SN Number'),
                    addH(10.h),
                    CustomField(
                      textCon: _snCon,
                      hintText: 'Input SN Number',
                    ),
                    addH(20.h),
                    CustomBtn(
                      onPressedFn: () {},
                      btnTxt: 'Submit',
                      btnSize: Size(double.infinity, 55.h),
                    ),
                    addH(10.h),
                    const Center(
                      child: Text(
                        'or',
                      ),
                    ),
                    addH(10.h),
                    CustomBtn(
                      onPressedFn: () => setState(() => _menuallyFlag = true),
                      btnTxt: 'Submit Manually',
                      btnSize: Size(double.infinity, 55.h),
                      btnColor: Colors.white,
                      txtColor: ConstantColors.primaryColor,
                      btnBorderColor: ConstantColors.primaryColor,
                    ),
                  ],
                ),
              ),
      ],
    );
  }
}
