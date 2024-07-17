import 'profile_state.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../../../../../core/api/dio_exception_handler.dart';
import '../../../data/profile_model/profile_model.dart';
import '../../../data/repo/profile_repo.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo profileRepo;

  ProfileCubit(this.profileRepo) : super(ProfileInitialState());

  TextEditingController yourNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  Future<void> getProfile() async {
    emit(ProfileLoadingState());

    try {
      final data = await profileRepo.getProfile();
      emit(ProfileSuccessState(data));
    } on DioException catch (ex) {

      throw dioExceptionHandler(ex);
    } catch (ex) {
      emit(ProfileFailureState(ex.toString()));
      throw ex;
    }
  }
}
