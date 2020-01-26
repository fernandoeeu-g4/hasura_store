class ProductModel {
  String name;
  double price;
  ProductCategory productCategory;
  ProductCategory productType;

  ProductModel({this.name, this.price, this.productCategory, this.productType});

  ProductModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    productCategory = json['product_category'] != null
        ? new ProductCategory.fromJson(json['product_category'])
        : null;
    productType = json['product_type'] != null
        ? new ProductCategory.fromJson(json['product_type'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
    if (this.productCategory != null) {
      data['product_category'] = this.productCategory.toJson();
    }
    if (this.productType != null) {
      data['product_type'] = this.productType.toJson();
    }
    return data;
  }
}

class ProductCategory {
  String description;

  ProductCategory({this.description});

  ProductCategory.fromJson(Map<String, dynamic> json) {
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    return data;
  }
}