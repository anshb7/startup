part of 'coachdb_bloc.dart';

abstract class CoachdbEvent extends Equatable {
  const CoachdbEvent();

  @override
  List<Object> get props => [];
}

class dataSend extends CoachdbEvent {
  CoachInfo coach = CoachInfo(
      name: "", age: 0, phNo: 0, academyName: "", sportName: "", noOfExp: 0);
  dataSend({required this.coach});
  List<Object> get props => [coach];
}
