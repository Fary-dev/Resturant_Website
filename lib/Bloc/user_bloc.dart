// ignore_for_file: avoid_void_async

import 'package:flutter_app/Bloc/bloc_state.dart';
import 'package:flutter_app/Moduls/user_mode.dart';
import 'package:flutter_app/Repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserBloc extends Cubit<BlocState> {
  UserBloc() : super(Initial()) {
    SharedPreferences.getInstance().then((value) {
      String token = value.getString('token') ?? '';
      if (token.isNotEmpty) verifyToken(token);
    });
  }

  User? _user;

  void authenticete(String mobile, String pass, bool remember) async {
    if (state is Loding) return;

    try {
      emit(Loding());
      _user = await UserRepository.authentication(mobile, pass);
      if (remember)
        await SharedPreferences.getInstance()
            .then((value) => value.setString('token', _user!.token!));
      emit(Authenticated(_user!));
    } catch (e) {
      emit(Faild(e as Exception));
    }
  }

  void verifyToken(String token) async {
    if (state is Loding) return;
    try {
      emit(Loding());
      _user = await UserRepository.verifyToken(token);
      emit(Authenticated(_user!));
    } catch (e) {
      emit(Initial());
    }
  }

  void signOut() async {
    await SharedPreferences.getInstance()
        .then((value) => value.remove('token'));
    emit(Initial());
  }

  User? get user => _user;
}
