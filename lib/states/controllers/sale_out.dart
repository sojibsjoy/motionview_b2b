import 'dart:convert';

import 'package:dogventurehq/states/models/saleout_report.dart';
import 'package:dogventurehq/states/services/sale_out.dart';
import 'package:get/state_manager.dart';

class SaleOutController extends GetxController {
  RxBool saleOutLoading = true.obs;

  SaleOutReports? saleOutReports;

  void getSaleOutReports({
    required String token,
    required bool dealerFlag,
  }) async {
    saleOutLoading(true);
    try {
      var response = await SaleOutService.getSaleOutReport(
        token: token,
        dFlag: dealerFlag,
      );
      saleOutReports = saleOutReportsFromJson(jsonEncode(response));
      if (saleOutReports != null) {
        print(saleOutReports!.saleoutReports.length);
      }
    } finally {
      saleOutLoading(false);
    }
  }
}
