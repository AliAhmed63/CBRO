import 'dart:io';
import 'add_Photo.dart';
import '../widget/image_picker.dart';
import '../../../../../core/const.dart';
import '../../../../../core/recourses/images%20manager/images%20manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/recourses/value manger/value manager.dart';
import '../widget/homePage_card.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(AppSize.s20),
        child: Column(
          children: [
            HomePageCard(
              image: ImagesManager.home1Image,
              buttonText: 'Matching My Clothes'.tr,
              icon: CupertinoIcons.wand_rays_inverse,
              cardTitle: 'Matching My Clothes'.tr,
              cardText:
                  "Explore endless outfit possibilities effortlessly, bringing style within everyone's reach"
                      .tr,
              onPressed: () {

                Navigator.pushNamed(context, yourOutFitToDay);
              },
            ),
            const SizedBox(
              height: AppSize.s20,
            ),
            HomePageCard(
              image: ImagesManager.home2Image,
              icon: Icons.add_a_photo_outlined,
              cardTitle: "Recognition Photo".tr,
              buttonText: "Recognition Photo".tr,
              cardText:
                  "Discover the Beauty Within Your Closet - Uncover the Colors That Define Your Style"
                      .tr,
              onPressed: () async {
                File? image = await ImageHelper.pickGallery(context);
                if (image != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DisplayImagePage(image: image),
                    ),
                  );
                }
              },
            ),
            const SizedBox(
              height: AppSize.s20,
            ),
            HomePageCard(
              image: ImagesManager.home3Image,
              icon: Icons.color_lens_outlined,
              cardTitle: 'Matchy Colors'.tr,
              buttonText: 'Match Colors'.tr,
              cardText:
                  "you can explore the world of color harmony and discover which colors complement each other perfectly"
                      .tr,
              onPressed: () {
                Navigator.pushNamed(context, colorInfo, arguments: colorInfo);
              },
            ),
          ],
        ),
      ),
    );
  }
}
