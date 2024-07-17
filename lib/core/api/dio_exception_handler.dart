import 'package:dio/dio.dart';

String dioExceptionHandler(DioException error) {
  if (error.type == DioExceptionType.connectionTimeout) {
    return 'Connection Timeout';
  } else if (error.type == DioExceptionType.receiveTimeout) {
    return 'Receive Timeout';
  } else if (error.type == DioExceptionType.sendTimeout) {
    return 'Send Timeout';
  } else if (error.type == DioExceptionType.cancel) {
    return 'Request Cancelled';
  } else if (error.type == DioExceptionType.badCertificate) {
    return 'Bad Certificate';
  } else if (error.type == DioExceptionType.badResponse) {
    return error.response?.data['message'] ?? 'Bad Response';
  } else if (error.type == DioExceptionType.unknown) {
    return 'Unknown Error';
  } else if (error.type == DioExceptionType.connectionError) {
    return 'Connection Error';
  } else {
    return 'Something went wrong';
  }
}
