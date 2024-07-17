import '../../../features/profile/presentation/view/screens/help.dart';
import '../../../features/profile/presentation/view/screens/privacy.dart';
import '../../../features/profile/presentation/view/screens/setting.dart';
import '../../../features/auth/presentation/view/screens/login.dart';
import '../../../features/category/data/clothes_repo.dart';
import '../../../features/category/data/clothes_wep_serv.dart';
import '../../../features/category/presentation/manger/cubit/my_clothes_cubit.dart';
import '../../../features/category/presentation/view/screens/my%20clothes.dart';
import '../../../features/homePage/presentation/manager/add_photo_cubit/add_photo_cubit.dart';
import '../../../features/homePage/presentation/manager/color_cubit/color_palette_cubit.dart';
import '../../../features/homePage/presentation/view/screens/home_services.dart';
import '../../../features/homePage/presentation/view/screens/add_photo_data.dart';
import '../../../features/homePage/presentation/view/screens/out_fit_view.dart';
import '../../../features/profile/presentation/view/screens/profile.dart';
import '../../../features/splash/presentation/view/screens/onbording_screen.dart';
import '../../../features/splash/presentation/view/screens/splash.dart';
import '../../../features/splash/presentation/view/screens/test_result_screen.dart';
import '../../../features/splash/presentation/view/screens/test_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../features/homePage/data/repo/color_palette_repo.dart';
import '../../../features/homePage/data/wep_service/color_wep_service.dart';
import '../../../features/homePage/presentation/view/screens/matching_color.dart';
import '../../const.dart';

class AppRouter {
  late ColorPaletteRepo colorPaletteRepo;
  late ClothesRepo clothesRepo;
  late ColorPaletteCubit colorPaletteCubit;
  late AddPhotoCubit addPhotoCubit;
  late MyClothesCubit myClothesCubit;
  AppRouter() {
    colorPaletteRepo = ColorPaletteRepo(ColorWebServices());
    colorPaletteCubit = ColorPaletteCubit(colorPaletteRepo);

    clothesRepo = ClothesRepo(ClothesWebServices());
    myClothesCubit = MyClothesCubit(clothesRepo: clothesRepo);
  }

  // ignore: body_might_complete_normally_nullable
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case testResultScreen:
        return MaterialPageRoute(
          builder: (_) => TestResultScreen(),
        );
      case testScreen:
        return MaterialPageRoute(
          builder: (_) => ColorBlindTestScreen(),
        );
      case homeServices:
        return MaterialPageRoute(
          builder: (_) => HomeServices(),
        );
      case login:
        return MaterialPageRoute(
          builder: (_) => LoginView(),
        );
      case splash:
        return MaterialPageRoute(
          builder: (_) => SplashView(),
        );
      case onbording:
        return MaterialPageRoute(
          builder: (_) => OnBordingScreen(),
        );
      case clothes:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => myClothesCubit..getAllClothes(),
            child: MyClothesView(),
          ),
        );
      case colorInfo:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => colorPaletteCubit,
            child: MatchingColorView(),
          ),
        );
      case profileview:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => colorPaletteCubit,
            child: ProfileView(),
          ),
        );
      case addPhoto:
        return MaterialPageRoute(
          builder: (_) => AddPhotoDataView(),
        );
      case privacyView:
        return MaterialPageRoute(
          builder: (_) => PrivacyView(),
        );
      case help:
        return MaterialPageRoute(
          builder: (_) => HelpPage(),
        );
      case settingView:
        return MaterialPageRoute(
          builder: (_) => SettingView(),
        );
      case yourOutFitToDay:
        return MaterialPageRoute(
          builder: (_) => OutFitView(),
        );
    }
  }
}
