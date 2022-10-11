import 'package:get_storage/get_storage.dart';

class Preference {
  static final prefs = GetStorage();
  static const onboardFlag = 'onboardFlag';
  static const loggedInFlag = 'loginFlag';

  static const rememberMeFlag = 'rememberMeFlag';
  static const loginEmail = 'loginEmail';
  static const loginPass = 'loginPass';

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

  static void logout() => prefs.remove(loggedInFlag);

  static void clearAll() => prefs.erase();
}
