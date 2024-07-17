import 'package:get/get.dart';
import 'core/locale/locale settings.dart';
import 'core/locale/locale.dart';
import 'core/recourses/observer.dart';
import 'features/homePage/presentation/manager/add_photo_cubit/add_photo_cubit.dart';
import 'injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/recourses/routes%20manger/routes%20manager.dart';
import 'core/recourses/theme manger/theme manager.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await di.init();
  Bloc.observer = AppBlocObserver();
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({super.key, required this.appRouter});
  @override
  Widget build(BuildContext context) {
    Get.put(MyLocaleController());
    return BlocProvider(
      create: (context) => sl<AddPhotoCubit>(),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        child: GetMaterialApp(
          theme: Themes.lightTheme,
          darkTheme: Themes.darkTheme,
          themeMode: ThemeService().mode,
          debugShowCheckedModeBanner: false,
          translations: MyLocal(),
           onGenerateRoute: appRouter.generateRoute,
          // home: TestResultScreen(),
        ),
      ),
    );
  }
}
