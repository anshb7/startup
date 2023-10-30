import 'package:flutter/foundation.dart';

class studentInfo with ChangeNotifier {
  String academyId = '';
  String name = "";
  double age = 0;
  String gender = '';
  String session = '';
  String parentname = "";
  double ppNo = 0;
  double fh = 0;
  double bh = 0;
  double ag = 0;
  double fl = 0;
  double ser = 0;
  double st = 0;
  double ref = 0;

  studentInfo(
      {required this.academyId,
      required this.name,
      required this.age,
      required this.gender,
      required this.session,
      required this.parentname,
      required this.ppNo,
      required this.fh,
      required this.bh,
      required this.ag,
      required this.fl,
      required this.ser,
      required this.st,
      required this.ref});
  Map<String, dynamic> toJson() => {
        "academyId": academyId,
        "name": name,
        "age": age,
        "ppNo": ppNo,
        "gender": gender,
        "session": session,
        "parentname": parentname,
        "forehand": fh,
        "bh": bh,
        "ag": ag,
        "fl": fl,
        "ser": ser,
        "st": st,
        "ref": ref
      };
  static studentInfo fromJson(Map<String, dynamic> json) {
    return studentInfo(
        academyId: json['academyId'],
        name: json['name'],
        age: json['age'],
        gender: json['gender'],
        session: json['session'],
        parentname: json['parentname'],
        ppNo: json['ppNo'],
        fh: json['fh'],
        bh: json['bh'],
        ag: json['ag'],
        fl: json['fl'],
        ser: json['ser'],
        st: json['st'],
        ref: json['ref']);
  }
}

class Coaches with ChangeNotifier {
  List<studentInfo> _coaches = [];
  List<studentInfo> get coaches {
    return [..._coaches];
  }
}
