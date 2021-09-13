// ignore_for_file: unnecessary_statements, unused_label, avoid_unused_constructor_parameters

class User {
  late int id;
  late String firstName;
  late String lastName;
  late String mobile;
  late String? email;
  late String? password;
  late String? token;
  late String? adress;
  late int type;
  late bool isActive;
  late String? image;
  late String? lastLogin;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.mobile,
    this.email,
    this.password,
    this.token,
    this.adress,
    required this.type,
    required this.isActive,
    this.image,
    this.lastLogin,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json["id"] as int;
    firstName = json["firstName"] as String;
    lastName = json["lastName"] as String;
    mobile = json["mobile"] as String;
    email = json["email"] as String;
    password = json["password"] as String;
    token = json["token"] as String;
    adress = json["adress"] as String;
    type = json["type"] as int;
    isActive = json["isActive"] as bool;
    image = json["image"] as String;
    lastLogin = json["lastLogin"] as String;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["id"] = id;
    map["firstName"] = firstName;
    map["lastName"] = lastName;
    map["mobile"] = mobile;
    map["email"] = email;
    map["password"] = password;
    map["token"] = token;
    map["adress"] = adress;
    map["type"] = type;
    map["isActive"] = isActive;
    map["image"] = image;
    map["lastLogin"] = lastLogin;
    return map;
  }

  String get typeName => type == 1
      ? "Admin"
      : type == 2
          ? "Customer"
          : "Other";
}
