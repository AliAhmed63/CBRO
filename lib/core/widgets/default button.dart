import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../recourses/color manager/color manager.dart';
import '../recourses/fount manager/font manager.dart';
import '../recourses/styles manger/styles manager.dart';
import '../recourses/value manger/value manager.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    this.radius,
    required this.text,
    required this.onPressed,
    this.height,
    this.fontSize,
    this.width,
  });
  final String? text;
  final double? radius;
  final double? width;
  final double? height;
  final Function()? onPressed;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(
            radius ?? AppSize.s12,
          ),
        ),
        color: context.theme.primaryColor,
      ),
      width: width,
      height: height,
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          text ?? "",
          maxLines: 1,
          style: getSemiBoldStyle(
            color: ColorManager.white,
            fontSize: fontSize ?? FontSizeManager.s14,
          ),
        ),
      ),
    );
  }
}
