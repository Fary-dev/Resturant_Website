import 'package:flutter_app/Bloc/state_bloc.dart';
import 'package:flutter_app/Models/user_mode.dart';
import 'package:get/get.dart';

abstract class AuthenticationService extends GetxService {
  Future<User> authenticationWithMobile(String mobile, String pass);
  Future<User> verifyToken(String token);
}

class FakeAuthenticationService extends AuthenticationService {
  final blocStateGetx = StateBloc().obs;

  StateBloc get state => blocStateGetx.value;

  @override
  Future<User> authenticationWithMobile(String mobile, String pass) async {
    return await Future<User?>.delayed(const Duration(seconds: 2)).then((val) {
      
      if (mobile == "2" && pass == "2") {
        Map <String, dynamic> _res = <String, dynamic>{
          "id": 1,
          "firstName": "Alex",
          "lastName": "Müller",
          "mobile": "12345",
          "email": "Reza@dffdsdf.com",
          "password": "1234",
          "token": "TqNENlHA-0mvPt6_V7gi4g",
          "adress": "sdfhsdh,32 dsfghsddsfgsdghl4 el dl dl",
          "type": 1,
          "isActive": 1,
          "registerDate": "12.05.2021",
          "image": "photo",
          "lastLogin": "yesterdey"
        };
        print(_res);
        return User.fromJson(_res);
      }
      throw Failure('Mobile or Password was wrong!');
    });
  }

  @override
  Future<User> verifyToken(String token) async {
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
          "isActive": 1,
          "image": "photo",
          "registerDate": "12.05.2021",
          "lastLogin": "yesterdey"
        };
        return User.fromJson(_res);
      }
      throw Failure('Mobile or Password was wrong!');
    });
  }
}

class Failure implements Exception {
  final String message;

  Failure(this.message);

  @override
  String toString() => message;
}
