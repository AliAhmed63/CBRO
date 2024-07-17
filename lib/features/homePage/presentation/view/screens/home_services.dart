import '../../../../../core/recourses/theme manger/theme manager.dart';
import '../../../../category/presentation/view/screens/my%20clothes.dart';
import '../../../../profile/presentation/view/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import '../../../../../core/recourses/color manager/color manager.dart';
import '../../../../../core/recourses/styles manger/styles manager.dart';
import '../../../../../core/recourses/value manger/value manager.dart';
import '../screens/home_page.dart';

class HomeServices extends StatefulWidget {
  const HomeServices({Key? key});

  @override
  State<HomeServices> createState() => _HomeServicesState();
}

class _HomeServicesState extends State<HomeServices> {
  int selectedPage = 0;

  List<Widget> widgetPage = [
    const HomePageView(),
    MyClothesView(),
    const ProfileView(),
  ];

  List<IconData> pageIcons = [
    Icons.home_outlined,
    LineIcons.tShirt,
    Icons.person_outlined,
  ];
  List<String> appBarTitles = [
    "Home".tr,
    "My Clothes".tr,
    "Profile".tr,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetPage.elementAt(selectedPage),
      appBar: AppBar(
        title: Text(
          appBarTitles[selectedPage], // Dynamically set app bar title
          style: getSemiBoldStyle(
            color: context.theme.canvasColor,
            fontSize: AppSize.s26,
          ),
        ),
        leading: Icon(
          pageIcons[selectedPage],
          color: ColorManager.primary,
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 10.0),
            child: Image.asset(
              'images/logo.png',
              width: 30,
              height: 40, // Path to your logo image asset
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 71,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
          child: Row(
            children: [
              Expanded(
                child: buildNavItem(
                  Icons.home_outlined,
                  0,
                  "Home".tr,
                ),
              ),
              Expanded(
                child: buildNavItem(
                  LineIcons.tShirt,
                  1,
                  "My Clothes".tr,
                ),
              ),
              Expanded(
                child: buildNavItem(
                  Icons.person_outlined,
                  2,
                  "Profile".tr,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNavItem(IconData icon, int index, String text) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPage = index;
        });
      },
      child: Container(
        height: 71,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: selectedPage == index
                    ?  context.theme.primaryColor
                    :  context.theme.canvasColor,
              ),
              SizedBox(height: 5.0),
              Text(
                text,
                style: getLightStyle(
                  color: selectedPage == index
                      ?  context.theme.primaryColor
                      :  context.theme.canvasColor,
                  fontSize: AppSize.s16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
