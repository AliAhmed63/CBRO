

import '../../../data/profile_model/profile_model.dart';

class ProfileState {}

class ProfileInitialState extends ProfileState {}

class ProfileLoadingState extends ProfileState {

}

class ProfileSuccessState extends ProfileState {
 final ProfileModel model;

 ProfileSuccessState(this.model);
}

class ProfileFailureState extends ProfileState {
 final String errorMessage;

 ProfileFailureState(this.errorMessage);
}
