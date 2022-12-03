import 'dart:convert';

CustomersModel customersModelFromJson(String str) =>
    CustomersModel.fromJson(json.decode(str));

String customersModelToJson(CustomersModel data) => json.encode(data.toJson());

class CustomersModel {
  CustomersModel({
    required this.success,
    required this.customerList,
  });

  bool success;
  List<CustomerModel> customerList;

  factory CustomersModel.fromJson(Map<String, dynamic> json) => CustomersModel(
        success: json["success"],
        customerList: List<CustomerModel>.from(
            json["data"].map((x) => CustomerModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(customerList.map((x) => x.toJson())),
      };
}

class CustomerModel {
  CustomerModel({
    required this.name,
    required this.phone,
    required this.address,
  });

  String name;
  String phone;
  String address;

  factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
        name: json["name"],
        phone: json["phone"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "phone": phone,
        "address": address,
      };
}
