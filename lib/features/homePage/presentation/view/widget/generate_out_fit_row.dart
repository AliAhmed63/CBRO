import '../../../../../core/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/recourses/color manager/color manager.dart';
import '../../../../../core/recourses/styles manger/styles manager.dart';
import '../../../../../core/recourses/value manger/value manager.dart';

class GenerateOutFitRow extends StatelessWidget {
  const GenerateOutFitRow({
    super.key,
    required this.image,
    required this.type,
    required this.color,
    required this.season,
    required this.gender,
  });
  final String image;
  final String type;
  final String color;
  final String gender;
  final String season;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: ColorManager.shadowColor,
            offset: const Offset(2.5, 3),
          )
        ],
        border: Border.all(
          color: ColorManager.white,
        ),
        borderRadius: BorderRadius.circular(
          AppSize.s20,
        ),
        color: context.theme.cardColor,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 80.h,
              width: 70.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(image), fit: BoxFit.fill),
                borderRadius: BorderRadius.circular(AppSize.s12),
                // borderRadius: BorderRadius.circular(25.r),
              ),
            ),
          ),
          horizontalSpace(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                type,
                style: getMediumStyle(
                  color: context.theme.canvasColor,
                ),
              ),
              verticalSpace(10),
              Text(
                '$gender - $color - $season',
                overflow: TextOverflow.fade,
                style: getMediumStyle(
                    color: context.theme.canvasColor, fontSize: AppSize.s14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
