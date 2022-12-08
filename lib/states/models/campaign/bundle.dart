import 'dart:convert';

BundleCampaignsModel bundleCampaignsModelFromJson(String str) =>
    BundleCampaignsModel.fromJson(json.decode(str));

String bundleCampaignsModelToJson(BundleCampaignsModel data) =>
    json.encode(data.toJson());

class BundleCampaignsModel {
  BundleCampaignsModel({
    required this.target,
    required this.status,
    required this.statusCode,
    required this.dealerAddress,
    required this.name,
    required this.campaignType,
    required this.bundleCams,
  });

  int target;
  String status;
  int statusCode;
  String dealerAddress;
  String name;
  String campaignType;
  List<BundleCam> bundleCams;

  factory BundleCampaignsModel.fromJson(Map<String, dynamic> json) =>
      BundleCampaignsModel(
        target: json["target"],
        status: json["status"],
        statusCode: json["status_code"],
        dealerAddress: json["dealer_address"],
        name: json["name"],
        campaignType: json["campaign_type"],
        bundleCams: List<BundleCam>.from(
            json["data"].map((x) => BundleCam.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "target": target,
        "status": status,
        "status_code": statusCode,
        "dealer_address": dealerAddress,
        "name": name,
        "campaign_type": campaignType,
        "data": List<dynamic>.from(bundleCams.map((x) => x.toJson())),
      };
}

class BundleCam {
  BundleCam({
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
    required this.bundlecampaign,
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
  List<Bundlecampaign> bundlecampaign;

  factory BundleCam.fromJson(Map<String, dynamic> json) => BundleCam(
        id: json["id"],
        campaignId: json["campaign_id"],
        targetId: json["target_id"],
        productId: json["product_id"],
        campaignName: json["campaign_name"],
        partyType: json["party_type"],
        banner: json["banner"] ?? '',
        paymentDuration: json["payment_duration"],
        startDate: DateTime.parse(json["start_date"]),
        startTime: json["start_time"],
        endDate: DateTime.parse(json["end_date"]),
        endTime: json["end_time"],
        status: json["status"],
        createdBy: json["created_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        bundlecampaign: List<Bundlecampaign>.from(
            json["bundlecampaign"].map((x) => Bundlecampaign.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "campaign_id": campaignId,
        "target_id": targetId,
        "product_id": productId,
        "campaign_name": campaignName,
        "party_type": partyType,
        "banner": banner,
        "payment_duration": paymentDuration,
        "start_date":
            "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "start_time": startTime,
        "end_date":
            "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "end_time": endTime,
        "status": status,
        "created_by": createdBy,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "bundlecampaign":
            List<dynamic>.from(bundlecampaign.map((x) => x.toJson())),
      };
}

class Bundlecampaign {
  Bundlecampaign({
    required this.id,
    required this.totalDiscount,
    required this.percentage,
    required this.price,
    required this.qty,
    required this.campaignRangeId,
    required this.subCampaignId,
    required this.productId,
    required this.campaignId,
    required this.product,
  });

  int id;
  double totalDiscount;
  int percentage;
  int price;
  int qty;
  int campaignRangeId;
  int subCampaignId;
  int productId;
  int campaignId;
  Product product;

  factory Bundlecampaign.fromJson(Map<String, dynamic> json) => Bundlecampaign(
        id: json["id"],
        totalDiscount: double.parse(json["total_discount"].toString()),
        percentage: json["percentage"],
        price: json["price"],
        qty: json["qty"],
        campaignRangeId: json["campaign_range_id"],
        subCampaignId: json["sub_campaign_id"],
        productId: json["product_id"],
        campaignId: json["campaign_id"],
        product: Product.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "total_discount": totalDiscount,
        "percentage": percentage,
        "price": price,
        "qty": qty,
        "campaign_range_id": campaignRangeId,
        "sub_campaign_id": subCampaignId,
        "product_id": productId,
        "campaign_id": campaignId,
        "product": product.toJson(),
      };
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

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
