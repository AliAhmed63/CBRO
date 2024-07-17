import '../../../injection_container.dart';
import '../../../shred.dart';
import '../../../../core/const.dart';
import 'package:dio/dio.dart';

class ClothesWebServices {
  late Dio dio;

  ClothesWebServices() {
    BaseOptions option = BaseOptions(
      baseUrl: Apis.BaseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 20),
      receiveTimeout: Duration(seconds: 20),
    );
    dio = Dio(option);
    dio.options.followRedirects = true;
  }

  Future<List<dynamic>> getAllClothes() async {
    final String? userId = await sl.get<CacheHelper>().getId();
    try {
      Response response =
          await dio.get('users/$userId/myclothes?page=1&limit=500');

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
