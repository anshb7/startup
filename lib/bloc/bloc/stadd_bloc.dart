import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:startup/database/databaseprov.dart';
import 'package:startup/models/student.dart';

part 'stadd_event.dart';
part 'stadd_state.dart';

class StaddBloc extends Bloc<StaddEvent, StaddState> {
  final DatabaseService databaseService;

  StaddBloc({required this.databaseService}) : super(StaddInitial()) {
    on<sendstdata>((event, emit) async {
      emit(Loading());
      try {
        await databaseService.addStudentData(
            studentInfo(
                academyId: event.academyId,
                name: event.name,
                age: event.age,
                gender: event.gender,
                session: event.session,
                parentname: event.parentname,
                ppNo: event.ppNo,
                fh: event.fh,
                bh: event.bh,
                ag: event.ag,
                fl: event.fl,
                ser: event.ser,
                st: event.st,
                ref: event.ref),
            event.uid);
        await databaseService.addinacademies(
            studentInfo(
                academyId: event.academyId,
                name: event.name,
                age: event.age,
                gender: event.gender,
                session: event.session,
                parentname: event.parentname,
                ppNo: event.ppNo,
                fh: event.fh,
                bh: event.bh,
                ag: event.ag,
                fl: event.fl,
                ser: event.ser,
                st: event.st,
                ref: event.ref),
            event.uid,
            event.academyId);
        emit(sentstdata());
      } catch (e) {
        emit(DatabaseError());
      }
    });
  }
}
