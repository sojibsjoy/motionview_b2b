import 'dart:convert';

import 'package:dogventurehq/states/models/purchased_product.dart';
import 'package:dogventurehq/states/models/saleout_report.dart';
import 'package:dogventurehq/states/services/sale_out.dart';
import 'package:dogventurehq/states/utils/methods.dart';
import 'package:get/state_manager.dart';

class SaleOutController extends GetxController {
  RxBool soReportLoading = true.obs; // sale out reporting loading
  RxBool ppLoading = true.obs; // purchased products loading
  RxBool soCreateLoading = true.obs; // sale out create loading

  SaleOutReports? saleOutReports;
  PurchasedProductsModel? pProductsModel;

  void getSaleOutReports({
    required String token,
    required bool dealerFlag,
  }) async {
    soReportLoading(true);
    try {
      var response = await SaleOutService.getSaleOutReport(
        usrToken: token,
        dFlag: dealerFlag,
      );
      saleOutReports = saleOutReportsFromJson(jsonEncode(response));
      if (saleOutReports != null) {
        print(saleOutReports!.saleoutReports.length);
      }
    } finally {
      soReportLoading(false);
    }
  }

  void getAllPurchasedProducts({
    required String token,
    required bool dealerFlag,
  }) async {
    ppLoading(true);
    try {
      var response = await SaleOutService.getAllPP(
        usrToken: token,
        dFlag: dealerFlag,
      );
      pProductsModel = purchasedProductsModelFromJson(jsonEncode(response));
      if (pProductsModel != null) {
        print(pProductsModel!.purchasedProducts.length);
      }
    } finally {
      ppLoading(false);
    }
  }

  void saleOutCreate({
    required String token,
    required bool dealerFlag,
    required Map<String, dynamic> payload,
  }) async {
    soCreateLoading(true);
    Methods.showLoading();
    try {
      var response = await SaleOutService.saleOutCreate(
        usrToken: token,
        dFlag: dealerFlag,
        pBody: payload,
      );
      print(response.toString());
      // pProductsModel = purchasedProductsModelFromJson(jsonEncode(response));
      // if (pProductsModel != null) {
      // print(pProductsModel!.purchasedProducts.length);
      // }
    } finally {
      soCreateLoading(false);
      Methods.hideLoading();
    }
  }
}
