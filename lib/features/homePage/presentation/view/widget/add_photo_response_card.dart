import 'dart:io';
import '../../../../../core/const.dart';
import '../../../../../core/recourses/color%20manager/color%20manager.dart';
import '../../../../../core/recourses/value%20manger/value%20manager.dart';
import '../../../../../core/widgets/default%20button.dart';
import '../../../../../core/widgets/spacing.dart';
import '../../manager/add_photo_cubit/add_photo_cubit.dart';
import '../screens/add_Photo.dart';
import 'image_picker.dart';
import 'text_row_for_photo_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PhotoResponseCard extends StatelessWidget {
  const PhotoResponseCard({required this.state, super.key});

  final AddPhotoSuccess state;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(PaddingSize.p20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: ColorManager.lightPrimary,
                      offset: const Offset(0, 3))
                ],
                border: Border.all(color: ColorManager.white),
                borderRadius: BorderRadius.circular(AppSize.s20),
                color: context.theme.cardColor,
              ),
              padding: const EdgeInsets.all(AppSize.s16),
              child: Column(
                children: [
                  SizedBox(
                    height: 260.h,
                    width: double.infinity,
                    child: Image.network(
                      state.response.url,
                    ),
                  ),
                  verticalSpace(30),
                  TextRowForPhotoInfo(
                    state: state,
                    title1: 'Type: ',
                    supTitle1: state.response.photoPath[0],
                    title2: 'Gender: ',
                    supTitle2: state.response.photoPath[1],
                  ),
                  verticalSpace(20),
                  TextRowForPhotoInfo(
                    state: state,
                    title1: 'Color: ',
                    supTitle1: state.response.photoPath[2],
                    title2: 'Season: ',
                    supTitle2: state.response.photoPath[4],
                  ),
                ],
              ),
            ),
            verticalSpace(100),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  DefaultButton(
                    onPressed: () async {
                      File? image = await ImageHelper.pickGallery(context);
                      if (image != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DisplayImagePage(image: image),
                          ),
                        );
                      }
                    },
                    text: 'Add New Item',
                    fontSize: AppSize.s18,
                  ),
                  Spacer(),
                  DefaultButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, homeServices);
                    },
                    text: 'Done',
                    fontSize: AppSize.s18,
                    width: 150.w,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
