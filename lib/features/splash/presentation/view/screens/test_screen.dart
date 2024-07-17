import 'package:get/get.dart';

import '../../../../../core/const.dart';
import '../../../../../core/recourses/color%20manager/color%20manager.dart';
import '../../../../../core/recourses/styles%20manger/styles%20manager.dart';
import '../../../../../core/widgets/default%20button.dart';
import '../../../../../core/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColorBlindTestScreen extends StatelessWidget {
  const ColorBlindTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/test1.png', // Replace with your actual image URL
              height: 300,
            ),
            verticalSpace(30),
            Text(
              'Your vision matters, take the colorblind test to enhance your perception of the world'.tr,
              textAlign: TextAlign.center,
              style: getBoldStyle(
                fontSize: 18,
                color: context.theme.canvasColor,
              ),
            ),
            verticalSpace(30),
            DefaultButton(
              fontSize: 18.sp,
              text: 'Start Test Now'.tr,
              onPressed: () {
                Navigator.pushReplacementNamed(context, testResultScreen);
              },
              width: double.infinity,
            ),
            verticalSpace(30),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, homeServices);
                },
                child: Text('Skip'.tr,style:  getSemiBoldStyle(color:context.theme.canvasColor ),),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
