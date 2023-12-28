import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final _firebaseAuth = FirebaseAuth.instance;
  Future<void> signUp(
      {required String email,
      required String password,
      required bool flag}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      flag = true;
    } on FirebaseAuthException catch (e) {
      flag = false;
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

  Future<void> signIn(
      {required String email,
      required String password,
      required bool flag}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      flag = true;
    } on FirebaseAuthException catch (e) {
      flag = false;
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
