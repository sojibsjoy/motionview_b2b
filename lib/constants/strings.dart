class ConstantStrings {
  // Onboarding texts
  static String obTitle1 = 'Biggest Eco Products Collection';
  static String obTitle2 = 'The Authenticity of Best Brands';
  static String obTitle3 = 'Best Warranty Support';

  static String obDes1 =
      'Find your next smart gadget from the largest eco-product collection in Bangladesh.';
  static String obDes2 =
      'Buy from the official distributor of famous international brands. Get genuine products.';
  static String obDes3 =
      "Enjoy the best warranty support with every product. It's easy & faster.";

  // APIs
  static String kBaseUrl = 'https://b2b.motionview.com.bd/api/';
  // dealer APIs
  static String kDealerLogin = 'dealer/login';
  static String kDealerAllProducts = 'dealer/all-products';
  static String kDealerTrendingProducts = 'dealer/trending-products';
  static String kDealerNewArrivalProducts = 'dealer/new-arrival-products';
  static String kDealerUpcomingProducts = 'dealer/upcomming-products';
  static String kDealerLedger = 'dealer/ledger-index';

  // retailer APIs
  static String kRetailerLogin = 'retailer/login';
  static String kRetailerAllProducts = 'retailer/all-products';
  static String kRetailerTrendingProducts = 'retailer/trending-products';
  static String kRetailerNewArrivalProducts = 'retailer/new-arrival-products';
  static String kRetailerUpcomingProducts = 'retailer/upcomming-products';
  static String kRetailerOrderView = 'retailer/order-view';
  static String kRetailerStock = 'retailer/get-stock';
  static String kRetailerEOL = 'retailer/get-eol';
  static String kRetailerReturnOrders = 'retailer/return/order-view';
  static String kRetailerReturnProducts = 'retailer/return-products-view';
  static String kRetailerLiabilities = 'retailer/ledger/index';

  // common APIs
  static String kPaymentMethods = 'payment-method';

  // error msgs
  static String kWentWrong = 'Something went wrong';
  static String kNoData = 'No Data Found!';
  static String kEmptyFields = 'Please fill all fields';
  static String kValidEmail = 'Please enter a valid email';
  static String kPasswordLength = 'Password must be at least 6 characters';
}
