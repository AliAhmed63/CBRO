import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../core/recourses/fount manager/font manager.dart';
import '../../../../../../core/recourses/styles manger/styles manager.dart';

class CommonText extends StatelessWidget {
  const CommonText({super.key, required this.text, this.fontSize});
  final String text;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: getBoldStyle(
          color: context.theme.canvasColor,
          fontSize: fontSize ?? FontSizeManager.s20),
    );
  }
}
