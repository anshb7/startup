import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:startup/database/databaseprov.dart';

part 'upload_video_event.dart';
part 'upload_video_state.dart';

class UploadVideoBloc extends Bloc<UploadVideoEvent, UploadVideoState> {
  final DatabaseService databaseService;
  UploadVideoBloc(this.databaseService) : super(UploadVideoInitial()) {
    on<UploadVideoEvent>((event, emit) {});
    on<uploadVideo>((event, emit) async {
      emit(UploadVideoLoading());
      try {
        await databaseService.uploadVideotoStorage(
            event.filepath, event.userPh);
        emit(uploadVideoSuccess());
      } catch (e) {
        emit(uploadVideoFailure());
      }
    });
  }
}
