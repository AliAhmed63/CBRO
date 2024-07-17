import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/model/log_model.dart';
import '../../../data/model/register_model.dart';
import '../../../data/repo/user_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  UserRepo userRepo;

  AuthCubit({required this.userRepo}) : super(AuthInitial());

  Future<void> userLogin(LogModel userEntity) async {
    emit(AuthLoading());
    try {
      var response = await userRepo.userLogin(userEntity);
      emit(AuthSuccess(response));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> userRegister(RegisterModel userEntity) async {
    emit(AuthLoading());
    try {
      var response = await userRepo.userRegister(userEntity);
      emit(AuthSuccess(response));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
