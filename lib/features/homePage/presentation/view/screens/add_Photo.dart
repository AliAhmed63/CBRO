import 'dart:io';

import '../../../../../core/const.dart';
import '../../../../../core/recourses/color%20manager/color%20manager.dart';
import '../../../../../core/recourses/fount%20manager/font%20manager.dart';
import '../../../../../core/recourses/styles%20manger/styles%20manager.dart';
import '../../../../../core/widgets/default%20button.dart';
import '../../../data/model/add_photo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../manager/add_photo_cubit/add_photo_cubit.dart';

class DisplayImagePage extends StatelessWidget {
  final File image;

  const DisplayImagePage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: ColorManager.primary,
        ),
        title: Text(
          "Recognition Photo".tr,
          style: getBoldStyle(
              color: context.theme.canvasColor, fontSize: FontSizeManager.s22),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Image.file(
                image,
                height: 620.h,
                width: double.infinity,
              ),
              const SizedBox(height: 20),
              BlocBuilder<AddPhotoCubit, AddPhotoState>(
                builder: (context, state) {
                  return DefaultButton(
                    fontSize: 18,
                    width: double.infinity,
                    onPressed: () => {
                      context.read<AddPhotoCubit>()
                        ..addPhoto(
                          AddPhotoModel(
                            image: image,
                          ),
                        ),
                      Navigator.pushReplacementNamed(context, addPhoto)
                    },
                    text: 'Recognition Photo'.tr,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
