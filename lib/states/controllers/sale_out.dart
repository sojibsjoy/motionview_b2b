import 'dart:convert';

import 'package:dogventurehq/states/models/purchased_product.dart';
import 'package:dogventurehq/states/models/sale_out/saleout_report.dart';
import 'package:dogventurehq/states/models/sale_out/sold_campaign.dart';
import 'package:dogventurehq/states/services/sale_out.dart';
import 'package:dogventurehq/states/utils/methods.dart';
import 'package:get/state_manager.dart';

class SaleOutController extends GetxController {
  RxBool soReportLoading = true.obs; // sale out reporting loading
  RxBool ppLoading = true.obs; // purchased products loading
  RxBool scLoading = true.obs; // sale out create loading
  RxBool soCreateLoading = true.obs; // sale out create loading
  bool soCreatedFlag = false;

  SaleOutReports? saleOutReports;
  SoldCampaignsModel? soldCampaignsModel;
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

  void getSoldCampaigns({
    required String token,
    required bool dealerFlag,
  }) async {
    scLoading(true);
    try {
      var response = await SaleOutService.getSoldCampaigs(
        usrToken: token,
        dFlag: dealerFlag,
      );
      soldCampaignsModel = soldCampaignsModelFromJson(jsonEncode(response));
      if (soldCampaignsModel != null) {
        print(soldCampaignsModel!.soldCampaigns.length);
      }
    } finally {
      scLoading(false);
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
    required dynamic payload,
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
      soCreatedFlag = response["success"];
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
