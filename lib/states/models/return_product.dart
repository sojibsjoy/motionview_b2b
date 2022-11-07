import 'dart:convert';

ReturnProductsModel returnProductsModelFromJson(String str) =>
    ReturnProductsModel.fromJson(json.decode(str));

String returnProductsModelToJson(ReturnProductsModel data) =>
    json.encode(data.toJson());

class ReturnProductsModel {
  ReturnProductsModel({
    required this.data,
    required this.quantity,
    required this.total,
  });

  List<Datum> data;
  int quantity;
  int total;

  factory ReturnProductsModel.fromJson(Map<String, dynamic> json) =>
      ReturnProductsModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        quantity: json["quantity"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "quantity": quantity,
        "total": total,
      };
}

class Datum {
  Datum({
    required this.product,
    required this.quantity,
    required this.total,
  });

  String product;
  String quantity;
  int total;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        product: json["product"],
        quantity: json["quantity"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "product": product,
        "quantity": quantity,
        "total": total,
      };
}
