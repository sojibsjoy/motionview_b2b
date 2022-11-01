import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  Data data;
  String message;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        success: json["success"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
        "message": message,
      };
}

class Data {
  Data({
    required this.token,
    required this.name,
    required this.status,
    this.dealerType,
    this.retailerType,
    required this.designation,
  });

  String token;
  String name;
  int status;
  int? dealerType;
  String? retailerType;
  String designation;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        name: json["name"],
        status: json["status"],
        dealerType: json["dealer_type"],
        retailerType: json["retailer_type"],
        designation: json["designation"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "name": name,
        "status": status,
        "dealer_type": dealerType ?? -1,
        "retailer_type": retailerType ?? '',
        "designation": designation,
      };
}
