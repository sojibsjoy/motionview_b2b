import 'package:dogventurehq/states/bindings/auth.dart';
import 'package:dogventurehq/states/bindings/initial.dart';
import 'package:dogventurehq/ui/screens/campaign/campaign.dart';
import 'package:dogventurehq/ui/screens/campaign_details/campaign_details.dart';
import 'package:dogventurehq/ui/screens/drawer.dart';
import 'package:dogventurehq/ui/screens/ledger_details/ledger_details.dart';
import 'package:dogventurehq/ui/screens/login/login.dart';
import 'package:dogventurehq/ui/screens/onboard/onboard.dart';
import 'package:dogventurehq/ui/screens/party_ledger/party_ledger.dart';
import 'package:dogventurehq/ui/screens/products/products.dart';
import 'package:dogventurehq/ui/screens/purchase/purchase.dart';
import 'package:dogventurehq/ui/screens/return_management/return_management.dart';
import 'package:dogventurehq/ui/screens/splash/splash.dart';
import 'package:dogventurehq/ui/screens/stock_management/stock_management.dart';
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
      binding: AuthBinding(),
    ),
    GetPage(
      name: ProductsScreen.routeName,
      page: () => const ProductsScreen(),
    ),
    GetPage(
      name: PurchaseScreen.routeName,
      page: () => const PurchaseScreen(),
    ),
    GetPage(
      name: PartyLedger.routeName,
      page: () => const PartyLedger(),
    ),
    GetPage(
      name: LedgerDetailsScreen.routeName,
      page: () => const LedgerDetailsScreen(),
    ),
    GetPage(
      name: StockManagementScreen.routeName,
      page: () => const StockManagementScreen(),
    ),
    GetPage(
      name: ReturnManagementScreen.routeName,
      page: () => const ReturnManagementScreen(),
    ),
    GetPage(
      name: CampaignScreen.routeName,
      page: () => const CampaignScreen(),
    ),
    GetPage(
      name: CampaignDetails.routeName,
      page: () => const CampaignDetails(),
    ),
  ];
}
