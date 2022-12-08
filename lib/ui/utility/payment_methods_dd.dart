import 'package:dogventurehq/states/controllers/utility.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/states/models/login.dart';
import 'package:dogventurehq/states/models/utility/payment_methods.dart';
import 'package:dogventurehq/states/utils/methods.dart';
import 'package:dogventurehq/ui/designs/custom_dd.dart';
import 'package:dogventurehq/ui/screens/purchase/dropdown_design.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentMethodsDD extends StatefulWidget {
  final void Function(PaymentMethod) getMethods;
  const PaymentMethodsDD({
    super.key,
    required this.getMethods,
  });

  @override
  State<PaymentMethodsDD> createState() => _PaymentMethodsDDState();
}

class _PaymentMethodsDDState extends State<PaymentMethodsDD> {
  final UtilityController _uCon = Get.find<UtilityController>();
  late final LoginModel _usrInfo;
  PaymentMethod? _selectedMethod;
  @override
  void initState() {
    _usrInfo = Preference.getUserDetails();
    _uCon.getPaymentMethods(usrToken: _usrInfo.data.token);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (_uCon.pmLoading.value) {
        return DropdownDesign(
          title: 'Loading...',
          // ddWidth: 190.w,
        );
      } else {
        if (_uCon.pmModel == null || _uCon.pmModel!.data.isEmpty) {
          return DropdownDesign(
            title: 'No Methods Found!',
            // ddWidth: 190.w,
          );
        } else {
          return CustomDD(
            givenValue: _selectedMethod,
            hintTxt: 'Select Methods',
            // ddWidth: 190.w,
            items: _uCon.pmModel!.data.map((e) {
              return Methods.getDDMenuItem(
                item: e,
                txt: e.name,
              );
            }).toList(),
            onChangedFn: (value) => setState(() {
              _selectedMethod = value;
              widget.getMethods(_selectedMethod!);
            }),
          );
        }
      }
    });
  }
}
