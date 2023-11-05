part of 'stadd_bloc.dart';

class StaddEvent extends Equatable {
  const StaddEvent();

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class sendstdata extends StaddEvent {
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
  String uid = '';

  sendstdata(
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
      required this.ref,
      required this.uid});
  List<Object> get props => [
        academyId,
        name,
        age,
        gender,
        session,
        parentname,
        ppNo,
        fh,
        bh,
        ag,
        fl,
        ser,
        st,
        ref,
        uid,
      ];
}
