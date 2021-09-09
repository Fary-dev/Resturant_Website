
class UserModel {
 late int? _id;
 late String? _firstName;
 late String? _lastName;
 late String? _mobile;
 late String? _email;
 late String? _password;
 late String? _token;
 late String? _adress;
 late int? _type;
 late bool? _activity;
 late String? _image;
 late String? _lastLogin;

  int? get id => _id;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get mobile => _mobile;
  String? get email => _email;
  String? get password => _password;
  String? get token => _token;
  String? get adress => _adress;
  int? get type => _type;
  bool? get activity => _activity;
  String? get image => _image;
  String? get lastLogin => _lastLogin;

  UserModel({
      int? id, 
      String? firstName, 
      String? lastName, 
      String? mobile, 
      String? email, 
      String? password, 
      String? token, 
      String? adress, 
      int? type, 
      bool? activity, 
      String? image, 
      String? lastLogin}){
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
    _mobile = mobile;
    _email = email;
    _password = password;
    _token = token;
    _adress = adress;
    _type = type;
    _activity = activity;
    _image = image;
    _lastLogin = lastLogin;
}

  UserModel.fromJson(dynamic json) {
    _id = json['Id'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _mobile = json['mobile'];
    _email = json['email'];
    _password = json['password'];
    _token = json['token'];
    _adress = json['adress'];
    _type = json['type'];
    _activity = json['activity'];
    _image = json['image'];
    _lastLogin = json['lastLogin'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['Id'] = _id;
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['mobile'] = _mobile;
    map['email'] = _email;
    map['password'] = _password;
    map['token'] = _token;
    map['adress'] = _adress;
    map['type'] = _type;
    map['activity'] = _activity;
    map['image'] = _image;
    map['lastLogin'] = _lastLogin;
    return map;
  }

}