import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/controllers/purchase.dart';
import 'package:dogventurehq/ui/screens/home/searchbar_design.dart';
import 'package:dogventurehq/ui/screens/purchase/order_item.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class OrderList extends StatelessWidget {
  final PurchaseController pCon;
  const OrderList({
    Key? key,
    required this.pCon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        addH(10.h),
        // search bar
        const SearchbarDesign(),
        // pending order list
        Obx(() {
          if (pCon.ordersLoading.value) {
            return Padding(
              padding: EdgeInsets.only(top: 300.h),
              child: const CircularProgressIndicator(),
            );
          } else {
            if (pCon.pOrdersModel == null) {
              return Padding(
                padding: EdgeInsets.only(top: 300.h),
                child: Text(ConstantStrings.kWentWrong),
              );
            } else {
              if (pCon.pOrdersModel!.data.isEmpty) {
                return Padding(
                  padding: EdgeInsets.only(top: 300.h),
                  child: Text(ConstantStrings.kNoData),
                );
              } else {
                return ListView.builder(
                  itemCount: pCon.pOrdersModel!.data.length,
                  shrinkWrap: true,
                  primary: false,
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                    vertical: 10.h,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return OrderItem(
                      pOrderModel: pCon.pOrdersModel!.data[index],
                    );
                  },
                );
              }
            }
          }
        }),
      ],
    );
  }
}
