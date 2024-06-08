import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:startup/student/otpScreen.dart';
import 'package:startup/usermodel.dart';

class AuthRepository {
  final _firebaseAuth = FirebaseAuth.instance;
  String verificationID = "";

  get credential => null;
  Future<void> phoneAuth({
    required String phoneNo,
  }) async {
    print(phoneNo);
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNo,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _firebaseAuth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        } else {
          print("${e.toString()}");
        }
        //showDialog(context: context, builder: builder)
      },
      codeSent: (String verificationId, int? resendToken) {
        verificationID = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        verificationID = verificationId;
      },
    );

    print(verificationID);
  }

  Future<void> signOut() async {
    print("signout called");
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      await _firebaseAuth.signOut();
    }
  }

  Future<void> verifyPhoneNumber(String smscode) async {
    try {
      PhoneAuthCredential credential = await PhoneAuthProvider.credential(
          verificationId: verificationID, smsCode: smscode);

      await _firebaseAuth.signInWithCredential(credential);
    } catch (e) {
      print(e.toString());
    }
  }
}
