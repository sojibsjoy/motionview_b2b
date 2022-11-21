import 'package:dogventurehq/states/bindings/auth.dart';
import 'package:dogventurehq/states/bindings/initial.dart';
import 'package:dogventurehq/states/bindings/ledger.dart';
import 'package:dogventurehq/states/bindings/product.dart';
import 'package:dogventurehq/states/bindings/purchase.dart';
import 'package:dogventurehq/states/bindings/return.dart';
import 'package:dogventurehq/states/bindings/sale_out.dart';
import 'package:dogventurehq/states/bindings/stock.dart';
import 'package:dogventurehq/states/bindings/utility.dart';
import 'package:dogventurehq/ui/screens/campaign/campaign.dart';
import 'package:dogventurehq/ui/screens/campaign_details/campaign_details.dart';
import 'package:dogventurehq/ui/screens/drawer.dart';
import 'package:dogventurehq/ui/screens/liabilities/liabilities.dart';
import 'package:dogventurehq/ui/screens/ledger_details/ledger_details.dart';
import 'package:dogventurehq/ui/screens/login/login.dart';
import 'package:dogventurehq/ui/screens/onboard/onboard.dart';
import 'package:dogventurehq/ui/screens/party_ledger/party_ledger.dart';
import 'package:dogventurehq/ui/screens/products/products.dart';
import 'package:dogventurehq/ui/screens/purchase/purchase.dart';
import 'package:dogventurehq/ui/screens/return_management/return_management.dart';
import 'package:dogventurehq/ui/screens/sale_out/sale_out.dart';
import 'package:dogventurehq/ui/screens/splash/splash.dart';
import 'package:dogventurehq/ui/screens/stock_management/stock_management.dart';
import 'package:dogventurehq/ui/screens/warranty/warranty.dart';
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
      binding: ProductBinding(),
    ),
    GetPage(
      name: PurchaseScreen.routeName,
      page: () => const PurchaseScreen(),
      bindings: [
        PurchaseBinding(),
        UtilityBinding(),
      ],
    ),
    GetPage(
      name: SaleOutScreen.routeName,
      page: () => const SaleOutScreen(),
      bindings: [
        SaleOutBinding(),
        UtilityBinding(),
      ],
    ),
    GetPage(
      name: LiabilitiesScreen.routeName,
      page: () => const LiabilitiesScreen(),
      binding: LedgerBinding(),
    ),
    GetPage(
      name: PartyLedgerScreen.routeName,
      page: () => const PartyLedgerScreen(),
      binding: LedgerBinding(),
    ),
    GetPage(
      name: LedgerDetailsScreen.routeName,
      page: () => const LedgerDetailsScreen(),
    ),
    GetPage(
      name: StockManagementScreen.routeName,
      page: () => const StockManagementScreen(),
      binding: StockBinding(),
    ),
    GetPage(
      name: ReturnManagementScreen.routeName,
      page: () => const ReturnManagementScreen(),
      binding: ReturnBinding(),
    ),
    GetPage(
      name: CampaignScreen.routeName,
      page: () => const CampaignScreen(),
    ),
    GetPage(
      name: CampaignDetails.routeName,
      page: () => const CampaignDetails(),
    ),
    GetPage(
      name: WarrantyScreen.routeName,
      page: () => const WarrantyScreen(),
    ),
  ];
}
