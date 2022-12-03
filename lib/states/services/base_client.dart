import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dogventurehq/constants/strings.dart';

class BaseClient {
  static Future<dynamic> getData({
    String? token,
    required String api,
    dynamic parameter,
    String? apiVersion,
  }) async {
    // String apiV = apiVersion ?? ConstantStrings.kAPIVersion;
    // String url = ConstantStrings.kBaseUrl + apiV + api;
    String url = ConstantStrings.kBaseUrl + api;
    print('Sending request to: $url');
    if (token != null) {
      print('User Token: $token');
    }
    if (parameter != null) {
      print("Parameter: $parameter");
    }
    try {
      var response = await Dio().get(
        url,
        options: token != null
            ? Options(
                headers: {
                  'Authorization': 'Bearer $token',
                },
              )
            : null,
        queryParameters: parameter,
      );
      print('GET Method: ${response.statusCode}');
      print(url);
      log("GET Response:  ${response.data}");
      return response.data;
    } catch (e) {
      print("Error: $e");
    }
  }

  static Future<dynamic> postData({
    required String api,
    String? token,
    dynamic body,
    String? apiVersion,
  }) async {
    // String apiV = apiVersion ?? ConstantStrings.kAPIVersion;
    // String url = ConstantStrings.kBaseUrl + apiV + api;
    String url = ConstantStrings.kBaseUrl + api;
    print('Sending request to: $url');
    if (token != null) {
      print('User Token: $token');
    }
    log("Post Body: $body");
    try {
      var response = await Dio().post(
        url,
        options: token != null
            ? Options(
                headers: {
                  'Authorization': 'Bearer $token',
                },
              )
            : null,
        data: body,
      );
      print('POST Method: ${response.statusCode}');
      print(url);
      log("POST Response:  ${response.data}");
      return response.data;
    } catch (e) {
      print("Error: $e");
    }
  }

  // static Future<dynamic> getData({required String api}) async {
  //   print(ConstantStrings.kBaseUrl + api);
  //   try {
  //     var response = await Dio().get(ConstantStrings.kBaseUrl + api);
  //     print('Base Client: ${response.statusCode}');
  //     print(response.data);
  //     return response.data;
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // static Future<dynamic> postData(
  //     {required String api, required dynamic body}) async {
  //   try {
  //     var response = await Dio().post(
  //       ConstantStrings.kBaseUrl + api,
  //       data: body,
  //     );
  //     return response.data;
  //   } catch (e) {
  //     print(e);
  //   }
  // }
}
