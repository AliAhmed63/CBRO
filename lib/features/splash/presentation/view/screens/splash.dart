import 'dart:async';

import '../../../../../core/const.dart';
import '../../../../../core/recourses/images%20manager/images%20manager.dart';
import '../../../../../injection_container.dart';
import '../../../../../shred.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/recourses/styles manger/styles manager.dart';
import '../../../../../core/recourses/value manger/value manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  _startDaliy() {
    _timer = Timer(const Duration(seconds: 4), _goNext);
  }

  void _getLogin() async {
    AppConst.isThereUser = await sl.get<CacheHelper>().getLogin() ?? false;
  }

  Future<dynamic> buildPushReplacement(BuildContext context, Widget page) {
    return Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => page));
  }

  Future<dynamic> buildAndRemove(BuildContext context, Widget page) {
    return Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => page), (route) => false);
  }

  _goNext() {
    AppConst.isThereUser!
        ? Navigator.of(context).pushNamed(onbording)
        // buildPushReplacement(context, HomeServices())
        : Navigator.of(context).pushNamed(onbording);
    // buildAndRemove(context, LoginView());
  }

  @override
  void initState() {
    super.initState();

    _startDaliy();
    _getLogin();

    //  super.initState();
  }
// test(){
//   if(1){
//     if(2){

//     }else
//   }
// }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                ImagesManager.logo,
                width: 180,
                height: 180,
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                "WELCOME".tr,
                style: getBoldStyle(
                    fontSize: AppSize.s30, color: context.theme.primaryColor),
              ),
              const SizedBox(
                height: 150,
              ),
            ],
          ),
        ),
      ),
    ));
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
