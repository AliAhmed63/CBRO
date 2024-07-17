import '../../../../../core/recourses/images%20manager/images%20manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../core/recourses/color manager/color manager.dart';
import '../../../../../core/recourses/value manger/value manager.dart';

class GenerateOutFitCard extends StatelessWidget {
  const GenerateOutFitCard(
      {super.key, required this.height, required this.image});
  final double height;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: context.theme.shadowColor,
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
          image: DecorationImage(image: NetworkImage(image), fit: BoxFit.fill)),
      height: height.h,
      width: MediaQuery.of(context).size.width * .45,
    );
  }
}
