import 'dart:convert';

SaleoutCampaignsModel saleoutCampaignsModelFromJson(String str) =>
    SaleoutCampaignsModel.fromJson(json.decode(str));

class SaleoutCampaignsModel {
  SaleoutCampaignsModel({
    required this.campaignName,
    required this.campaignType,
    required this.saleoutCams,
  });

  String campaignName;
  String campaignType;
  List<SaleoutCam> saleoutCams;

  factory SaleoutCampaignsModel.fromJson(Map<String, dynamic> json) =>
      SaleoutCampaignsModel(
        campaignName: json["campaign_name"],
        campaignType: json["campaign_type"],
        saleoutCams: List<SaleoutCam>.from(
          json["data"].map((x) => SaleoutCam.fromJson(x)),
        ),
      );
}

class SaleoutCam {
  SaleoutCam({
    required this.id,
    required this.productName,
    required this.campaignId,
    required this.paymentDuration,
    required this.startDate,
    required this.endDate,
    required this.startTime,
    required this.endTime,
    required this.productId,
    required this.saleoutModality,
  });

  int id;
  String productName;
  int campaignId;
  int paymentDuration;
  DateTime startDate;
  DateTime endDate;
  String startTime;
  String endTime;
  int productId;
  int saleoutModality;

  factory SaleoutCam.fromJson(Map<String, dynamic> json) => SaleoutCam(
        id: json["id"],
        productName: json["product_name"],
        campaignId: json["campaign_id"],
        paymentDuration: json["payment_duration"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        startTime: json["start_time"],
        endTime: json["end_time"],
        productId: json["product_id"],
        saleoutModality: json["saleout_modality"],
      );
}
