import 'package:dogventurehq/states/models/purchased_product.dart';
import 'package:dogventurehq/states/utils/methods.dart';
import 'package:dogventurehq/ui/designs/custom_field.dart';
import 'package:dogventurehq/ui/screens/purchase/dropdown_design.dart';
import 'package:dogventurehq/ui/screens/warranty/field_title.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:dogventurehq/ui/widgets/product_search_dialog.dart';
import 'package:dogventurehq/ui/widgets/product_sl_no_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class PlaceOrderItemDesign extends StatefulWidget {
  final int iNo;
  final VoidCallback deleteFn;
  final PurchasedProduct pItem;
  final Function(PurchasedProduct) productSelectFn;
  final VoidCallback qtyCngFn;
  const PlaceOrderItemDesign({
    Key? key,
    required this.iNo,
    required this.deleteFn,
    required this.pItem,
    required this.productSelectFn,
    required this.qtyCngFn,
  }) : super(key: key);

  @override
  State<PlaceOrderItemDesign> createState() => _PlaceOrderItemDesignState();
}

class _PlaceOrderItemDesignState extends State<PlaceOrderItemDesign> {
  final TextEditingController _qtyCon = TextEditingController();
  int _subTotal = 0;
  @override
  void initState() {
    _qtyCon.text = widget.pItem.qty.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _subTotal = widget.pItem.qty * widget.pItem.mrpPrice;
    return Slidable(
      key: Key('${widget.pItem.productNo}${widget.iNo}'),
      endActionPane: ActionPane(
        extentRatio: 0.17,
        motion: const ScrollMotion(),
        children: [
          InkWell(
            onTap: widget.deleteFn,
            child: Container(
              width: 60.w,
              height: 125.h,
              margin: const EdgeInsets.only(left: 5, bottom: 8),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: const Icon(
                Icons.delete_outline,
                size: 32,
                color: Colors.white,
              ),
            ),
          )
          // SlidableAction(
          //   onPressed: (_) {},
          //   borderRadius: BorderRadius.circular(10.r),
          //   backgroundColor: Colors.red,
          //   icon: Icons.delete,
          // ),
        ],
      ),
      child: Container(
        height: 200.h,
        padding: const EdgeInsets.all(8),
        margin: EdgeInsets.only(bottom: 10.h),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // product dd
            InkWell(
              onTap: () => Get.defaultDialog(
                title: '',
                titlePadding: EdgeInsets.zero,
                contentPadding: EdgeInsets.zero,
                backgroundColor: Colors.transparent,
                content: ProductSearchDialog(
                  onSelectFn: (value) => setState(() {
                    widget.productSelectFn(value);
                    widget.qtyCngFn();
                  }),
                ),
              ),
              child: DropdownDesign(
                title: widget.pItem.name,
              ),
            ),
            // qty, unit price & sub total
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: CustomField(
                    textCon: _qtyCon,
                    hintText: 'QTY',
                    fillClr: Colors.white,
                    inputType: TextInputType.number,
                    onCngdFn: (value) => setState(() {
                      widget.pItem.selectedSlNos.clear();
                      if (value.isNotEmpty) {
                        widget.pItem.qty = int.parse(value);
                        _subTotal = widget.pItem.qty * widget.pItem.mrpPrice;
                      } else {
                        widget.pItem.qty = 0;
                        _subTotal = 0;
                      }
                      widget.qtyCngFn();
                    }),
                  ),
                ),
                addW(5.w),
                ExpandedCon(
                  price: Methods.getFormatedPrice(
                    widget.pItem.mrpPrice.toDouble(),
                  ),
                ),
                addW(5.w),
                ExpandedCon(
                  price: Methods.getFormatedPrice(
                    _subTotal.toDouble(),
                  ),
                ),
              ],
            ),
            // sl list
            const FieldTitle(txt: 'Serial Numbers'),
            Container(
              width: double.infinity,
              height: 50.h,
              padding: EdgeInsets.all(5.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: ListView(
                primary: false,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: widget.pItem.selectedSlNos.map((e) {
                  return InkWell(
                    onTap: () => setState(
                      () => widget.pItem.selectedSlNos.remove(e),
                    ),
                    child: Container(
                      height: 40.h,
                      margin: EdgeInsets.only(right: 10.w),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Center(
                              child: Text(
                                e.serialNo,
                                style: TextStyle(
                                  fontSize: 18.sp,
                                ),
                              ),
                            ),
                          ),
                          const Positioned(
                            right: 0,
                            child: Icon(
                              Icons.clear,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).followedBy([
                  InkWell(
                    // onTap: () => setState(() {
                    //   widget.pItem.serialNoList.add('LM0001');
                    // }),
                    onTap: () => Get.defaultDialog(
                      title: '',
                      titlePadding: EdgeInsets.zero,
                      contentPadding: EdgeInsets.zero,
                      backgroundColor: Colors.transparent,
                      content: ProductSlNoDialog(
                        slNoList: widget.pItem.slNos,
                        onSelectFn: (value) => setState(() {
                          if (!widget.pItem.selectedSlNos.contains(value)) {
                            widget.pItem.selectedSlNos.add(value);
                          } else {
                            Future.delayed(
                              const Duration(milliseconds: 400),
                              () => Methods.showSnackbar(
                                title: 'Serial Number already added!',
                                msg:
                                    'Please select another serial number of this product.',
                              ),
                            );
                          }
                        }),
                      ),
                    ),
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: widget.pItem.selectedSlNos.length < widget.pItem.qty
                        ? Container(
                            width: 50.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: const Center(
                              child: Icon(Icons.add),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),
                ]).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExpandedCon extends StatelessWidget {
  final String price;
  const ExpandedCon({
    Key? key,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        height: 50.h,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Center(
          child: Text(
            price,
          ),
        ),
      ),
    );
  }
}
