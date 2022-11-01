import 'dart:convert';

ProductsModel productsModelFromJson(String str) =>
    ProductsModel.fromJson(json.decode(str));

class ProductsModel {
  ProductsModel({
    required this.data,
    // required this.links,
    // required this.meta,
  });

  List<ProductModel> data;
  // Links links;
  // Meta meta;

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        data: List<ProductModel>.from(
            json["data"].map((x) => ProductModel.fromJson(x))),
        // links: Links.fromJson(json["links"]),
        // meta: Meta.fromJson(json["meta"]),
      );
}

class ProductModel {
  ProductModel({
    required this.id,
    required this.productNo,
    required this.name,
    required this.url,
    required this.categoryId,
    required this.brandId,
    required this.unitId,
    required this.warrantyId,
    required this.dpPrice,
    required this.rpPrice,
    required this.mrpPrice,
    required this.remarks,
    required this.liftingPrice,
  });

  int id;
  String productNo;
  String name;
  String url;
  String categoryId;
  String brandId;
  String unitId;
  String warrantyId;
  int dpPrice;
  int rpPrice;
  int mrpPrice;
  String remarks;
  int liftingPrice;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        productNo: json["product_no"],
        name: json["name"],
        url: json["url"],
        categoryId: json["category_id"],
        brandId: json["brand_id"],
        unitId: json["unit_id"],
        warrantyId: json["warranty_id"],
        dpPrice: json["dp_price"] ?? -1,
        rpPrice: json["rp_price"],
        mrpPrice: json["mrp_price"],
        remarks: json["remarks"] ?? '',
        liftingPrice: json["lifting_price"] ?? -1,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_no": productNo,
        "name": name,
        "url": url,
        "category_id": categoryId,
        "brand_id": brandId,
        "unit_id": unitId,
        "warranty_id": warrantyId,
        "dp_price": dpPrice,
        "rp_price": rpPrice,
        "mrp_price": mrpPrice,
        "remarks": remarks,
        "lifting_price": liftingPrice,
      };
}
