

import '../../../../core/const.dart';

import 'package:dio/dio.dart';

class ColorWebServices {
  late Dio dio;

  ColorWebServices() {
    BaseOptions option = BaseOptions(
      baseUrl: Apis.BaseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 20),
      receiveTimeout: Duration(seconds: 20),
    );
    dio = Dio(option);
    dio.options.followRedirects = true;
  }

  Future<List<dynamic>> getAllPalette() async {
    try {
      Response response = await dio.get(
        'categories/65ecba3bce8a5a3dbefa7f12/subcategories?page=1&limit=50',
      );
      //as List
      print(response.data['data'].toString());

      return response.data['data'];
    } on DioException catch (e) {
      print(e.toString());
      print('DioException [bad response]: ${e.response}');
      print('Response Data: ${e.response?.data.toString()}');
      throw e;
    }
  }
}
