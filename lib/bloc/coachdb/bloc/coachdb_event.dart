part of 'coachdb_bloc.dart';

abstract class CoachdbEvent extends Equatable {
  const CoachdbEvent();

  @override
  List<Object> get props => [];
}

// ignore: camel_case_types, must_be_immutable
class dataSend extends CoachdbEvent {
  String name;
  double phoneNo;
  String sportName;
  String academyName;
  double age;
  double noOfExp;

  dataSend(
      {required this.name,
      required this.age,
      required this.academyName,
      required this.noOfExp,
      required this.phoneNo,
      required this.sportName});
  List<Object> get props =>
      [name, phoneNo, sportName, academyName, age, noOfExp];
}
