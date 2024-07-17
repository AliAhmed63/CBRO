import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

abstract class CustomNavigation {
  static void splashNavigation(Widget page) {
    Get.offAll(
      page,
      duration: kTransitionDuration,
      transition: Transition.fadeIn,
    );
  }

  static void authNavigation(Widget page) {
    Get.offAll(
      page,
      duration: kTransitionDuration,
      transition: Transition.cupertino,
    );
  }

  static void popNavigation() {
    Get.back();
  }
}
