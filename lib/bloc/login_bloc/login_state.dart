
import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {}

class LoginInitialState extends LoginState {
  @override
  List<Object?> get props => [];
}


class LoginSuccessfulState extends LoginState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}


class LoginFailureState extends LoginState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class LoginLoadingState extends LoginState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}