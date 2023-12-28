part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class signUpRequested extends AuthEvent {
  final String email;
  final String password;
  final bool flag;
  signUpRequested(this.email, this.password, this.flag);
}

class signInRequested extends AuthEvent {
  final String email;
  final String password;
  final bool flag;

  signInRequested(this.email, this.password, this.flag);
}

class SignOutRequested extends AuthEvent {}
