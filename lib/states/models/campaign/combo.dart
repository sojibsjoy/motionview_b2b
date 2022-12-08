import 'dart:convert';

ComboCamModel comboCamModelFromJson(String str) =>
    ComboCamModel.fromJson(json.decode(str));

class ComboCamModel {
  ComboCamModel({
    required this.target,
    required this.status,
    required this.statusCode,
    required this.dealerAddress,
    required this.name,
    required this.campaignType,
    required this.comboCams,
  });

  int target;
  String status;
  int statusCode;
  String dealerAddress;
  String name;
  String campaignType;
  List<ComboCam> comboCams;

  factory ComboCamModel.fromJson(Map<String, dynamic> json) => ComboCamModel(
        target: json["target"],
        status: json["status"],
        statusCode: json["status_code"],
        dealerAddress: json["dealer_address"],
        name: json["name"],
        campaignType: json["campaign_type"],
        comboCams:
            List<ComboCam>.from(json["data"].map((x) => ComboCam.fromJson(x))),
      );
}

class ComboCam {
  ComboCam({
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
    required this.comboCampaign,
  });

  int id;
  int campaignId;
  String targetId;
  dynamic productId;
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
  List<ComboCampaign> comboCampaign;

  factory ComboCam.fromJson(Map<String, dynamic> json) => ComboCam(
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
        comboCampaign: List<ComboCampaign>.from(
            json["combocampaign"].map((x) => ComboCampaign.fromJson(x))),
      );
}

class ComboCampaign {
  ComboCampaign({
    required this.id,
    required this.discount,
    required this.totalAmount,
    required this.price,
    required this.qty,
    required this.campaignRangeId,
    required this.productId,
    required this.subCampaignId,
    required this.product,
  });

  int id;
  int discount;
  int totalAmount;
  int price;
  int qty;
  int campaignRangeId;
  int productId;
  int subCampaignId;
  Product product;

  factory ComboCampaign.fromJson(Map<String, dynamic> json) => ComboCampaign(
        id: json["id"],
        discount: json["discount"],
        totalAmount: json["total_amount"],
        price: json["price"],
        qty: json["qty"],
        campaignRangeId: json["campaign_range_id"],
        productId: json["product_id"],
        subCampaignId: json["sub_campaign_id"],
        product: Product.fromJson(json["product"]),
      );
}

class Product {
  Product({
    required this.id,
    required this.name,
    required this.dpPrice,
    required this.productNo,
    required this.warrantyId,
    required this.warranty,
  });

  int id;
  String name;
  int dpPrice;
  String productNo;
  int warrantyId;
  Warranty warranty;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        dpPrice: json["dp_price"],
        productNo: json["product_no"],
        warrantyId: json["warranty_id"],
        warranty: Warranty.fromJson(json["warranty"]),
      );
}

class Warranty {
  Warranty({
    required this.id,
    required this.title,
    required this.type,
    required this.count,
  });

  int id;
  String title;
  int type;
  int count;

  factory Warranty.fromJson(Map<String, dynamic> json) => Warranty(
        id: json["id"],
        title: json["title"],
        type: json["type"],
        count: json["count"],
      );
}
