import 'dart:convert';

SaleoutCreateModel saleoutCreateModelFromJson(String str) =>
    SaleoutCreateModel.fromJson(json.decode(str));

String saleoutCreateModelToJson(SaleoutCreateModel data) =>
    json.encode(data.toJson());

class SaleoutCreateModel {
  SaleoutCreateModel({
    required this.customerName,
    required this.customerAddress,
    required this.customerPhone,
    required this.product,
    required this.discount,
    required this.paymentType,
    required this.remarks,
    required this.isFormApp,
    required this.paid,
  });

  String customerName;
  String customerAddress;
  String customerPhone;
  List<Product> product;
  int discount;
  int paymentType;
  String remarks;
  int isFormApp;
  int paid;

  factory SaleoutCreateModel.fromJson(Map<String, dynamic> json) =>
      SaleoutCreateModel(
        customerName: json["customer_name"],
        customerAddress: json["customer_address"],
        customerPhone: json["customer_phone"],
        product:
            List<Product>.from(json["product"].map((x) => Product.fromJson(x))),
        discount: json["discount"],
        paymentType: json["payment_type"],
        remarks: json["remarks"],
        isFormApp: json["is_form_app"],
        paid: json["paid"],
      );

  Map<String, dynamic> toJson() => {
        "customer_name": customerName,
        "customer_address": customerAddress,
        "customer_phone": customerPhone,
        "product": List<dynamic>.from(product.map((x) => x.toJson())),
        "discount": discount,
        "payment_type": paymentType,
        "remarks": remarks,
        "is_form_app": isFormApp,
        "paid": paid,
      };
}

class Product {
  Product({
    required this.id,
    required this.quantity,
    required this.sellingPrice,
    required this.snNo,
  });

  int id;
  int quantity;
  int sellingPrice;
  List<int> snNo;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        quantity: json["quantity"],
        sellingPrice: json["selling_price"],
        snNo: List<int>.from(json["sn_no"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "quantity": quantity,
        "selling_price": sellingPrice,
        "sn_no": List<dynamic>.from(snNo.map((x) => x)),
      };
}
