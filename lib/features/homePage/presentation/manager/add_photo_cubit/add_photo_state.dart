part of 'add_photo_cubit.dart';

abstract class AddPhotoState {}

class AddPhotoInitial extends AddPhotoState {}


class AddPhotoLoading extends AddPhotoState {}

class AddPhotoSuccess extends AddPhotoState {
  final AddPhotoResponse response;

  AddPhotoSuccess(this.response);
}

class AddPhotoError extends AddPhotoState {
  final String errorMessage;

  AddPhotoError(this.errorMessage);
}
