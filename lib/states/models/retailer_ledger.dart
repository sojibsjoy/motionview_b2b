import 'dart:convert';

RetailerLedgersModel retailerLedgersModelFromJson(String str) =>
    RetailerLedgersModel.fromJson(json.decode(str));

class RetailerLedgersModel {
  RetailerLedgersModel({
    required this.data,
    required this.totalKpi,
    required this.totalDebit,
    required this.totalCredit,
  });

  List<RLedgerModel> data;
  int totalKpi;
  int totalDebit;
  int totalCredit;

  factory RetailerLedgersModel.fromJson(Map<String, dynamic> json) =>
      RetailerLedgersModel(
        data: List<RLedgerModel>.from(
            json["data"].map((x) => RLedgerModel.fromJson(x))),
        totalKpi: json["total_kpi"],
        totalDebit: json["total_debit"],
        totalCredit: json["total_credit"],
      );
}

class RLedgerModel {
  RLedgerModel({
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

  factory RLedgerModel.fromJson(Map<String, dynamic> json) => RLedgerModel(
        dealer: json["dealer"],
        billNo: json["bill_no"],
        debit: json["debit"],
        kpi: json["kpi"],
        credit: json["credit"],
        paymentMethod: json["payment_method"],
        date: json["date"],
      );
}
