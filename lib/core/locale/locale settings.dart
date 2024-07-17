import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MyLocaleController extends GetxController {
  void changeLange(String codeLange) {
    Locale locale = Locale(codeLange);
    Get.updateLocale(locale);
  }
}
