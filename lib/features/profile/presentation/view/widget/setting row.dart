import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/recourses/styles manger/styles manager.dart';
import '../../../../../core/recourses/value manger/value manager.dart';

class SettingRow extends StatelessWidget {
  const SettingRow(
      {super.key, required this.icon,
      required this.text,
      required this.onChanged,
      required this.switchKey});
  final IconData? icon;
  final String? text;
 final Function(bool)? onChanged;
 final bool switchKey;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: Row(
        children: [
          Icon(
            icon ?? CupertinoIcons.profile_circled,
            color: context.theme.primaryColor,
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
          Switch.adaptive(value: switchKey, onChanged: onChanged),
        ],
      ),
    );
  }
}
