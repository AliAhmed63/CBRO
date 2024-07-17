import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DefaultTextFormField extends StatelessWidget {
  const DefaultTextFormField(
      {super.key,
      this.maxLine,
      this.suffixIcon,
      this.obscureText,
      this.topRightRadius,
      this.topLeftRadius,
      this.bottomLeftRadius,
      this.bottomRightRadius,
      this.validator,
      required this.controller,
      required this.type,
      this.labelText,
      required this.prefixIcon,
      this.hintText});

  final TextInputType? type;
  final bool? obscureText;
  final String? labelText;
  final String? hintText;
  final double? topRightRadius;
  final double? topLeftRadius;
  final double? bottomRightRadius;
  final double? bottomLeftRadius;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final int? maxLine;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      maxLines: maxLine ?? 1,
      controller: controller,
      keyboardType: type,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        hintStyle: TextStyle(color: context.theme.primaryColor),
        prefixIcon: Icon(prefixIcon),
        suffixIcon: Icon(suffixIcon),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
          topRight: Radius.circular(topRightRadius ?? 10),
          topLeft: Radius.circular(topLeftRadius ?? 10),
          bottomRight: Radius.circular(bottomRightRadius ?? 10),
          bottomLeft: Radius.circular(bottomLeftRadius ?? 10),
        )),
      ),
    );
  }
}
