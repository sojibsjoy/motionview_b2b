import 'dart:convert';

SoldCampaignsModel soldCampaignsModelFromJson(String str) =>
    SoldCampaignsModel.fromJson(json.decode(str));

class SoldCampaignsModel {
  SoldCampaignsModel({
    required this.soldCampaigns,
    required this.links,
    required this.meta,
  });

  List<SoldCampaign> soldCampaigns;
  Links links;
  Meta meta;

  factory SoldCampaignsModel.fromJson(Map<String, dynamic> json) =>
      SoldCampaignsModel(
        soldCampaigns: List<SoldCampaign>.from(
            json["data"].map((x) => SoldCampaign.fromJson(x))),
        links: Links.fromJson(json["links"]),
        meta: Meta.fromJson(json["meta"]),
      );
}

class SoldCampaign {
  SoldCampaign({
    required this.id,
    required this.orderNo,
    required this.productId,
    required this.status,
    required this.retailerSaleOrderId,
    required this.discountAmount,
    required this.qty,
    required this.partialAmount,
    required this.date,
    required this.product,
  });

  int id;
  String orderNo;
  String productId;
  String status;
  String retailerSaleOrderId;
  int discountAmount;
  int qty;
  int partialAmount;
  String date;
  Product product;

  factory SoldCampaign.fromJson(Map<String, dynamic> json) => SoldCampaign(
        id: json["id"],
        orderNo: json["order_no"],
        productId: json["product_id"],
        status: json["status"],
        retailerSaleOrderId: json["retailer_sale_order_id"],
        discountAmount: json["discount_amount"],
        qty: json["qty"],
        partialAmount: json["partial_amount"],
        date: json["date"],
        product: Product.fromJson(json["product"]),
      );
}

class Product {
  Product({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
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
        from: json["from"],
        lastPage: json["last_page"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
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
