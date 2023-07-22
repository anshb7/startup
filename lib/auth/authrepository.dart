import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final _firebaseAuth = FirebaseAuth.instance;
  Future<void> signUp({required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak_password') {
        throw Exception('Your password is too weak');
      }
      if (e.code == 'email-already-in-use') {
        throw Exception('Email is already being used');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
