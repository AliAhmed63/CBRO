import '../../../../core/const.dart';
import 'package:dio/dio.dart';

import '../../../../injection_container.dart';
import '../../../../shred.dart';

class OutFitWebServices {
  late Dio dio;

  OutFitWebServices() {
    BaseOptions option = BaseOptions(
      baseUrl: Apis.BaseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 20),
      receiveTimeout: Duration(seconds: 20),
    );
    dio = Dio(option);
    dio.options.followRedirects = true;
  }

  Future<Map<String, dynamic>> getOutFit() async {
    final String? userId = await sl.get<CacheHelper>().getId();

    try {
      Response response = await dio.get(
        'users/getoutfit/$userId/?page=100&limit=50000',
      );
      print(response);

      return response.data;
    } on DioError catch (e) {
      print(e.toString());
      print('DioException [bad response]: ${e.response}');
      print('Response Data: ${e.response?.data.toString()}');
      throw e;
    }
  }
}
