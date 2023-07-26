import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../models/coach.dart';

part 'coachdb_event.dart';
part 'coachdb_state.dart';

class CoachdbBloc extends Bloc<CoachdbEvent, CoachdbState> {
  CoachdbBloc() : super(CoachdbInitial()) {
    on<CoachdbEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
