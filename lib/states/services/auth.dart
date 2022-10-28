// import 'package:dogventurehq/constants/strings.dart';
// import 'package:dogventurehq/states/services/base_client.dart';

import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/services/base_client.dart';

class AuthService {
  // Registration Function
  // static Future<dynamic> register({dynamic payload}) async {
  //   var response = await BaseClient.postData(
  //     api: ConstantStrings.kRegisterAPI,
  //     body: payload,
  //   );
  //   return response;
  // }

  // Login Function
  static Future<dynamic> login({
    required String email,
    required String pass,
  }) async {
    var response = await BaseClient.postData(
      api: ConstantStrings.kDealerLogin,
      body: {
        "email": email,
        "password": pass,
      },
    );
    return response;
  }
}
