import '../model/log_model.dart';
import '../model/register_model.dart';
import '../wep_services/wep_service.dart';
import 'package:flutter/cupertino.dart';

class UserRepo {
  final WebServices webServices;

  UserRepo(this.webServices);

  Future<UserModel> userLogin(LogModel userEntity) async {
    final response = await webServices.userLogin(userEntity);
    debugPrint(response.toString());
    return UserModel.fromJson(response);
  }

  Future<UserModel> userRegister(RegisterModel userEntity) async {
    final response = await webServices.userRegister(userEntity);
    debugPrint(response.toString());
    return UserModel.fromJson(response);
  }
}
