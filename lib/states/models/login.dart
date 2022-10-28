class LoginModel {
  LoginModel({
    required this.success,
    required this.data,
    required this.message,
  });
  late final bool success;
  late final Data data;
  late final String message;

  LoginModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = Data.fromJson(json['data']);
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final value = <String, dynamic>{};
    value['success'] = success;
    value['data'] = data.toJson();
    value['message'] = message;
    return value;
  }
}

class Data {
  Data({
    required this.token,
    required this.name,
    required this.status,
    required this.dealerType,
    required this.designation,
  });
  late final String token;
  late final String name;
  late final int status;
  late final int dealerType;
  late final String designation;

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    name = json['name'];
    status = json['status'];
    dealerType = json['dealer_type'];
    designation = json['designation'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['token'] = token;
    data['name'] = name;
    data['status'] = status;
    data['dealer_type'] = dealerType;
    data['designation'] = designation;
    return data;
  }
}
