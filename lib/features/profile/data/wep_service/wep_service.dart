import '../../../../core/const.dart';
import 'package:dio/dio.dart';

import '../../../../injection_container.dart';
import '../../../../shred.dart';

class ProfileWebServices {
  late Dio dio;

  ProfileWebServices() {
    BaseOptions option = BaseOptions(
      baseUrl: Apis.BaseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 20),
      receiveTimeout: Duration(seconds: 20),
    );
    dio = Dio(option);
    dio.options.followRedirects = true;
  }

  Future<Map<String,dynamic>> getProfile() async {
    final String? userId = await sl.get<CacheHelper>().getId();

    try {
      Response response = await dio.get(
        'users/$userId',
      );
      //as List
      print(response.data['data'].toString());

      return response.data;
    } on DioException catch (e) {
      print(e.toString());
      print('DioException [bad response]: ${e.response}');
      print('Response Data: ${e.response?.data.toString()}');
      throw e;
    }
  }

}
