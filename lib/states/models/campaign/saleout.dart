import 'dart:convert';

DealerSaleoutCamModel dealerSaleoutCamModelFromJson(String str) =>
    DealerSaleoutCamModel.fromJson(json.decode(str));

class DealerSaleoutCamModel {
  DealerSaleoutCamModel({
    required this.target,
    required this.status,
    required this.statusCode,
    required this.dealerAddress,
    required this.name,
    required this.campaignType,
    required this.dSaleoutCams,
  });

  int target;
  String status;
  int statusCode;
  String dealerAddress;
  String name;
  String campaignType;
  List<DSaleoutCam> dSaleoutCams;

  factory DealerSaleoutCamModel.fromJson(Map<String, dynamic> json) =>
      DealerSaleoutCamModel(
        target: json["target"],
        status: json["status"],
        statusCode: json["status_code"],
        dealerAddress: json["dealer_address"],
        name: json["name"],
        campaignType: json["campaign_type"],
        dSaleoutCams: List<DSaleoutCam>.from(
            json["data"].map((x) => DSaleoutCam.fromJson(x))),
      );
}

class DSaleoutCam {
  DSaleoutCam({
    required this.id,
    required this.campaignId,
    required this.targetId,
    required this.productId,
    required this.campaignName,
    required this.partyType,
    required this.banner,
    required this.paymentDuration,
    required this.startDate,
    required this.startTime,
    required this.endDate,
    required this.endTime,
    required this.status,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
    required this.dSOCams,
  });

  int id;
  int campaignId;
  String targetId;
  int productId;
  String campaignName;
  int partyType;
  String banner;
  int paymentDuration;
  DateTime startDate;
  String startTime;
  DateTime endDate;
  String endTime;
  int status;
  int createdBy;
  DateTime createdAt;
  DateTime updatedAt;
  List<dSOCam> dSOCams;

  factory DSaleoutCam.fromJson(Map<String, dynamic> json) => DSaleoutCam(
        id: json["id"],
        campaignId: json["campaign_id"],
        targetId: json["target_id"],
        productId: json["product_id"],
        campaignName: json["campaign_name"],
        partyType: json["party_type"],
        banner: json["banner"],
        paymentDuration: json["payment_duration"],
        startDate: DateTime.parse(json["start_date"]),
        startTime: json["start_time"],
        endDate: DateTime.parse(json["end_date"]),
        endTime: json["end_time"],
        status: json["status"],
        createdBy: json["created_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        dSOCams:
            List<dSOCam>.from(json["saleout"].map((x) => dSOCam.fromJson(x))),
      );
}

class dSOCam {
  dSOCam({
    required this.id,
    required this.discountAmount,
    required this.price,
    required this.targetId,
    required this.productId,
    required this.subCampaignId,
    required this.product,
  });

  int id;
  int discountAmount;
  int price;
  int targetId;
  int productId;
  int subCampaignId;
  Product product;

  factory dSOCam.fromJson(Map<String, dynamic> json) => dSOCam(
        id: json["id"],
        discountAmount: json["discount_amount"],
        price: json["price"],
        targetId: json["target_id"],
        productId: json["product_id"],
        subCampaignId: json["sub_campaign_id"],
        product: Product.fromJson(json["product"]),
      );
}

class Product {
  Product({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
      );
}
