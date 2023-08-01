part of 'coachdb_bloc.dart';

abstract class CoachdbState extends Equatable {
  const CoachdbState();

  @override
  List<Object> get props => [];
}

class CoachdbInitial extends CoachdbState {}

class Loading extends CoachdbState {
  @override
  List<Object> get props => [];
}

class dataSent extends CoachdbState {
  @override
  List<Object> get props => [];
}

class DatabaseError extends CoachdbState {
  @override
  List<Object> get props => [];
}
