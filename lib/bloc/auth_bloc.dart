import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:startup/auth/authrepository.dart';
import 'package:startup/student/otpScreen.dart';

import 'package:startup/usermodel.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthRepository authService = AuthRepository();

  AuthenticationBloc() : super(AuthenticationInitialState()) {
    on<AuthenticationEvent>((event, emit) {});
    on<signInwithPhone>(
      (event, emit) async {
        emit(AuthenticationLoadingState(isLoading: true));
        try {
          await authService.verifyPhoneNumber(event.smscode);
        } catch (e) {
          emit(AuthenticationFailureState("Not Signed In"));
        }
        emit(AuthenticationSuccessState());

        emit(AuthenticationLoadingState(isLoading: false));
      },
    );
    on<OTPcodesent>((event, emit) async {
      emit(AuthenticationLoadingState(isLoading: true));
      try {
        await authService.phoneAuth(phoneNo: event.phoneNo);

        // final UserModel? user = await authService.signIn(
        //     email: event.email, password: event.password);
        // if (user != null) {
        //   emit(AuthenticationSuccessState(user));
        // } else {
        //   emit(const AuthenticationFailureState('user sign in failed'));
        // }
      } catch (e) {
        print(e.toString());
      }
      emit(authCodeSent());
      emit(AuthenticationLoadingState(isLoading: false));
      emit(AuthenticationInitialState());
    });

    on<SignOut>((event, emit) async {
      emit(AuthenticationLoadingState(isLoading: true));
      try {
        authService.signOut();
      } catch (e) {
        print('error');
        print(e.toString());
      }
      emit(AuthenticationLoadingState(isLoading: false));
      emit(AuthenticationInitialState());
    });
  }
}
