import 'package:dogventurehq/states/bindings/initial.dart';
import 'package:dogventurehq/ui/screens/drawer.dart';
import 'package:dogventurehq/ui/screens/login/login.dart';
import 'package:dogventurehq/ui/screens/onboard/onboard.dart';
import 'package:dogventurehq/ui/screens/products/products.dart';
import 'package:dogventurehq/ui/screens/splash/splash.dart';
import 'package:get/route_manager.dart';

class AllRoutes {
  static List<GetPage> allroutes = [
    GetPage(
      name: SplashScreen.routeName,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: OnboardScreen.routeName,
      page: () => const OnboardScreen(),
    ),
    GetPage(
      name: DrawerSetup.routeName,
      page: () => const DrawerSetup(),
      binding: InitialBinding(),
    ),
    GetPage(
      name: LoginScreen.routeName,
      page: () => const LoginScreen(),
      // binding: AuthBinding(),
    ),
    GetPage(
      name: ProductsScreen.routeName,
      page: () => const ProductsScreen(),
    ),
  ];
}
