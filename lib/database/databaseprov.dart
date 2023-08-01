import 'package:firebase_auth/firebase_auth.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:startup/models/coach.dart';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  var user = FirebaseAuth.instance.currentUser;

  addUserData(CoachInfo userData) async {
    await _db
        .collection("Coaches")
        .doc(user!.uid.toString())
        .set(userData.toJson());
  }

  // Future<List<UserModel>> retrieveUserData() async {
  //   QuerySnapshot<Map<String, dynamic>> snapshot =
  //       await _db.collection("Users").get();
  //   return snapshot.docs
  //       .map((docSnapshot) => UserModel.fromDocumentSnapshot(docSnapshot))
  //       .toList();
  // }

  // Future<String> retrieveUserName(UserModel user) async {
  //   DocumentSnapshot<Map<String, dynamic>> snapshot =
  //       await _db.collection("Users").doc(user.uid).get();
  //   return snapshot.data()!["displayName"];
  // }
}
