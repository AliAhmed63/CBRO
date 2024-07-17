import '../../../../injection_container.dart';
import '../../../../shred.dart';
import '../../../../core/const.dart';
import '../model/log_model.dart';
import '../model/register_model.dart';
import 'package:dio/dio.dart';

class WebServices {
  late Dio dio;

  WebServices() {
    BaseOptions option = BaseOptions(
      baseUrl: Apis.BaseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 30),
      receiveTimeout: Duration(seconds: 30),
    );
    dio = Dio(option);
    dio.options.followRedirects = true;
  }

  Future<Map<String, dynamic>> userLogin(LogModel userEntity) async {
    try {
      Response response = await dio.post('auth/login', data: {
        'email': userEntity.email,
        'password': userEntity.password,
      });
      if (response.statusCode == 200) {
        final userId = response.data['data']['_id'];
        await sl<CacheHelper>().saveId(userId);
        print(userId);
      }

      return response.data;
    } on DioException catch (e) {
      print(e.toString());
      print('DioException [bad response]: ${e.response}');
      print('Response Data: ${e.response?.data.toString()}');
      throw e;
    }
  }

  Future<Map<String, dynamic>> userRegister(RegisterModel userEntity) async {
    try {
      FormData formData = FormData.fromMap({
        'email': userEntity.email,
        'password': userEntity.password,
        'name': userEntity.name,
        'phone': userEntity.phone,
        'passwordConfirm': userEntity.confPass,
      });

      Response response = await dio.post(
        'users',
        data: formData,
      );
      print('Response Status Code: ${response.statusCode}');
      print('Response Data: ${response.data.toString()}');
      print(response.data.toString());
      return response.data;
    } on DioException catch (e) {
      print(e.toString());
      print('DioException [bad response]: ${e.response}');
      print('Response Data: ${e.response?.data.toString()}');
      throw e;
    }
  }
}
