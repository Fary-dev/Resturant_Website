import 'package:equatable/equatable.dart';
import 'package:flutter_app/Models/user_mode.dart';

class StateBloc extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialUser extends StateBloc {}

class LodingUser extends StateBloc {}

class Authenticated extends StateBloc {
  final User user;
  Authenticated({required this.user});
  @override
  List<Object> get props => [user];
}

class FaildUser extends StateBloc {
  final Exception massage;
  FaildUser(this.massage);
  @override
  List<Object> get props => [massage];
  List<Object>? get exception => null;
}
