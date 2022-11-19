import 'dart:convert';

RLiabilitiesModel retailerLedgersModelFromJson(String str) =>
    RLiabilitiesModel.fromJson(json.decode(str));

class RLiabilitiesModel {
  RLiabilitiesModel({
    required this.data,
    required this.totalKpi,
    required this.totalDebit,
    required this.totalCredit,
  });

  List<RLiabilityModel> data;
  int totalKpi;
  int totalDebit;
  int totalCredit;

  factory RLiabilitiesModel.fromJson(Map<String, dynamic> json) =>
      RLiabilitiesModel(
        data: List<RLiabilityModel>.from(
            json["data"].map((x) => RLiabilityModel.fromJson(x))),
        totalKpi: json["total_kpi"],
        totalDebit: json["total_debit"],
        totalCredit: json["total_credit"],
      );
}

class RLiabilityModel {
  RLiabilityModel({
    required this.dealer,
    required this.billNo,
    required this.debit,
    required this.kpi,
    required this.credit,
    required this.paymentMethod,
    required this.date,
  });

  String dealer;
  String billNo;
  int debit;
  int kpi;
  int credit;
  String paymentMethod;
  String date;

  factory RLiabilityModel.fromJson(Map<String, dynamic> json) => RLiabilityModel(
        dealer: json["dealer"],
        billNo: json["bill_no"],
        debit: json["debit"],
        kpi: json["kpi"],
        credit: json["credit"],
        paymentMethod: json["payment_method"],
        date: json["date"],
      );
}
