import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/recourses/color manager/color manager.dart';
import '../../../../../core/recourses/styles manger/styles manager.dart';
import '../../../../../core/recourses/value manger/value manager.dart';
import '../../../../../core/widgets/default button.dart';

class HomePageCard extends StatelessWidget {
  HomePageCard(
      {required this.image,
      required this.buttonText,
      required this.cardText,
      required this.icon,
      required this.onPressed,
      required this.cardTitle});
  String? cardText;
  String? cardTitle;
  String? buttonText;
  String? image;
  IconData? icon;
  Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              cardTitle ?? '',
              style: getSemiBoldStyle(
                  color: context.theme.canvasColor, fontSize: AppSize.s24),
            ),
            SizedBox(
              width: 5,
            ),
            Icon(
              icon ?? Icons.check,
              color: ColorManager.primary,
            ),
          ],
        ),
        const SizedBox(
          height: AppSize.s20,
        ),
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: context.theme.shadowColor, offset: const Offset(2.5, 3),)
            ],
            border: Border.all(color: ColorManager.white),
            borderRadius: BorderRadius.circular(AppSize.s20),
            color: context.theme.cardColor,
          ),
          padding: const EdgeInsets.all(AppSize.s16),
          child: Row(
            children: [
              SizedBox(
                height: 190,
                width: 120,
                child: Image.asset(image ?? ""),
              ),
              const SizedBox(
                width: AppSize.s20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cardText ?? "",
                      maxLines: 5,
                      style: getRegularStyle(
                          color: context.theme.canvasColor,
                          fontSize: AppSize.s16),
                    ),
                    const SizedBox(
                      height: AppSize.s26,
                    ),
                    DefaultButton(
                        fontSize: 13,
                        width: double.infinity,
                        text: buttonText ?? "",
                        onPressed: onPressed),
                    const SizedBox(
                      height: AppSize.s20,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
