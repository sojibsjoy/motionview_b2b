import 'dart:convert';

SaleOutReports saleOutReportsFromJson(String str) =>
    SaleOutReports.fromJson(json.decode(str));

class SaleOutReports {
  SaleOutReports({
    required this.saleoutReports,
    required this.total,
    required this.due,
    required this.paid,
  });

  List<SaleoutReport> saleoutReports;
  int total;
  int due;
  int paid;

  factory SaleOutReports.fromJson(Map<String, dynamic> json) => SaleOutReports(
        saleoutReports: List<SaleoutReport>.from(
            json["data"].map((x) => SaleoutReport.fromJson(x))),
        total: json["total"],
        due: json["due"],
        paid: json["paid"],
      );
}

class SaleoutReport {
  SaleoutReport({
    required this.customer,
    required this.orderNo,
    required this.total,
    required this.due,
    required this.discount,
    required this.paid,
    required this.paymentMethod,
    required this.date,
  });

  String customer;
  String orderNo;
  int total;
  int due;
  int discount;
  int paid;
  String paymentMethod;
  String date;

  factory SaleoutReport.fromJson(Map<String, dynamic> json) => SaleoutReport(
        customer: json["customer"],
        orderNo: json["order_no"],
        total: json["total"],
        due: json["due"],
        discount: json["discount"],
        paid: json["paid"],
        paymentMethod: json["payment_method"],
        date: json["date"],
      );
}
