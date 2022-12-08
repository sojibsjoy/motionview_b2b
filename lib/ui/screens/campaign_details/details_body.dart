import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/controllers/campaign.dart';
import 'package:dogventurehq/states/utils/methods.dart';
import 'package:dogventurehq/ui/designs/custom_btn.dart';
import 'package:dogventurehq/ui/designs/custom_img.dart';
import 'package:dogventurehq/ui/screens/campaign_details/details_con.dart';
import 'package:dogventurehq/ui/screens/purchase/purchase.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsBody extends StatefulWidget {
  final int camID;
  const DetailsBody({
    Key? key,
    required this.camID,
  }) : super(key: key);

  @override
  State<DetailsBody> createState() => _DetailsBodyState();
}

class _DetailsBodyState extends State<DetailsBody> {
  final CampaignController _cCon = Get.find<CampaignController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Obx(() {
        if (_cCon.camDetailsLoading.value) {
          return Padding(
            padding: EdgeInsets.only(top: 330.h, left: 185.w),
            child: const CircularProgressIndicator(),
          );
        } else {
          int lengthOfList = 0;
          Widget returnWid = const Text('Data');
          switch (widget.camID) {
            case 1:
            case 2:
            case 3:
              lengthOfList = _cCon.invoiceCams.length;
              returnWid = SizedBox(
                height: 795.h,
                child: ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: _cCon.invoiceCams.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // title
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _cCon.invoiceCams[index].campaignName,
                              ),
                              CustomBtn(
                                onPressedFn: () => Get.toNamed(
                                  PurchaseScreen.routeName,
                                ),
                                btnTxt: 'Order Now',
                                btnSize: Size(120.w, 36.h),
                                txtSize: 14.sp,
                              ),
                            ],
                          ),
                          Center(
                            child: CustomImg(
                              imgUrl: ConstantStrings.tCamBnrPrefix +
                                  _cCon.invoiceCams[index].banner,
                            ),
                          ),
                          addH(10.h),
                          // invoice & discout
                          DetailsConItem(
                            txt1: 'Invoice Amount',
                            txt2: 'Discount(%)',
                            txt3: 'Dis. Amount',
                            topRadiusFlag: true,
                            bgClr: const Color(0xFFFCE3DB),
                          ),
                          ListView.builder(
                            itemCount: _cCon.invoiceCams[index].modality.length,
                            primary: false,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return DetailsConItem(
                                txt1: Methods.getFormatedPrice(
                                  _cCon.invoiceCams[index].modality[index]
                                      .needBalance
                                      .toDouble(),
                                ),
                                txt2:
                                    '${_cCon.invoiceCams[index].modality[index].percentage}%',
                                txt3: Methods.getFormatedPrice(
                                  _cCon.invoiceCams[index].modality[index]
                                      .totalDiscount
                                      .toDouble(),
                                ),
                                bgClr: index % 2 == 0
                                    ? null
                                    : const Color(0xFFFFEEE1),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
              break;
            default:
              lengthOfList = 0;
              break;
          }
          if (lengthOfList == 0) {
            return Padding(
              padding: EdgeInsets.only(top: 330.h, left: 185.w),
              child: Text(ConstantStrings.kNoData),
            );
          } else {
            return returnWid;
          }
        }
      }),
    );
  }
}
