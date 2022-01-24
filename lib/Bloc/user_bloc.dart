import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Services/service.dart';
import 'package:flutter_app/Models/user_mode.dart';
import 'state_bloc.dart';

class UserBloc extends GetxController {
  final AuthenticationService _authenticationService;
  final _state = StateBloc().obs;

  StateBloc get state => _state.value;

  UserBloc(this._authenticationService);

  User? _user;

  @override
  void onInit() {
    _state.value = InitialUser();
    SharedPreferences.getInstance().then((value) {
      String token = value.getString('token') ?? '';
      if (token.isNotEmpty) verifyToken(token);
    });
    super.onInit();
  }

  Future<void> verifyToken(String token) async {
    if (_state.value is LodingUser) return;
    try {
      _state.value = LodingUser();
      _user = await _authenticationService.verifyToken(token);
      if (_user == null) _state.value = InitialUser();
      _state.value = Authenticated(user: user!);
    } catch (e) {
      throw Exception(e);
      // _state.value = FaildUser(massage: e as String);
    }
  }

  Future<void> signIn(String mobile, String pass, bool remember) async {
    if (_state.value is LodingUser) return;
    try {
      _state.value = LodingUser();
      print('${mobile}  ${pass}  ${remember}');
      _user = await _authenticationService.authenticationWithMobile(mobile, pass);
      print('${mobile}  ${pass}  ${remember}');
       _state.value = Authenticated(user: _user!);

      if (remember)
        await SharedPreferences.getInstance()
            .then((value) => value.setString('token', _user!.token!));
    } catch (e) {
      throw Exception(e);
      // _state.value = FaildUser(e as Exception);
    }
  }

  Future<void> signOut() async {
    await SharedPreferences.getInstance()
        .then((value) => value.remove('token'));
    _state.value = InitialUser();
  }

  User? get user => _user;
}
