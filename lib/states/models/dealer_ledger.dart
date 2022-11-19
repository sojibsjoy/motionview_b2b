import 'dart:convert';

DealerLedgersModel dealerLedgersModelFromJson(String str) =>
    DealerLedgersModel.fromJson(json.decode(str));

String dealerLedgersModelToJson(DealerLedgersModel data) =>
    json.encode(data.toJson());

class DealerLedgersModel {
  DealerLedgersModel({
    required this.data,
    required this.target,
    required this.creditLimit,
  });

  List<DLedgerModel> data;
  int target;
  int creditLimit;

  factory DealerLedgersModel.fromJson(Map<String, dynamic> json) =>
      DealerLedgersModel(
        data: List<DLedgerModel>.from(
            json["data"].map((x) => DLedgerModel.fromJson(x))),
        target: json["target"],
        creditLimit: json["credit_limit"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "target": target,
        "credit_limit": creditLimit,
      };
}

class DLedgerModel {
  DLedgerModel({
    required this.id,
    required this.name,
    required this.url,
    required this.address,
    required this.openningBalance,
    required this.target,
    required this.achived,
    required this.creditLimit,
    required this.credit,
    required this.remarks,
  });

  int id;
  String name;
  String url;
  String address;
  double openningBalance;
  double target;
  double achived;
  double creditLimit;
  double credit;
  String remarks;

  factory DLedgerModel.fromJson(Map<String, dynamic> json) => DLedgerModel(
        id: json["id"],
        name: json["name"],
        url: json["url"],
        address: json["address"],
        openningBalance: json["openning_balance"],
        target: json["target"],
        achived: json["achived"],
        creditLimit: json["credit_limit"],
        credit: json["credit"],
        remarks: json["remarks"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "url": url,
        "address": address,
        "openning_balance": openningBalance,
        "target": target,
        "achived": achived,
        "credit_limit": creditLimit,
        "credit": credit,
        "remarks": remarks,
      };
}
