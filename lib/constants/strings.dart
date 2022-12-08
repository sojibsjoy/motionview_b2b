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
  static String kDealerPurchasedProducts = 'dealer/all-purchase-products';
  static String kDealerSaleOutCreate = 'dealer/sale-out';
  static String kDealerSoldCampaigns = 'dealer/dealer-campaign-saleout-details';
  static String kDealerCampaignList = 'dealer/campaign-list';
  static String kDealerSubCampaignList = 'dealer/sub-campaign-list';

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
  static String kRetailerSaleOutReport = 'retailer/sale-report/index';
  static String kRetailerPurchasedProducts = 'retailer/all-purchase-products';
  static String kRetailerSaleOutCreate = 'retailer/sale-order/create';
  static String kRetailerSoldCampaigns =
      'retailer/retailer-campaign-saleout-details';
  static String kRetailerCampaignList = 'retailer/retailer-campaign-list';
  static String kRetailerSaleOutCampaignList = 'retailer/retailer-saleout-list';

  // common APIs
  static String kPaymentMethods = 'payment-method';
  static String kCustomerSearchByPhone = 'customer/search-by-phone';

  // prefix links
  static String kCampaignPrefix =
      'https://b2b.motionview.com.bd/storage/images/campagin/banner/';

  static String tCamBnrPrefix =
      'https://b2b.motionview.com.bd/storage/images/campaign/banner/';

  // error msgs
  static String kWentWrong = 'Something went wrong';
  static String kNoData = 'No Data Found!';
  static String kEmptyFields = 'Please fill all fields';
  static String kValidEmail = 'Please enter a valid email';
  static String kPasswordLength = 'Password must be at least 6 characters';
}
