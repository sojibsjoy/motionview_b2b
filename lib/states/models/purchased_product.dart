import 'dart:convert';

PurchasedProductsModel purchasedProductsModelFromJson(String str) =>
    PurchasedProductsModel.fromJson(json.decode(str));

class PurchasedProductsModel {
  PurchasedProductsModel({
    required this.purchasedProducts,
    required this.links,
    required this.meta,
  });

  List<PurchasedProduct> purchasedProducts;
  Links links;
  Meta meta;

  factory PurchasedProductsModel.fromJson(Map<String, dynamic> json) =>
      PurchasedProductsModel(
        purchasedProducts: List<PurchasedProduct>.from(
            json["data"].map((x) => PurchasedProduct.fromJson(x))),
        links: Links.fromJson(json["links"]),
        meta: Meta.fromJson(json["meta"]),
      );
}

class PurchasedProduct {
  PurchasedProduct({
    required this.id,
    required this.productNo,
    required this.name,
    required this.warrantyId,
    required this.rpPrice,
    required this.mrpPrice,
    required this.remarks,
    required this.qty,
    required this.slNos,
    required this.selectedSlNos,
    required this.liftingPrice,
  });

  int id;
  String productNo;
  String name;
  String warrantyId;
  int rpPrice;
  int mrpPrice;
  String remarks;
  int qty;
  List<SlNo> slNos;
  List<SlNo> selectedSlNos;
  int liftingPrice;

  factory PurchasedProduct.fromJson(Map<String, dynamic> json) =>
      PurchasedProduct(
        id: json["id"],
        productNo: json["product_no"],
        name: json["name"],
        warrantyId: json["warranty_id"],
        rpPrice: json["rp_price"],
        mrpPrice: json["mrp_price"],
        remarks: json["remarks"] ?? '',
        qty: 1,
        slNos: List<SlNo>.from(json["sn_no"].map((x) => SlNo.fromJson(x))),
        selectedSlNos: List.empty(growable: true),
        liftingPrice: json["lifting_price"],
      );
}

class SlNo {
  SlNo({
    required this.id,
    required this.serialNo,
  });

  int id;
  String serialNo;

  factory SlNo.fromJson(Map<String, dynamic> json) => SlNo(
        id: json["id"],
        serialNo: json["serial_no"],
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
