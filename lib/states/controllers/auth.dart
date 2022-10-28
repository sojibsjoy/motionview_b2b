import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/states/models/login.dart';
import 'package:dogventurehq/states/services/auth.dart';
import 'package:dogventurehq/states/utils/methods.dart';
// import 'package:dogventurehq/states/models/user.dart';
// import 'package:dogventurehq/states/services/auth.dart';
import 'package:get/state_manager.dart';

class AuthController extends GetxController {
  RxBool isRegistering = true.obs;
  RxBool isLoggingIn = true.obs;
  RxBool isRegistered = false.obs;
  RxBool isLoggedIn = false.obs;

  LoginModel? user;

  void login({
    required String email,
    required String password,
  }) async {
    isLoggingIn(true);
    Methods.showLoading();
    try {
      var response = await AuthService.login(
        email: email,
        pass: password,
      );
      if (response['success']) {
        user = LoginModel.fromJson(response);
        isLoggedIn(true);
        Preference.setLoggedInFlag(true);
        Preference.setUserDetails(user!);
      } else {
        Methods.showSnackbar(
          title: 'Incorrect Email or Password!',
          msg: 'Please check the given credentials.',
          duration: 3,
        );
      }
    } finally {
      Methods.hideLoading();
      isLoggingIn(false);
    }
  }

  // void register(UserModel registerModel) async {
  //   isRegistering(true);
  //   try {
  //     var response = await AuthService.register(
  //       payload: registerModel.toJson(),
  //     );
  //     user = UserModel.fromJson(response);
  //     if (user != null) {
  //       isRegistered(true);
  //       Preference.setLoggedInFlag(true);
  //       Preference.setUserDetails(user!);
  //     }
  //   } finally {
  //     isRegistering(false);
  //   }
  // }
}
