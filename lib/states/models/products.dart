class ProductsModel {
  ProductsModel({
    required this.data,
    required this.links,
    required this.meta,
  });
  late final List<ProductModel> data;
  late final Links links;
  late final Meta meta;

  ProductsModel.fromJson(Map<String, dynamic> json) {
    data =
        List.from(json['data']).map((e) => ProductModel.fromJson(e)).toList();
    links = Links.fromJson(json['links']);
    meta = Meta.fromJson(json['meta']);
  }

  Map<String, dynamic> toJson() {
    final value = <String, dynamic>{};
    value['data'] = data.map((e) => e.toJson()).toList();
    value['links'] = links.toJson();
    value['meta'] = meta.toJson();
    return value;
  }
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
    required this.rpPrice,
    required this.mrpPrice,
    this.remarks,
    required this.liftingPrice,
  });
  late final int id;
  late final String productNo;
  late final String name;
  late final String url;
  late final String categoryId;
  late final String brandId;
  late final String unitId;
  late final String warrantyId;
  late final int rpPrice;
  late final int mrpPrice;
  late final String? remarks;
  late final int liftingPrice;

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productNo = json['product_no'];
    name = json['name'];
    url = json['url'];
    categoryId = json['category_id'];
    brandId = json['brand_id'];
    unitId = json['unit_id'];
    warrantyId = json['warranty_id'];
    rpPrice = json['rp_price'];
    mrpPrice = json['mrp_price'];
    remarks = null;
    liftingPrice = json['lifting_price'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['product_no'] = productNo;
    data['name'] = name;
    data['url'] = url;
    data['category_id'] = categoryId;
    data['brand_id'] = brandId;
    data['unit_id'] = unitId;
    data['warranty_id'] = warrantyId;
    data['rp_price'] = rpPrice;
    data['mrp_price'] = mrpPrice;
    data['remarks'] = remarks;
    data['lifting_price'] = liftingPrice;
    return data;
  }
}

class Links {
  Links({
    required this.first,
    required this.last,
    // this.prev,
    // this.next,
  });
  late final String first;
  late final String last;
  // late final void prev;
  // late final void next;

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    // prev = null;
    // next = null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['first'] = first;
    data['last'] = last;
    // data['prev'] = prev;
    // data['next'] = next;
    return data;
  }
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
  late final int currentPage;
  late final int from;
  late final int lastPage;
  late final List<Links> links;
  late final String path;
  late final int perPage;
  late final int to;
  late final int total;

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    links = List.from(json['links']).map((e) => Links.fromJson(e)).toList();
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['current_page'] = currentPage;
    data['from'] = from;
    data['last_page'] = lastPage;
    data['links'] = links.map((e) => e.toJson()).toList();
    data['path'] = path;
    data['per_page'] = perPage;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}
