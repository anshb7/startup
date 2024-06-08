part of 'auth_bloc.dart';

abstract class AuthenticationEvent {
  const AuthenticationEvent();

  List<Object> get props => [];
}

class OTPcodesent extends AuthenticationEvent {
  final String phoneNo;

  OTPcodesent(this.phoneNo);
}

class signInwithPhone extends AuthenticationEvent {
  final String smscode;

  signInwithPhone(this.smscode);
}

// class SignInUser extends AuthenticationEvent {
//   final String phoneNo;

//   SignInUser(this.email);

//   @override
//   List<Object> get props => [email, password];
// }

class SignUpUser extends AuthenticationEvent {
  final String email;
  final String password;

  const SignUpUser(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

class SignOut extends AuthenticationEvent {}
