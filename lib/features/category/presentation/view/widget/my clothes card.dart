import 'package:flutter/cupertino.dart';

import '../../../data/clothes_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/recourses/color manager/color manager.dart';
import '../../../../../core/recourses/styles manger/styles manager.dart';
import '../../../../../core/recourses/value manger/value manager.dart';

class MyClothesCard extends StatelessWidget {
  final ClothesData clothesData;
  const MyClothesCard({
    super.key,
    required this.clothesData,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: PaddingSize.p20),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: ColorManager.shadowColor,
              offset: const Offset(0, 3),
            )
          ],
          border: Border.all(color: ColorManager.white),
          borderRadius: BorderRadius.circular(AppSize.s20),
          color: context.theme.cardColor,
        ),
        padding: const EdgeInsets.all(AppSize.s16),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(fit: BoxFit.fill,
                    image: NetworkImage(
                      clothesData.url,
                    ),
                  ),),
              height: 100,
              width: 90,
            ),
            const SizedBox(
              width: AppSize.s20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    clothesData.photoPath[0],
                    style: getBoldStyle(
                        color: context.theme.canvasColor,
                        fontSize: AppSize.s24),
                  ),
                  const SizedBox(height: AppSize.s12),
                  Text(
                    clothesData.photoPath[2],
                    style: getRegularStyle(
                        color: ColorManager.gray, fontSize: AppSize.s20),
                  ),
                  const SizedBox(height: AppSize.s12),
                  Text(
                    clothesData.photoPath[5],
                    style: getRegularStyle(
                        color: ColorManager.gray, fontSize: AppSize.s20),
                  ),
                  const SizedBox(height: AppSize.s12),
                  Text(
                    clothesData.photoPath[4],
                    style: getRegularStyle(
                        color: ColorManager.gray, fontSize: AppSize.s20),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
