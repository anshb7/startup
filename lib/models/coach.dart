import 'package:flutter/foundation.dart';

class CoachInfo with ChangeNotifier {
  String name = "";
  double age = 0;
  double phNo = 0;
  double noOfExp = 0;
  String sportName = "";
  String academyName = "";
  CoachInfo(
      {required this.name,
      required this.age,
      required this.phNo,
      required this.academyName,
      required this.sportName,
      required this.noOfExp});
  Map<String, dynamic> toJson() => {
        "noOfExp": noOfExp,
        "name": name,
        "emailId": age,
        "phNo": phNo,
        "sportName": sportName,
        "academyName": academyName
      };
  static CoachInfo fromJson(Map<String, dynamic> json) {
    return CoachInfo(
        noOfExp: json['noOfExp'],
        name: json['name'],
        age: json['emailID'],
        phNo: json['phNo'],
        academyName: json['academyName'],
        sportName: json['sportName']);
  }
}

class Coaches with ChangeNotifier {
  List<CoachInfo> _coaches = [];
  List<CoachInfo> get coaches {
    return [..._coaches];
  }
}
