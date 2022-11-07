import 'dart:convert';

PaymentMethods paymentMethodsFromJson(String str) =>
    PaymentMethods.fromJson(json.decode(str));

class PaymentMethods {
  PaymentMethods({
    required this.data,
  });

  List<PaymentMethod> data;

  factory PaymentMethods.fromJson(Map<String, dynamic> json) => PaymentMethods(
        data: List<PaymentMethod>.from(
            json["data"].map((x) => PaymentMethod.fromJson(x))),
      );
}

class PaymentMethod {
  PaymentMethod({
    required this.id,
    required this.name,
    required this.description,
  });

  int id;
  String name;
  String description;

  factory PaymentMethod.fromJson(Map<String, dynamic> json) => PaymentMethod(
        id: json["id"],
        name: json["name"],
        description: json["description"] ?? '',
      );
}
