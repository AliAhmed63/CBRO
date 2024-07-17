import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/recourses/color manager/color manager.dart';
import '../../../../../core/recourses/fount manager/font manager.dart';
import '../../../../../core/recourses/styles manger/styles manager.dart';
import '../../../../../core/recourses/value manger/value manager.dart';

class PrivacyView extends StatelessWidget {
  const PrivacyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        backgroundColor: context.theme.splashColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: ColorManager.white,
        ),
        title: Text(
          "Privacy and Security",
          style: getBoldStyle(
              color: ColorManager.white, fontSize: FontSizeManager.s22),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(PaddingSize.p20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Security",
                style: getSemiBoldStyle(
                    color: context.theme.canvasColor,
                    fontSize: FontSizeManager.s24),
              ),
              const SizedBox(
                height: AppSize.s16,
              ),
              Text(
                "Welcome. Your privacy and security are of utmost importance to us. This Privacy and Security Policy explains how we collect, use, and protect your information. By using our app, you agree to the practices described in this policy.\n\n"
                "Information We Collect\n\n"
                "Personal Information: We may collect personal information such as your name, email address, phone number, and other similar details when you create an account, contact us, or use our services.\n\n"
                "Usage Data: We collect data about your interactions with our app, including but not limited to, your device information, IP address, and browsing activity.\n\n"
                "Cookies and Tracking Technologies: We use cookies and similar technologies to track your activity on our app and hold certain information.\n\n"
                "How We Use Your Information\n\n"
                "To provide, operate, and maintain our app and services.\n"
                "To improve, personalize, and expand our app.\n"
                "To understand and analyze how you use our app.\n"
                "To develop new products, services, features.",
                style: getMediumStyle(
                  color: ColorManager.gray,
                  fontSize: FontSizeManager.s20,
                ),
              ),
              const SizedBox(
                height: AppSize.s20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
