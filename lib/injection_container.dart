import 'features/auth/presentation/bloc/bloc/auth_cubit.dart';
import 'features/category/data/clothes_repo.dart';
import 'features/category/data/clothes_wep_serv.dart';
import 'features/homePage/data/repo/add_photo_repo.dart';
import 'features/homePage/data/repo/out_fit_repo.dart';
import 'features/homePage/data/wep_service/add_photo_wep_service.dart';
import 'features/homePage/data/wep_service/out_fit_wep_service.dart';
import 'features/homePage/presentation/manager/add_photo_cubit/add_photo_cubit.dart';
import 'features/homePage/presentation/manager/out_fit_cubit/out_fit_cubit.dart';
import 'features/profile/data/repo/profile_repo.dart';
import 'features/profile/data/wep_service/wep_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/auth/data/repo/user_repo.dart';
import 'features/auth/data/wep_services/wep_service.dart';
import 'shred.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory<AuthCubit>(() => AuthCubit(userRepo: sl()));
  sl.registerFactory<AddPhotoCubit>(() => AddPhotoCubit(sl()));
  sl.registerFactory<OutFitCubit>(() => OutFitCubit(sl()));

  sl.registerFactory<ClothesRepo>(() => ClothesRepo(sl()));
  sl.registerFactory<AddPhotoRepo>(() => AddPhotoRepo(sl()));
  sl.registerFactory<OutFitRepo>(() => OutFitRepo(sl()));
  sl.registerFactory<ProfileRepo>(() => ProfileRepo(sl()));

  /// Register CachHelper
  sl.registerLazySingleton<CacheHelper>(() => CacheHelper(sl()));

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sl.registerFactory<SharedPreferences>(() => sharedPreferences);

  sl.registerLazySingleton<WebServices>(() => WebServices());
  sl.registerLazySingleton<ProfileWebServices>(() => ProfileWebServices());
  sl.registerLazySingleton<ClothesWebServices>(() => ClothesWebServices());
  sl.registerLazySingleton<OutFitWebServices>(() => OutFitWebServices());
  sl.registerLazySingleton<AddPhotoWepService>(() => AddPhotoWepService());

  sl.registerLazySingleton<UserRepo>(() => UserRepo(sl()));
  sl.registerLazySingleton<Dio>(() => Dio());
}

Dio createAndSetupDio() {
  Dio dio = Dio();

  dio
    ..options.connectTimeout = Duration(seconds: 30)
    ..options.receiveTimeout = Duration(seconds: 30);

  dio.interceptors.add(LogInterceptor(
    responseBody: true,
    error: true,
    requestHeader: false,
    responseHeader: false,
    request: true,
    requestBody: true,
  ));

  return dio;
}
