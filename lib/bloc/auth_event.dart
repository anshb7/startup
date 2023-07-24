part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class signUpRequested extends AuthEvent {
  final String email;
  final String password;
  signUpRequested(this.email, this.password);
}

class signInRequested extends AuthEvent {
  final String email;
  final String password;

  signInRequested(this.email, this.password);
}

class SignOutRequested extends AuthEvent {}
