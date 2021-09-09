import 'package:flutter_app/Moduls/user_mode.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:equatable/equatable.dart';

class AuthenticationController extends GetxController with StateMixin<User> {
  final _authenticationStateStream = AuthenticationState().obs;
  AuthenticationState get statee => _authenticationStateStream.value;

  AuthenticationController();

  @override
  void onInit() {
    _getAuthenticatedUser();
    super.onInit();
  }

  void _getAuthenticatedUser() {
    User? _user;
    Future authentication(String mobile, String pass) async {
      if (status == RxStatus.loading()) {
        _authenticationStateStream.value = AuthenticationLoading();
        return;
      }

      try {
        _authenticationStateStream.value = AuthenticationLoading();
        _user = await UserRepository.authentication(mobile, pass);
        _user != null
            ? _authenticationStateStream.value = Authenticated(user: _user!)
            : _authenticationStateStream.value = UnAuthenticated();
        Authenticated(user: _user!);
      } catch (e) {
        Exception(RxStatus.error(e as String));
        _authenticationStateStream.value = AuthenticationFailure(message: e);
      }
    }
  }
}

class UserRepository extends GetConnect {
  static Future<User> authentication(String mobile, String pass) async {
    return await Future<dynamic>.delayed(Duration(seconds: 3))
        .then((dynamic value) {
      if (mobile == '2' && pass == '1') {
        Map<String, dynamic> _res = <String, dynamic>{
          'id': 1,
          'firstName': 'Hasan',
          'lastName': 'Hasani',
          'mobile': '12345',
          'type': 1,
          'activ': 1
        };
        return User.fromJson(_res);
      }
      throw Exception('Mobile or Password was wrong!');
    });
  }
}

class AuthenticationState extends Equatable {
  const AuthenticationState();
  @override
  List<Object> get props => [];
}

class AuthenticationLoading extends AuthenticationState {}

class UnAuthenticated extends AuthenticationState {}

class Authenticated extends AuthenticationState {
  final User user;
  Authenticated({required this.user});

  @override
  List<Object> get props => [user];
}

class AuthenticationFailure extends AuthenticationState {
  final String message;

  AuthenticationFailure({required this.message});

  @override
  List<Object> get props => [message];
}
