
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
 late bool activity;
 late String? image;
 late String? lastLogin;


  User({
     required int id,
     required String firstName,
     required String lastName,
     required String mobile,
      String? email,
      String? password,
      String? token,
      String? adress,
     required int type,
     required bool activity,
      String? image,
      String? lastLogin});

   User.fromJson(dynamic json){
    id : json['id'];
    firstName : json['firstName'];
    lastName : json['lastName'];
    mobile : json['mobile'];
    email : json['email'];
    password : json['password'];
    token :json['token'];
    adress : json['adress'];
    type : json['type'];
    activity : json['activity']==1;
    image : json['image'];
    lastLogin : json['lastLogin'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['Id'] = id;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['mobile'] = mobile;
    map['email'] = email;
    map['password'] = password;
    map['token'] = token;
    map['adress'] = adress;
    map['type'] = type;
    map['activity'] = activity?1:0;
    map['image'] = image;
    map['lastLogin'] = lastLogin;
    return map;
  }
  String get typeName=> type==1?'Admin':type==2?'Customer':'Other';
}