// ignore_for_file: unnecessary_await_in_return, avoid_classes_with_only_static_members, invalid_return_type_for_catch_error

import 'package:flutter_app/Models/user_mode.dart';

class UserRepository {
  static Future<User> authentication(String mobile, String pass) async {
    return await Future<User?>.delayed(const Duration(seconds: 2)).then((val) {
      if (mobile == "2" && pass == "1") {
        final Map<String, dynamic> _res = <String, dynamic>{
          "id": 1,
          "firstName": "Alex",
          "lastName": "Müller",
          "mobile": "12345",
          "email": "Reza@dffdsdf.com",
          "password": "1234",
          "token": "TqNENlHA-0mvPt6_V7gi4g",
          "adress": "sdfhsdh,32 dsfghsddsfgsdghl4 el dl dl",
          "type": 1,
          "isActive": true,
          "image": "photo",
          "lastLogin": "yesterdey"
        };
        return User.fromJson(_res);
      }
      throw Exception('Mobile or Password was wrong!');
    });
  }

  static Future<User> verifyToken(String token) async {
    return await Future<User?>.delayed(const Duration(seconds: 2)).then((val) {
      if (token == "TqNENlHA-0mvPt6_V7gi4g") {
        final Map<String, dynamic> _res = <String, dynamic>{
          "id": 1,
          "firstName": "Alex",
          "lastName": "Müller",
          "mobile": "12345",
          "email": "Reza@dffdsdf.com",
          "password": "1234",
          "token": "TqNENlHA-0mvPt6_V7gi4g",
          "adress": "sdfhsdh,32 dsfghsddsfgsdghl4 el dl dl",
          "type": 1,
          "isActive": true,
          "image": "photo",
          "lastLogin": "yesterdey"
        };
        return User.fromJson(_res);
      }
      throw Exception('Mobile or Password was wrong!');
    });
  }
}
