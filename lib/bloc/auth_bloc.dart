import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:startup/auth/authrepository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(unAuthenticated()) {
    on<signInRequested>((event, emit) async {
      emit(Loading());
      try {
        await authRepository.signIn(
            email: event.email, password: event.password);
        emit(Authenticated());
      } catch (e) {
        emit(AuthError(e.toString()));
        emit(unAuthenticated());
      }
    });
    on<signUpRequested>((event, emit) async {
      emit(Loading());

      try {
        await authRepository.signUp(
            email: event.email, password: event.password);
      } catch (e) {
        throw Exception(unAuthenticated);
      }
    });
    on<SignOutRequested>((event, emit) async {
      emit(Loading());
      await authRepository.signOut();
      emit(unAuthenticated());
    });
  }
}
