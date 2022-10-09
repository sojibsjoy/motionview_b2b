import 'package:dogventurehq/states/data/prefs.dart';
// import 'package:dogventurehq/states/models/user.dart';
// import 'package:dogventurehq/states/services/auth.dart';
import 'package:get/state_manager.dart';

class AuthController extends GetxController {
  RxBool isRegistering = true.obs;
  RxBool isLoggingIn = true.obs;
  RxBool isRegistered = false.obs;
  RxBool isLoggedIn = false.obs;

  // UserModel? user;

  // void login({
  //   required String email,
  //   required String password,
  //   bool? rememberMe,
  // }) async {
  //   isLoggingIn(true);
  //   try {
  //     var response = await AuthService.login(
  //       email: email,
  //       pass: password,
  //       rememberMe: rememberMe,
  //     );
  //     user = UserModel.fromJson(response);
  //     if (user != null) {
  //       isLoggedIn(true);
  //       Preference.setLoggedInFlag(true);
  //       Preference.setUserDetails(user!);
  //     }
  //   } finally {
  //     isLoggingIn(false);
  //   }
  // }

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
