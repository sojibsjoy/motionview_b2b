import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/controllers/ledger.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/states/models/login.dart';
import 'package:dogventurehq/ui/screens/home/custom_appbar.dart';
import 'package:dogventurehq/ui/screens/home/searchbar_design.dart';
import 'package:dogventurehq/ui/screens/ledger_details/ledger_details.dart';
import 'package:dogventurehq/ui/screens/party_ledger/ledger_item.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LiabilitiesScreen extends StatefulWidget {
  const LiabilitiesScreen({super.key});

  @override
  State<LiabilitiesScreen> createState() => _LiabilitiesScreenState();
}

class _LiabilitiesScreenState extends State<LiabilitiesScreen> {
  final LedgerController _lCon = Get.find<LedgerController>();

  late LoginModel _usrInfo;
  bool _dealerFlag = false;

  @override
  void initState() {
    _usrInfo = Preference.getUserDetails();
    _dealerFlag = Preference.getDealerFlag();
    _lCon.getLedgers(
      token: _usrInfo.data.token,
      dealerFlag: _dealerFlag,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // appbar
            CustomAppbar(
              title: 'Liabilities',
            ),
            // search bar
            const SearchbarDesign(),
            addH(10.h),
            // ladger list
            Obx(
              () {
                if (_lCon.ledgersLoading.value) {
                  return const Padding(
                    padding: EdgeInsets.only(top: 280),
                    child: CircularProgressIndicator(),
                  );
                } else {
                  if (_dealerFlag) {
                    if (_lCon.dlModel == null || _lCon.dlModel!.data.isEmpty) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 280),
                        child: Text(ConstantStrings.kNoData),
                      );
                    } else {
                      return Expanded(
                        child: ListView.builder(
                          itemCount: _lCon.dlModel!.data.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return LedgerItem(
                              dlModel: _lCon.dlModel!.data[index],
                            );
                          },
                        ),
                      );
                    }
                  } else {
                    if (_lCon.rlModel == null || _lCon.rlModel!.data.isEmpty) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 280),
                        child: Text(ConstantStrings.kNoData),
                      );
                    } else {
                      int balance = 0;
                      return Expanded(
                        child: ListView.builder(
                          itemCount: _lCon.rlModel!.data.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            balance = balance +
                                _lCon.rlModel!.data[index].debit -
                                _lCon.rlModel!.data[index].credit;
                            return InkWell(
                              onTap: () => Get.toNamed(
                                LedgerDetailsScreen.routeName,
                              ),
                              child: Container(
                                width: 375.w,
                                height: 95.h,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10.w,
                                  vertical: 5.h,
                                ),
                                margin: EdgeInsets.symmetric(
                                  horizontal: 10.w,
                                  vertical: 5.h,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(6.r),
                                ),
                                child: Center(
                                  child: Text(
                                    _lCon.rlModel!.data[index].dealer,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
