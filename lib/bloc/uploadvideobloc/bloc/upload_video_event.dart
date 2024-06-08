part of 'upload_video_bloc.dart';

class UploadVideoEvent extends Equatable {
  const UploadVideoEvent();

  @override
  List<Object> get props => [];
}

class uploadVideo extends UploadVideoEvent {
  final String filepath;
  final String userPh;
  const uploadVideo(this.filepath, this.userPh);

  @override
  List<Object> get props => [filepath, userPh];
}
