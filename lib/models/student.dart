import 'package:flutter/foundation.dart';

class studentInfo with ChangeNotifier {
  String academyId = '';
  String name = "";
  double age = 0;
  String gender = '';
  String session = '';
  String parentname = "";
  double ppNo = 0;
  studentInfo(
      {required this.academyId,
      required this.name,
      required this.age,
      required this.gender,
      required this.session,
      required this.parentname,
      required this.ppNo});
  Map<String, dynamic> toJson() => {
        "academyId": academyId,
        "name": name,
        "age": age,
        "ppNo": ppNo,
        "gender": gender,
        "session": session,
        "parentname": parentname
      };
  static studentInfo fromJson(Map<String, dynamic> json) {
    return studentInfo(
        academyId: json['academyId'],
        name: json['name'],
        age: json['age'],
        gender: json['gender'],
        session: json['session'],
        parentname: json['parentname'],
        ppNo: json['ppNo']);
  }
}

class Coaches with ChangeNotifier {
  List<studentInfo> _coaches = [];
  List<studentInfo> get coaches {
    return [..._coaches];
  }
}
