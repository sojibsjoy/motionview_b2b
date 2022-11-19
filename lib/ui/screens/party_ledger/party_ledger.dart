import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/controllers/ledger.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/states/models/login.dart';
import 'package:dogventurehq/ui/screens/home/custom_appbar.dart';
import 'package:dogventurehq/ui/screens/home/searchbar_design.dart';
import 'package:dogventurehq/ui/screens/party_ledger/ledger_item.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PartyLedgerScreen extends StatefulWidget {
  static String routeName = '/party_ledger';
  const PartyLedgerScreen({super.key});

  @override
  State<PartyLedgerScreen> createState() => _PartyLedgerScreenState();
}

class _PartyLedgerScreenState extends State<PartyLedgerScreen> {
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
              title: 'Party Ledger',
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
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
