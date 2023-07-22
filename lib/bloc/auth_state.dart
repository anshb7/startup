part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class Loading extends AuthState {
  @override
  List<Object> get props => [];
}

class unAuthenticated extends AuthState {
  @override
  List<Object> get props => [];
}
