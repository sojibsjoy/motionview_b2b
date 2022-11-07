import 'package:dogventurehq/constants/colors.dart';
import 'package:dogventurehq/ui/screens/warranty/cliam_con_txt_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class ClaimItem extends StatelessWidget {
  final bool finishFlag;
  final bool dealerFlag;
  const ClaimItem({
    Key? key,
    required this.finishFlag,
    required this.dealerFlag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 145.h,
      padding: const EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClaimConTxtItem(
                    prefixTxt: 'SER Number:',
                    suffixTxt: '312127295',
                  ),
                  // date
                  Text(
                    'Date: 12/9/2022',
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
              ClaimConTxtItem(
                prefixTxt: 'Product Name:',
                suffixTxt: 'Amazfit GTS 4 Mini',
              ),
              ClaimConTxtItem(
                prefixTxt: 'Customer No:',
                suffixTxt: '01716-589947',
              ),
              ClaimConTxtItem(
                prefixTxt: 'Issues:',
                suffixTxt: 'Stock Faulty',
              ),
              ClaimConTxtItem(
                prefixTxt: finishFlag ? 'Resolution:' : 'Status:',
                suffixTxt: finishFlag ? 'Repaired' : 'Pending',
                statusFlag: true,
              ),
            ],
          ),
          ClaimConBtn(
            txt: 'View Details',
            bgClr: ConstantColors.kE5F2FF,
            brdrClr: Colors.blueAccent,
            suffixFlag: false,
          ),
          if (dealerFlag)
            Positioned(
              right: 75.w,
              child: PopupMenuButton(
                offset: const Offset(0, 30),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Colors.green,
                  ),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                itemBuilder: (_) => [
                  const PopupMenuItem(
                    value: 1,
                    child: Text(
                      'Received',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const PopupMenuItem(
                    value: 2,
                    child: Text(
                      'Send to Service Center',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
                child: ClaimConBtn(
                  txt: 'Action',
                  bgClr: ConstantColors.kDFFFCF,
                  brdrClr: Colors.green,
                  suffixFlag: true,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class ClaimConBtn extends StatelessWidget {
  final String txt;
  final Color bgClr;
  final Color brdrClr;
  final bool suffixFlag;
  const ClaimConBtn({
    Key? key,
    required this.txt,
    required this.bgClr,
    required this.brdrClr,
    required this.suffixFlag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.w,
      height: 30.h,
      decoration: BoxDecoration(
        color: bgClr,
        border: Border.all(color: brdrClr),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            txt,
            style: TextStyle(
              color: brdrClr,
              fontSize: 10.sp,
            ),
          ),
          if (suffixFlag)
            Icon(
              Icons.arrow_drop_down,
              size: 20,
              color: brdrClr,
            ),
        ],
      ),
    );
  }
}
