import 'package:flutter_app/Models/ingredients_model.dart';

class Product {
  late int? id;
  late String name;
  late String? description;
  late List<String>? image;
  late List<String>? size;
  late List<double> price;
  late bool isAvailable;
  late List<Ingredient> ingredients;
  late List<Ingredient>? extraIngredients;

  Product({
    this.id,
    required this.name,
    this.description,
    this.image,
    this.size,
    required this.price,
    required this.isAvailable,
    required this.ingredients,
    this.extraIngredients,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    if (this.image != null) {
      data['image'] = this.image!.map<dynamic>((v) => v);
    }
    if (this.size != null) {
      data['size'] = this.size!.map<dynamic>((v) => v);
    }
    if (this.price != null) {
      data['price'] = this.price.map<dynamic>((v) => v);
    }
    data['isAvailable'] = this.isAvailable;
    if (this.ingredients != null) {
      data['ingredients'] = this.ingredients.map<dynamic>((v) => v.toJson);
    }
    if (this.extraIngredients != null) {
      data['extraIngredients'] =
          this.extraIngredients!.map<dynamic>((v) => v.toJson);
    }
    return data;
  }

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    name = json['name'] as String;
    description = json['description'] as String;
    if (json['image'] != null) {
      json['image'] = List<Ingredient>.from(image!.map<dynamic>((e) => e));
    }
    if (json['size'] != null) {
      json['size'] = List<Ingredient>.from(size!.map<dynamic>((e) => e));
    }
    if (json['price'] != null) {
      json['price'] = List<Ingredient>.from(price.map<dynamic>((e) => e));
    }
    isAvailable = json['isAvailable'] as bool;
    if (json['ingredients'] != null) {
      json['ingredients'] = List<Ingredient>.from(
          ingredients.map<dynamic>((e) => Ingredient.fromJson(e.toJson())));
    }
    if (json['extraIngredients'] != null) {
      json['extraIngredients'] = List<Ingredient>.from(extraIngredients!
          .map<dynamic>((e) => Ingredient.fromJson(e.toJson())));
    }
  }
}
