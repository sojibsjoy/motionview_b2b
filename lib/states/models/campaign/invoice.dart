import 'dart:convert';

InvoiceCamModel invoiceCamModelFromJson(String str) =>
    InvoiceCamModel.fromJson(json.decode(str));

class InvoiceCamModel {
  InvoiceCamModel({
    required this.target,
    required this.status,
    required this.statusCode,
    required this.dealerAddress,
    required this.name,
    required this.campaignType,
    required this.invoiceCams,
  });

  int target;
  String status;
  int statusCode;
  String dealerAddress;
  String name;
  String campaignType;
  List<InvoiceCam> invoiceCams;

  factory InvoiceCamModel.fromJson(Map<String, dynamic> json) =>
      InvoiceCamModel(
        target: json["target"],
        status: json["status"],
        statusCode: json["status_code"],
        dealerAddress: json["dealer_address"],
        name: json["name"],
        campaignType: json["campaign_type"],
        invoiceCams: List<InvoiceCam>.from(
            json["data"].map((x) => InvoiceCam.fromJson(x))),
      );
}

class InvoiceCam {
  InvoiceCam({
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
    required this.modality,
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
  List<Modality> modality;

  factory InvoiceCam.fromJson(Map<String, dynamic> json) => InvoiceCam(
        id: json["id"],
        campaignId: json["campaign_id"],
        targetId: json["target_id"],
        productId: json["product_id"] ?? 0,
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
        modality: List<Modality>.from(
            json["modality"].map((x) => Modality.fromJson(x))),
      );
}

class Modality {
  Modality({
    required this.id,
    required this.campaginId,
    required this.totalDiscount,
    required this.percentage,
    required this.needBalance,
    required this.campaignRangeId,
    required this.subCampaignId,
  });

  int id;
  int campaginId;
  double totalDiscount;
  int percentage;
  int needBalance;
  int campaignRangeId;
  int subCampaignId;

  factory Modality.fromJson(Map<String, dynamic> json) => Modality(
        id: json["id"],
        campaginId: json["campagin_id"],
        totalDiscount: double.parse(json["total_discount"].toString()),
        percentage: json["percentage"],
        needBalance: json["need_balance"],
        campaignRangeId: json["campaign_range_id"],
        subCampaignId: json["sub_campaign_id"],
      );
}
