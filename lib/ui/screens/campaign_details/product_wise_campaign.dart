import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/controllers/campaign.dart';
import 'package:dogventurehq/states/utils/methods.dart';
import 'package:dogventurehq/ui/screens/campaign_details/list_item.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductWiseCampaign extends StatefulWidget {
  final String campaignTitle;
  final int camID;
  final bool dFlag;
  const ProductWiseCampaign({
    Key? key,
    required this.campaignTitle,
    required this.camID,
    required this.dFlag,
  }) : super(key: key);

  @override
  State<ProductWiseCampaign> createState() => _ProductWiseCampaignState();
}

class _ProductWiseCampaignState extends State<ProductWiseCampaign> {
  final CampaignController _cCon = Get.find<CampaignController>();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10.h),
        color: Colors.grey.shade200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.campaignTitle,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            addH(15.h),
            Obx(() {
              if (_cCon.camDetailsLoading.value) {
                return Padding(
                  padding: EdgeInsets.only(top: 330.h, left: 185.w),
                  child: const CircularProgressIndicator(),
                );
              } else {
                int lengthOfList = 0;
                Widget returnWid = const Text("Data");
                switch (widget.camID) {
                  case 4: // combo campaign
                    lengthOfList = _cCon.comboCams.length;
                    returnWid = Expanded(
                      child: ListView.builder(
                        itemCount: lengthOfList,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return ListItem(
                            titleTxt: _cCon
                                .comboCams[index].comboCampaign[0].product.name,
                            subTitleTxt: _cCon
                                .comboCams[index].comboCampaign[1].product.name,
                            qty:
                                '${_cCon.comboCams[index].comboCampaign[0].qty} + ${_cCon.comboCams[index].comboCampaign[1].qty}',
                            discount: Methods.getFormatedPrice(
                              (_cCon.comboCams[index].comboCampaign[0]
                                          .discount +
                                      _cCon.comboCams[index].comboCampaign[1]
                                          .discount)
                                  .toDouble(),
                            ),
                          );
                        },
                      ),
                    );
                    break;
                  case 5: // bundle campaign
                    lengthOfList = _cCon.bundleCams.length;
                    returnWid = Expanded(
                      child: ListView.builder(
                        itemCount: lengthOfList,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return ListItem(
                            titleTxt: _cCon.bundleCams[index].campaignName,
                            subTitleTxt:
                                'Payment Duration: ${_cCon.bundleCams[index].paymentDuration}',
                            qty:
                                '${_cCon.bundleCams[index].bundlecampaign[0].qty}',
                            discount:
                                "${_cCon.bundleCams[index].bundlecampaign[0].percentage}%",
                          );
                        },
                      ),
                    );
                    break;
                  case 6: // saleout campaign
                    if (widget.dFlag) {
                      lengthOfList = _cCon.dSaleoutCams.length;
                      returnWid = Expanded(
                        child: ListView.builder(
                          itemCount: lengthOfList,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return ListItem(
                              titleTxt: _cCon
                                  .dSaleoutCams[index].dSOCams[0].product.name,
                              subTitleTxt: null,
                              qty: null,
                              discount: Methods.getFormatedPrice(
                                _cCon.dSaleoutCams[index].dSOCams[0]
                                    .discountAmount
                                    .toDouble(),
                              ),
                            );
                          },
                        ),
                      );
                    } else {
                      lengthOfList = _cCon.saleoutCams.length;
                      returnWid = Expanded(
                        child: ListView.builder(
                          itemCount: lengthOfList,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return ListItem(
                              titleTxt: _cCon.saleoutCams[index].productName,
                              subTitleTxt: null,
                              qty: widget.camID == 2 ? '1' : null,
                              discount: Methods.getFormatedPrice(
                                _cCon.saleoutCams[index].saleoutModality
                                    .toDouble(),
                              ),
                            );
                          },
                        ),
                      );
                    }
                    break;
                  default:
                    lengthOfList = 0;
                    break;
                }
                if (lengthOfList == 0) {
                  return Padding(
                    padding: EdgeInsets.only(top: 330.h, left: 155.w),
                    child: Text(ConstantStrings.kNoData),
                  );
                } else {
                  return returnWid;
                }
              }
            }),
          ],
        ),
      ),
    );
  }
}
