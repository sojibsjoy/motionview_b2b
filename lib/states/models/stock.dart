import 'dart:convert';

StocksModel stocksModelFromJson(String str) =>
    StocksModel.fromJson(json.decode(str));

class StocksModel {
  StocksModel({
    required this.data,
    required this.links,
    required this.meta,
  });

  List<StockModel> data;
  Links links;
  Meta meta;

  factory StocksModel.fromJson(Map<String, dynamic> json) => StocksModel(
        data: List<StockModel>.from(
            json["data"].map((x) => StockModel.fromJson(x))),
        links: Links.fromJson(json["links"]),
        meta: Meta.fromJson(json["meta"]),
      );
}

class StockModel {
  StockModel({
    required this.id,
    required this.productNo,
    required this.name,
    required this.url,
    required this.categoryId,
    required this.brandId,
    required this.unitId,
    required this.warrantyId,
    required this.stockValue,
    required this.rpPrice,
    required this.mrpPrice,
    required this.remarks,
    required this.eolDate,
  });

  int id;
  String productNo;
  String name;
  String url;
  String categoryId;
  String brandId;
  String unitId;
  String warrantyId;
  StockValue stockValue;
  double rpPrice;
  double mrpPrice;
  String remarks;
  // DateTime eolDate;
  String eolDate;

  factory StockModel.fromJson(Map<String, dynamic> json) => StockModel(
        id: json["id"],
        productNo: json["product_no"],
        name: json["name"],
        url: json["url"],
        categoryId: json["category_id"],
        brandId: json["brand_id"],
        unitId: json["unit_id"],
        warrantyId: json["warranty_id"],
        stockValue: json["stock_value"] == null
            ? StockValue(stock: 0, liftingPrice: 0)
            : StockValue.fromJson(json["stock_value"]),
        rpPrice: json["rp_price"] == null
            ? 0.0
            : double.parse(json["rp_price"].toString()),
        mrpPrice: json["mrp_price"] == null
            ? 0.0
            : double.parse(json["mrp_price"].toString()),
        remarks: json["remarks"] ?? '',
        eolDate: json["eol_date"] ?? '',
      );
}

class StockValue {
  StockValue({
    required this.stock,
    required this.liftingPrice,
  });

  int stock;
  double liftingPrice;

  factory StockValue.fromJson(Map<String, dynamic> json) => StockValue(
        stock: json["stock"],
        liftingPrice: json["lifting_price"] == null
            ? 0.0
            : double.parse(json["lifting_price"].toString()),
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
