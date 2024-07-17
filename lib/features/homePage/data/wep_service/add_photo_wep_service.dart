import '../../../../core/const.dart';
import '../model/add_photo_model.dart';
import '../../../../injection_container.dart';
import '../../../../shred.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class AddPhotoWepService {
  late Dio dio;

  AddPhotoWepService() {
    BaseOptions option = BaseOptions(
      baseUrl: Apis.BaseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 160),
      receiveTimeout: Duration(seconds: 160),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
    dio = Dio(option)
      ..interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          compact: false,
        ),
      );
    ;
    dio.options.followRedirects = true;
  }

  Future<Map<String, dynamic>> addPhoto(AddPhotoModel userEntity) async {
    final String? userId = await sl.get<CacheHelper>().getId();
    print(userEntity.image.path);
    try {
      MultipartFile multipartFile =
          await MultipartFile.fromFile(userEntity.image.path);
      FormData formData = FormData.fromMap({'image': multipartFile});
      Response response =
          await dio.post('myclothes/addclothes/$userId', data: formData);

      return response.data;
      print(response);
    } on DioException catch (e) {
      print(e.toString());
      print('DioException [bad response]: ${e.response}');
      print('Response Data: ${e.response?.data.toString()}');
      throw e;
    }
  }
}
