class User {
  User({
    int? id,
    String? firstName,
    String? lastName,
    String? mobile,
    String? email,
    String? password,
    String? token,
    String? adress,
    int? type,
    int? isActive,
    String? image,
    String? registerDate,
    String? lastLogin,}){
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
    _mobile = mobile;
    _email = email;
    _password = password;
    _token = token;
    _adress = adress;
    _type = type;
    _isActive = isActive;
    _image = image;
    _registerDate = registerDate;
    _lastLogin = lastLogin;
  }

  User.fromJson(dynamic json) {
    _id = json['id']as int;
    _firstName = json['firstName']as String;
    _lastName = json['lastName']as String;
    _mobile = json['mobile']as String;
    _email = json['email']as String;
    _password = json['password']as String;
    _token = json['token']as String;
    _adress = json['adress']as String;
    _type = json['type']as int;
    _isActive = json['isActive']as int;
    _image = json['image']as String;
    _registerDate = json['registerDate']as String;
    _lastLogin = json['lastLogin']as String;
  }
  int? _id;
  String? _firstName;
  String? _lastName;
  String? _mobile;
  String? _email;
  String? _password;
  String? _token;
  String? _adress;
  int? _type;
  int? _isActive;
  String? _image;
  String? _registerDate;
  String? _lastLogin;

  int? get id => _id;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get mobile => _mobile;
  String? get email => _email;
  String? get password => _password;
  String? get token => _token;
  String? get adress => _adress;
  int? get type => _type;
  int? get isActive => _isActive;
  String? get image => _image;
  String? get registerDate => _registerDate;
  String? get lastLogin => _lastLogin;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['mobile'] = _mobile;
    map['email'] = _email;
    map['password'] = _password;
    map['token'] = _token;
    map['adress'] = _adress;
    map['type'] = _type;
    map['isActive'] = _isActive;
    map['image'] = _image;
    map['registerDate'] = _registerDate;
    map['lastLogin'] = _lastLogin;
    return map;
  }

}

//   String get typeName => type == 1
//       ? "Admin"
//       : type == 2
//           ? "Customer"
//           : "Other";

