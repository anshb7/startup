import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:startup/models/coach.dart';
import 'package:startup/models/student.dart';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  var user = FirebaseAuth.instance.currentUser;

  addUserData(CoachInfo userData) async {
    await _db
        .collection("Coaches")
        .doc(user!.uid.toString())
        .set(userData.toJson());
  }

  addStudentData(studentInfo student, String uid) async {
    await _db.collection("AllStudents").doc(uid).set(student.toJson());
  }

  addinacademies(studentInfo student, String sid, String academyname) async {
    await _db
        .collection("Academies")
        .doc(academyname)
        .collection("Students")
        .doc(sid)
        .set(student.toJson());
  }

  Future<void> uploadVideotoStorage(String path, String uid) async {
    DateTime date = DateTime.now();
    try {
      File videoFile = File(path);
      Reference firebaseStoreRef = FirebaseStorage.instance
          .ref()
          .child("/rewards/$date}/${uid}/submission");
      await firebaseStoreRef.putFile(videoFile);
      String url = await firebaseStoreRef.getDownloadURL();
      await FirebaseFirestore.instance
          .collection("Rewards")
          .doc("${uid}")
          .collection("Submissions")
          .doc(date.toString())
          .set({"submissionLink": url, "rewardPoints": 5});
    } catch (e) {
      print(e.toString());
      rethrow;
    }
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
