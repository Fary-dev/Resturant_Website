import 'product_model.dart';

class ProductType {
  late int? id;
  late String title;
  late String? description;
  late String? image;
  late bool isAvailable;
  late List<Product> products;

  ProductType({
    this.id,
    required this.title,
    this.description,
    this.image,
    required this.isAvailable,
    required this.products,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    data['isAvailable'] = this.isAvailable;
    if (this.products != null) {
      data['products'] = this.products.map<dynamic>((v) => v.toJson).toList();
    }
    return data;
  }

  ProductType.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    title = json['title'] as String;
    description = json['description'] as String;
    image = json['image'] as String;
    isAvailable = json['isAvailable'] as bool;
    if (json['image'] != null) {
      json['products'] = List<Product>.from(
          products.map<dynamic>((e) => Product.fromJson(e.toJson())));
    }
  }
}
