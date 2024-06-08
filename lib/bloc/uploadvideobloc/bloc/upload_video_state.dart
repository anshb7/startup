part of 'upload_video_bloc.dart';

class UploadVideoState extends Equatable {
  const UploadVideoState();

  @override
  List<Object> get props => [];
}

class UploadVideoInitial extends UploadVideoState {}

class UploadVideoLoading extends UploadVideoState {}

class uploadVideoSuccess extends UploadVideoState {}

class uploadVideoFailure extends UploadVideoState {}
