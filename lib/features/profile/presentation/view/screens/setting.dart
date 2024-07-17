import '../../../../../core/locale/locale%20settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/recourses/color manager/color manager.dart';
import '../../../../../core/recourses/fount manager/font manager.dart';
import '../../../../../core/recourses/styles manger/styles manager.dart';
import '../../../../../core/recourses/theme manger/theme manager.dart';
import '../../../../../core/recourses/value manger/value manager.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    MyLocaleController controllerLang = Get.find();
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        backgroundColor: context.theme.splashColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: ColorManager.white,
        ),
        title: Text(
          "Settings".tr,
          style: getBoldStyle(
              color: ColorManager.white, fontSize: FontSizeManager.s22),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(PaddingSize.p20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: AppSize.s20,
            ),
            Text(
              "Option".tr,
              style: getSemiBoldStyle(
                  color: context.theme.canvasColor,
                  fontSize: FontSizeManager.s30),
            ),
            const SizedBox(
              height: AppSize.s20,
            ),
            GestureDetector(
              onTap: () {
                controllerLang.changeLange("en");
              },
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: Row(
                  children: [
                    Icon(
                      Icons.language,
                      color: context.theme.primaryColor,
                      size: AppSize.s30,
                    ),
                    const SizedBox(
                      width: AppSize.s20,
                    ),
                    Text(
                      "change to English Language",
                      style: getMediumStyle(color: context.theme.canvasColor),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                controllerLang.changeLange("ar");
              },
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: Row(
                  children: [
                    Icon(
                      Icons.language_sharp,
                      color: context.theme.primaryColor,
                      size: AppSize.s30,
                    ),
                    const SizedBox(
                      width: AppSize.s20,
                    ),
                    Text(
                      "تحويل للغه العربيه",
                      style: getMediumStyle(color: context.theme.canvasColor),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                ThemeService().switchTheme();
              },
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: Row(
                  children: [
                    Icon(
                      Icons.brightness_4_outlined,
                      color: context.theme.primaryColor,
                      size: AppSize.s30,
                    ),
                    const SizedBox(
                      width: AppSize.s20,
                    ),
                    Text(
                      "Change Theme",
                      style: getMediumStyle(color: context.theme.canvasColor),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
