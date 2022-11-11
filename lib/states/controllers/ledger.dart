import 'dart:convert';

import 'package:dogventurehq/states/models/dealer_ledger.dart';
import 'package:dogventurehq/states/models/retailer_ledger.dart';
import 'package:dogventurehq/states/services/ledger.dart';
import 'package:get/state_manager.dart';

class LedgerController extends GetxController {
  RxBool ledgersLoading = true.obs;

  DealerLedgersModel? dlModel;
  RetailerLedgersModel? rlModel;

  void getLedgers({
    required String token,
    required bool dealerFlag,
    int? billNo,
    String? startDate,
    String? endDate,
  }) async {
    ledgersLoading(true);
    try {
      var response = await LedgerService.getLedgers(
        usrToken: token,
        dealerFlag: dealerFlag,
        billNo: billNo,
        sDate: startDate,
        eDate: endDate,
      );
      if (dealerFlag) {
        dlModel = dealerLedgersModelFromJson(jsonEncode(response));
        if (dlModel != null) {
          print(dlModel!.data.length);
        }
      } else {
        rlModel = retailerLedgersModelFromJson(jsonEncode(response));
        if (rlModel != null) {
          print(rlModel!.data.length);
        }
      }
    } finally {
      ledgersLoading(false);
    }
  }
}
