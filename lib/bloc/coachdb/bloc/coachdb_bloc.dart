import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:startup/database/databaseprov.dart';

import '../../../models/coach.dart';

part 'coachdb_event.dart';
part 'coachdb_state.dart';

class CoachdbBloc extends Bloc<CoachdbEvent, CoachdbState> {
  final DatabaseService databaseService;
  CoachdbBloc({required this.databaseService}) : super(CoachdbInitial()) {
    on<dataSend>((event, emit) async {
      emit(Loading());
      try {
        await databaseService.addUserData(CoachInfo(
            name: event.name,
            age: event.age,
            phNo: event.phoneNo,
            academyName: event.academyName,
            sportName: event.sportName,
            noOfExp: event.noOfExp));
        emit(dataSent());
      } catch (e) {
        emit(DatabaseError());
      }
    });
  }
}
