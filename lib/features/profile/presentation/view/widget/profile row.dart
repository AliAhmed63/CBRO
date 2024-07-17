import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/recourses/color manager/color manager.dart';
import '../../../../../core/recourses/styles manger/styles manager.dart';
import '../../../../../core/recourses/value manger/value manager.dart';

class ProfileRow extends StatelessWidget {
  const ProfileRow(
      {super.key, required this.icon, required this.text, required this.onTap});
  final IconData? icon;
  final String? text;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      child: SizedBox(
        width: double.infinity,
        height: 70,
        child: Padding(
          padding: const EdgeInsets.all(PaddingSize.p20),
          child: Row(
            children: [
              Icon(
                icon ?? CupertinoIcons.profile_circled,
                color: ColorManager.primary,
                size: AppSize.s30,
              ),
              const SizedBox(
                width: AppSize.s20,
              ),
              Text(
                text ?? "",
                style: getMediumStyle(color: context.theme.canvasColor),
              ),
              const Spacer(),
              Icon(
                CupertinoIcons.forward,
                color: context.theme.canvasColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
