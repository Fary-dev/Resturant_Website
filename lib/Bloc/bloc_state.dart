import 'package:flutter/material.dart';
import 'package:flutter_app/Moduls/user_mode.dart';

@immutable
abstract class BlocState {}

class Initial extends BlocState {}

class Loding extends BlocState {}

class Faild extends BlocState {
  final Exception exception;
  Faild(this.exception);
}

class Authenticated extends BlocState {
  final User user;
  Authenticated(this.user);
}
