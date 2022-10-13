import 'package:dogventurehq/ui/screens/home/custom_appbar.dart';
import 'package:dogventurehq/ui/screens/home/searchbar_design.dart';
import 'package:dogventurehq/ui/screens/party_ledger/ledger_item.dart';
import 'package:dogventurehq/ui/widgets/helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class PartyLedger extends StatelessWidget {
  static String routeName = '/party_ledger';
  const PartyLedger({super.key});

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
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return const LedgerItem();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
