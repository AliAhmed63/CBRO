part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final UserModel userModel;

  AuthSuccess(this.userModel);
}

class AuthError extends AuthState {
  final String er;

  AuthError(this.er);
}
