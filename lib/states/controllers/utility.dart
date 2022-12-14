import 'dart:convert';

import 'package:dogventurehq/states/models/customer.dart';
import 'package:dogventurehq/states/models/utility/payment_methods.dart';
import 'package:dogventurehq/states/models/product.dart';
import 'package:dogventurehq/states/services/utility.dart';
import 'package:get/state_manager.dart';

class UtilityController extends GetxController {
  RxBool pmLoading = true.obs;
  RxBool productsLoading = true.obs;
  RxBool cutomersLoading = true.obs;

  PaymentMethods? pmModel;
  ProductsModel? productsModel;
  CustomersModel? customersModel;

  void getAllProducts({
    required String token,
    required bool dealerFlag,
    String? search,
  }) async {
    productsLoading(true);
    try {
      var response = await UtilityService.getAllProducts(
        usrToken: token,
        dealerFlag: dealerFlag,
        search: search,
      );
      productsModel = productsModelFromJson(jsonEncode(response));
      if (productsModel != null) {
        print(productsModel!.data.length);
      }
    } finally {
      productsLoading(false);
    }
  }

  void getPaymentMethods({
    required String usrToken,
  }) async {
    pmLoading(true);
    try {
      var response = await UtilityService.getPaymentMethods(
        token: usrToken,
      );
      pmModel = paymentMethodsFromJson(jsonEncode(response));
      // if (pmModel != null) {
      //   print(pmModel!.data.length);
      // }
    } finally {
      pmLoading(false);
    }
  }

  void getCustomerList({
    required String usrToken,
    required String searchKeywords,
  }) async {
    cutomersLoading(true);
    try {
      var response = await UtilityService.getCustomerList(
        token: usrToken,
        sKeyword: searchKeywords,
      );
      customersModel = customersModelFromJson(jsonEncode(response));
      if (customersModel != null) {
        print(customersModel!.customerList.length);
      }
    } finally {
      cutomersLoading(false);
    }
  }
}
