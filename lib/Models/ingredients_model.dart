import 'package:flutter_app/Models/allergies_model.dart';

class Ingredient {
  late int? id;
  late String name;
  late String? description;
  late String? image;
  late String? type;
  late bool isAvailable;
  late List<Alergies> allergies;

  Ingredient({
    this.id,
    required this.name,
    this.description,
    this.image,
    this.type,
    required this.isAvailable,
    required this.allergies,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['type'] = this.type;
    data['isAvailable'] = this.isAvailable;
    if (this.allergies != null) {
      data['allergies'] = this.allergies.map<dynamic>((v) => v.toJson);
    }
    return data;
  }

  Ingredient.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    name = json['name'] as String;
    description = json['description'] as String;
    image = json['image'] as String;
    type = json['type'] as String;
    isAvailable = json['isAvailable'] as bool;
    if (json['image'] != null) {
      json['allergies'] = List<Alergies>.from(
          allergies.map<dynamic>((e) => Alergies.fromJson(e.toJson)));
    }
  }
}
