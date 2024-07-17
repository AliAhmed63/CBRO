import 'package:get/get.dart';

import '../../../../../core/recourses/color%20manager/color%20manager.dart';
import '../../../../../core/recourses/styles%20manger/styles%20manager.dart';
import '../../../../../core/recourses/value%20manger/value%20manager.dart';
import 'package:flutter/material.dart';

import '../../manager/add_photo_cubit/add_photo_cubit.dart';

class TextRowForPhotoInfo extends StatelessWidget {
  const TextRowForPhotoInfo({
    super.key,
    required this.state,
    required this.title1,
    required this.supTitle1,
    required this.title2,
    required this.supTitle2,
  });
  final String title1;
  final String supTitle1;
  final String title2;
  final String supTitle2;
  final AddPhotoSuccess state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.s12),
      child: Row(
        children: [
          Container(
            child: RichText(
              text: TextSpan(
                text: title1,
                style: getBoldStyle(
                  fontSize: 17,
                  color: context.theme.canvasColor,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: supTitle1,
                    style: getBoldStyle(
                      color: context.theme.canvasColor,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          RichText(
            text: TextSpan(
              text: title2,
              style: getBoldStyle(
                fontSize: 17,
                color: context.theme.canvasColor,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: supTitle2,
                  style: getBoldStyle(
                    color: context.theme.canvasColor,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
