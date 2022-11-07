import 'package:dogventurehq/ui/designs/custom_btn.dart';
import 'package:dogventurehq/ui/designs/custom_field.dart';
import 'package:dogventurehq/ui/screens/warranty/claim_bg.dart';
import 'package:dogventurehq/ui/screens/warranty/field_title.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';

class ManuallyClaim extends StatefulWidget {
  const ManuallyClaim({
    Key? key,
  }) : super(key: key);

  @override
  State<ManuallyClaim> createState() => _ManuallyClaimState();
}

class _ManuallyClaimState extends State<ManuallyClaim> {
  final TextEditingController _customerNameCon = TextEditingController();
  final TextEditingController _addressCon = TextEditingController();
  final TextEditingController _phoneCon = TextEditingController();
  final TextEditingController _invoiceNoCon = TextEditingController();
  final TextEditingController _productNameCon = TextEditingController();
  final TextEditingController _serialNoCon = TextEditingController();
  final TextEditingController _warrantyCon = TextEditingController();
  final TextEditingController _issueDetailsCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClaimBg(
          childW: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FieldTitle(txt: 'Customer Name'),
              addH(10.h),
              CustomField(
                textCon: _customerNameCon,
                hintText: 'Ex: John Smith',
              ),
              addH(20.h),
              const FieldTitle(txt: 'Address'),
              addH(10.h),
              CustomField(
                textCon: _addressCon,
                hintText: 'Ex: 10/25, 9th Floor, Eastern Plaza, Hatirpool',
              ),
              addH(20.h),
              // phone and invoice no
              Row(
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const FieldTitle(txt: 'Phone'),
                        addH(10.h),
                        CustomField(
                          textCon: _phoneCon,
                          hintText: 'Ex: 01xxxxxxxxx',
                        ),
                      ],
                    ),
                  ),
                  addW(10.w),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const FieldTitle(txt: 'Invoice No.'),
                        addH(10.h),
                        CustomField(
                          textCon: _invoiceNoCon,
                          hintText: '123456789',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              addH(20.h),
              // purchase date and warranty validity
              Row(
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const FieldTitle(txt: 'Phone'),
                        addH(10.h),
                        CustomField(
                          textCon: _phoneCon,
                          hintText: 'DD / MM / YY',
                        ),
                      ],
                    ),
                  ),
                  addW(10.w),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const FieldTitle(txt: 'Invoice No.'),
                        addH(10.h),
                        CustomField(
                          textCon: _invoiceNoCon,
                          hintText: 'Select Validity',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              addH(20.h),
              const FieldTitle(txt: 'Service Center'),
              addH(10.h),
              // service center
              CustomField(
                textCon: _invoiceNoCon,
                hintText: 'Select Validity',
                width: double.infinity,
              ),
            ],
          ),
        ),
        addH(30.h),
        ClaimBg(
          childW: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FieldTitle(
                txt: 'Product Name',
              ),
              addH(10.h),
              CustomField(
                textCon: _productNameCon,
                hintText: 'Ex: Amazfit GTR 3',
              ),
              addH(20.h),
              // serial number and warranty
              Row(
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const FieldTitle(txt: 'Serial Number'),
                        addH(10.h),
                        CustomField(
                          textCon: _serialNoCon,
                          hintText: 'Ex: 123456789',
                        ),
                      ],
                    ),
                  ),
                  addW(10.w),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const FieldTitle(txt: 'Warranty'),
                        addH(10.h),
                        CustomField(
                          textCon: _warrantyCon,
                          hintText: 'Ex: Unknown',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              addH(20.h),
              // issue dd
              const FieldTitle(txt: 'Issue'),
              addH(10.h),
              CustomField(textCon: _issueDetailsCon, hintText: 'Select'),
              addH(20.h),
              // issue details
              const FieldTitle(txt: 'Issue Details'),
              addH(10.h),
              CustomField(
                textCon: _issueDetailsCon,
                hintText: 'Describe the issue here...',
              ),
              addH(20.h),
              // upload photo
              const FieldTitle(txt: 'Upload Photo (Invoice/Products)'),
              addH(10.h),
              DottedBorder(
                borderType: BorderType.RRect,
                radius: Radius.circular(10.r),
                dashPattern: const [5, 5],
                color: Colors.grey,
                child: Container(
                  width: double.infinity,
                  height: 56.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: const Center(
                    child: Text(
                      'Upload Your Image',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        addH(30.h),
        CustomBtn(
          onPressedFn: () {},
          btnTxt: 'Submit',
          btnSize: Size(366.w, 56.h),
        ),
        addH(10.h),
      ],
    );
  }
}
