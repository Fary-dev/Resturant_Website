import 'package:flutter_app/Models/menu_model.dart';
import 'package:flutter_app/Models/product_model.dart';

class Resturant {
  late int? id;
  late String name;
  late String? title;
  late String? description;
  late List<String> image;
  late String owner;
  late String? logo;
  late String adresse;
  late bool isOpen;
  late String phone;
  late String email;
  late List<ProductType> menu;
  late List<Product>? recommend;

  Resturant({
    this.id,
    required this.name,
    this.title,
    this.description,
    required this.image,
    required this.owner,
    this.logo,
    required this.adresse,
    required this.isOpen,
    required this.phone,
    required this.email,
    required this.menu,
    this.recommend,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['title'] = this.title;
    data['description'] = this.description;
    if (this.image != null) {
      data['image'] = this.image.map<dynamic>((v) => v);
    }
    data['owner'] = this.owner;
    data['logo'] = this.logo;
    data['adresse'] = this.adresse;
    data['isOpen'] = this.isOpen;
    data['phone'] = this.phone;
    data['email'] = this.email;
    if (this.menu != null) {
      data['menu'] = this.menu.map<dynamic>((v) => v.toJson).toList();
    }
    if (this.recommend != null) {
      data['recommend'] =
          this.recommend!.map<dynamic>((v) => v.toJson).toList();
    }
    return data;
  }

  Resturant.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    name = json['name'] as String;
    title = json['title'] as String;
    description = json['description'] as String;
    if (json['image'] != null) {
      json['image'] = List<dynamic>.from(image.map<dynamic>((e) => e));
    }
    owner = json['owner'] as String;
    logo = json['logo'] as String;
    adresse = json['adresse'] as String;
    isOpen = json['isOpen'] as bool;
    phone = json['phone'] as String;
    email = json['email'] as String;
    if (json['menu'] != null) {
      json['menu'] = List<ProductType>.from(
          menu.map<dynamic>((e) => ProductType.fromJson(e.toJson())));
    }
    if (json['recommend'] != null) {
      json['recommend'] = List<Product>.from(
          recommend!.map<dynamic>((e) => Product.fromJson(e.toJson())));
    }
  }
}
