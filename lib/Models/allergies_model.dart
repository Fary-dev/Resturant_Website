class Alergies {
  late int? id;
  late String title;
  late String description;
  late String image;

  Alergies({
    this.id,
    required this.title,
    required this.description,
    required this.image,
  });

  Map<String, dynamic> get toJson {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    return data;
  }

  Alergies.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    title = json['title'] as String;
    description = json['description'] as String;
    image = json['image'] as String;
  }
}
