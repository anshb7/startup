import 'package:firebase_auth/firebase_auth.dart';
import 'package:startup/usermodel.dart';

class AuthRepository {
  final _firebaseAuth = FirebaseAuth.instance;
  Future<UserModel?> signUp({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? fuser = userCredential.user;
      if (fuser != null) {
        return UserModel(email: fuser.email, id: fuser.uid);
      }
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
    return null;
  }

  Future<UserModel?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      User? fuser = userCredential.user;
      if (fuser != null) {
        return UserModel(email: fuser.email, id: fuser.uid);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    return null;
  }

  Future<void> signOut() async {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      await _firebaseAuth.signOut();
    }
  }
}
