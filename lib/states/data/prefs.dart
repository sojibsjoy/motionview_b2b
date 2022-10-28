import 'dart:convert';

import 'package:dogventurehq/states/models/login.dart';
import 'package:get_storage/get_storage.dart';

class Preference {
  // initializing
  static final prefs = GetStorage();

  // keys
  static const onboardFlag = 'onboardFlag';
  static const loggedInFlag = 'loginFlag';

  static const rememberMeFlag = 'rememberMeFlag';
  static const loginEmail = 'loginEmail';
  static const loginPass = 'loginPass';
  static const userDetails = 'userDetails';

  static bool getOnboardFlag() => prefs.read(onboardFlag) ?? false;
  static void setOnboardFlag(bool value) => prefs.write(onboardFlag, value);

  static bool getLoggedInFlag() => prefs.read(loggedInFlag) ?? false;
  static void setLoggedInFlag(bool value) => prefs.write(loggedInFlag, value);

  static bool getRememberMeFlag() => prefs.read(rememberMeFlag) ?? false;
  static void setRememberMeFlag(bool value) =>
      prefs.write(rememberMeFlag, value);

  static String getLoginEmail() => prefs.read(loginEmail) ?? '';
  static void setLoginEmail(String value) => prefs.write(loginEmail, value);

  static String getLoginPass() => prefs.read(loginPass) ?? '';
  static void setLoginPass(String value) => prefs.write(loginPass, value);

  static LoginModel getUserDetails() {
    var result = prefs.read(userDetails);
    return LoginModel.fromJson(json.decode(result));
  }

  static void setUserDetails(LoginModel value) {
    print('Storing Login Details: ${json.encode(value.toJson())}');
    prefs.write(userDetails, json.encode(value.toJson()));
  }

  static void logout() => prefs.remove(loggedInFlag);

  static void clearAll() => prefs.erase();
}
