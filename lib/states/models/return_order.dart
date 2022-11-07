import 'dart:convert';

ReturnOrdersModel returnOrdersModelFromJson(String str) =>
    ReturnOrdersModel.fromJson(json.decode(str));

class ReturnOrdersModel {
  ReturnOrdersModel({
    required this.data,
    required this.links,
    required this.meta,
  });

  List<ReturnOrder> data;
  Links links;
  Meta meta;

  factory ReturnOrdersModel.fromJson(Map<String, dynamic> json) =>
      ReturnOrdersModel(
        data: List<ReturnOrder>.from(
            json["data"].map((x) => ReturnOrder.fromJson(x))),
        links: Links.fromJson(json["links"]),
        meta: Meta.fromJson(json["meta"]),
      );
}

class ReturnOrder {
  ReturnOrder({
    required this.id,
    required this.date,
    required this.orderNo,
    required this.retailer,
    required this.campaign,
    required this.paymentType,
    required this.amount,
    required this.status,
    required this.remarks,
  });

  int id;
  String date;
  String orderNo;
  String retailer;
  String campaign;
  String paymentType;
  int amount;
  Status status;
  String remarks;

  factory ReturnOrder.fromJson(Map<String, dynamic> json) => ReturnOrder(
        id: json["id"],
        date: json["date"],
        orderNo: json["order_no"],
        retailer: json["retailer"],
        campaign: json["campaign"],
        paymentType: json["payment_type"],
        amount: json["amount"],
        status: Status.fromJson(json["status"]),
        remarks: json["remarks"] ?? '',
      );
}

class Status {
  Status({
    required this.id,
    required this.name,
    required this.color,
    required this.status,
  });

  int id;
  String name;
  String color;
  String status;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        id: json["id"],
        name: json["name"],
        color: json["color"],
        status: json["status"],
      );
}

class Links {
  Links({
    required this.first,
    required this.last,
  });

  String first;
  String last;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        first: json["first"],
        last: json["last"],
      );
}

class Meta {
  Meta({
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.links,
    required this.path,
    required this.perPage,
    required this.to,
    required this.total,
  });

  int currentPage;
  int from;
  int lastPage;
  List<Link> links;
  String path;
  int perPage;
  int to;
  int total;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        from: json["from"] ?? 1,
        lastPage: json["last_page"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"] ?? 1,
        total: json["total"],
      );
}

class Link {
  Link({
    required this.url,
    required this.label,
    required this.active,
  });

  String url;
  String label;
  bool active;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"] ?? '',
        label: json["label"],
        active: json["active"],
      );
}
