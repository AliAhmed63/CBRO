import '../recourses/fount%20manager/font%20manager.dart';
import '../recourses/styles%20manger/styles%20manager.dart';
import '../recourses/value%20manger/value%20manager.dart';
import 'spacing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImgeAndText extends StatelessWidget {
  const ImgeAndText({
    super.key,
    required this.image,
    required this.title,
    required this.supTitle,
  });
  final String image, title, supTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Column(
        children: [
          Image.asset(
            image,
            fit: BoxFit.fill,
            height: 300,
          ),
          verticalSpace(18),
          Text(
            title,
            style: getBoldStyle(
                fontSize: AppSize.s26, color: context.theme.primaryColor),
            textAlign: TextAlign.center,
          ),
          verticalSpace(10),
          Text(
            supTitle,
            style: getMediumStyle(
                fontSize: FontSizeManager.s18,
                color: context.theme.canvasColor),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
