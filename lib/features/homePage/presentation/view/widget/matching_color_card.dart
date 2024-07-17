import 'package:get/get.dart';

import '../../../../../core/recourses/value%20manger/value%20manager.dart';
import '../../../data/model/color_palette.dart';
import 'package:flutter/material.dart';

import '../../../../../core/recourses/color manager/color manager.dart';

class MatchingColorCard extends StatelessWidget {
  final ColorInfo colorInfo;
  MatchingColorCard({Key? key, required this.colorInfo});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: context.theme.shadowColor, offset: const Offset(0, 2.5))
        ],
        border: Border.all(color: ColorManager.white),
        borderRadius: BorderRadius.circular(AppSize.s20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color(
                  int.parse(colorInfo.color1),
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(PaddingSize.p20),
                  topRight: Radius.circular(PaddingSize.p20),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Color(
                int.parse(colorInfo.color2),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Color(
                int.parse(colorInfo.color3),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color(
                  int.parse(colorInfo.color4),
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(PaddingSize.p20),
                  bottomRight: Radius.circular(PaddingSize.p20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
