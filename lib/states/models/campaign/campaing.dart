import 'dart:convert';

RetailerCampaignsModel retailerCampaignsModelFromJson(String str) =>
    RetailerCampaignsModel.fromJson(json.decode(str));

class RetailerCampaignsModel {
  RetailerCampaignsModel({
    required this.campaigns,
  });

  List<CampaignModel> campaigns;

  factory RetailerCampaignsModel.fromJson(Map<String, dynamic> json) =>
      RetailerCampaignsModel(
        campaigns: List<CampaignModel>.from(
            json["data"].map((x) => CampaignModel.fromJson(x))),
      );
}

DealerCampaignsModel dealerCampaignsModelFromJson(String str) =>
    DealerCampaignsModel.fromJson(json.decode(str));

class DealerCampaignsModel {
  DealerCampaignsModel({
    required this.status,
    required this.statusCode,
    required this.campaigns,
  });
  String status;
  int statusCode;
  List<CampaignModel> campaigns;

  factory DealerCampaignsModel.fromJson(Map<String, dynamic> json) =>
      DealerCampaignsModel(
        status: json["status"],
        statusCode: json["status_code"],
        campaigns: List<CampaignModel>.from(
            json["message"].map((x) => CampaignModel.fromJson(x))),
      );
}

class CampaignModel {
  CampaignModel({
    required this.id,
    required this.title,
    required this.name,
    required this.campaignType,
    required this.banner,
    required this.description,
    required this.url,
    required this.isAppOnly,
    required this.status,
    // required this.updatedAt,
  });

  int id;
  String title;
  String name;
  String campaignType;
  String banner;
  String description;
  String url;
  int isAppOnly;
  int status;
  // DateTime updatedAt;

  factory CampaignModel.fromJson(Map<String, dynamic> json) => CampaignModel(
        id: json["id"],
        title: json["title"] ?? '',
        name: json["name"],
        campaignType: json["campaign_type"],
        banner: json["banner"],
        description: json["description"] ?? '',
        url: json["url"] ?? '',
        isAppOnly: json["is_app_only"],
        status: json["status"],
        // updatedAt: DateTime.parse(json["updated_at"]),
      );
}
