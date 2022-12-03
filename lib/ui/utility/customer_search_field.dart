import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/controllers/utility.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/states/models/customer.dart';
import 'package:dogventurehq/states/models/login.dart';
import 'package:dogventurehq/ui/designs/custom_btn.dart';
import 'package:dogventurehq/ui/designs/custom_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dogventurehq/ui/screens/warranty/field_title.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerSearchField extends StatefulWidget {
  final void Function(CustomerModel) getMethods;
  final void Function(String) inputNo;
  const CustomerSearchField({
    super.key,
    required this.getMethods,
    required this.inputNo,
  });

  @override
  State<CustomerSearchField> createState() => _CustomerSearchFieldState();
}

class _CustomerSearchFieldState extends State<CustomerSearchField> {
  final UtilityController _uCon = Get.find<UtilityController>();
  final TextEditingController _cMobileNoCon = TextEditingController();
  late final LoginModel _usrInfo;
  CustomerModel? _selectedCustomer;
  bool _listFlag = false;
  @override
  void initState() {
    _usrInfo = Preference.getUserDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const FieldTitle(
          txt: 'Customer Mobile No.',
        ),
        addH(10.h),
        // mobile no field
        CustomField(
          textCon: _cMobileNoCon,
          hintText: _selectedCustomer == null
              ? 'Ex: 01xxxxxxxxx'
              : _selectedCustomer!.phone,
          onCngdFn: (value) => setState(() {
            if (value.isNotEmpty && value.length > 2) {
              _listFlag = true;
              _uCon.getCustomerList(
                usrToken: _usrInfo.data.token,
                searchKeywords: value,
              );
            } else {
              _listFlag = false;
            }
            widget.inputNo(value);
          }),
        ),
        addH(20.h),
        if (_listFlag)
          Container(
            width: double.infinity,
            height: 300.h,
            margin: EdgeInsets.only(bottom: 20.h),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Obx(() {
              if (_uCon.cutomersLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (_uCon.customersModel == null ||
                    _uCon.customersModel!.customerList.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(ConstantStrings.kNoData),
                        addH(10.h),
                        CustomBtn(
                          onPressedFn: () => setState(() => _listFlag = false),
                          btnTxt: 'Create New',
                          btnSize: Size(150.w, 40.h),
                        ),
                      ],
                    ),
                  );
                } else {
                  return ListView.builder(
                    itemCount: _uCon.customersModel!.customerList.length,
                    shrinkWrap: true,
                    primary: false,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        onTap: () => setState(
                          () {
                            _cMobileNoCon.clear();
                            _selectedCustomer =
                                _uCon.customersModel!.customerList[index];
                            _cMobileNoCon.text = _selectedCustomer!.phone;
                            widget.getMethods(_selectedCustomer!);
                            _listFlag = false;
                          },
                        ),
                        title: Text(
                            _uCon.customersModel!.customerList[index].name),
                        subtitle: Text(
                            _uCon.customersModel!.customerList[index].phone),
                      );
                    },
                  );
                }
              }
            }),
          ),
      ],
    );
  }
}
