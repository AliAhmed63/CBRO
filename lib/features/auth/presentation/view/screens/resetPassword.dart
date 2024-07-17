// import '../../../../../core/recourses/images%20manager/images%20manager.dart';
// import '../../manger/resetPasswordController.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../../../core/recourses/fount manager/font manager.dart';
// import '../../../../../core/recourses/value manger/value manager.dart';
// import '../../../../../core/widgets/default Text Form Field.dart';
// import '../../../../../core/widgets/default button.dart';
// import 'widgets/Text manager.dart';

// class ResetPasswordView extends StatelessWidget {
//   const ResetPasswordView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetX<ResetPasswordController>(
//       init: ResetPasswordController(),
//       builder: (controller) {
//         return Scaffold(
//           body: SafeArea(
//             child: Padding(
//               padding: const EdgeInsets.all(PaddingSize.p20),
//               child: SingleChildScrollView(
//                 physics: const BouncingScrollPhysics(),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const SizedBox(
//                       height: AppSize.s20,
//                     ),
//                     Align(
//                       alignment: Alignment.center,
//                       child: CommonText(
//                           text: "Reset password".tr,
//                           fontSize: FontSizeManager.s26),
//                     ),
//                     const SizedBox(
//                       height: AppSize.s20,
//                     ),
//                     SizedBox(
//                       height: 260,
//                       width: double.infinity,
//                       child: Image.asset(ImagesManager.forgetPasswordImage),
//                     ),
//                     const SizedBox(
//                       height: AppSize.s20,
//                     ),
//                     CommonText(
//                       text: "New password".tr,
//                     ),
//                     const SizedBox(
//                       height: AppSize.s12,
//                     ),
//                     DefaultTextFormField(
//                       controller: controller.newPasswordController.value,
//                       type: TextInputType.emailAddress,
//                       hintText: "New password".tr,
//                       prefixIcon: Icons.password,
//                     ),
//                     const SizedBox(
//                       height: AppSize.s24,
//                     ),
//                     CommonText(
//                       text: "Confirm new password".tr,
//                     ),
//                     const SizedBox(
//                       height: AppSize.s12,
//                     ),
//                     DefaultTextFormField(
//                       controller: controller.passwordController.value,
//                       type: TextInputType.emailAddress,
//                       hintText: "Confirm new password".tr,
//                       prefixIcon: Icons.password_sharp,
//                     ),
//                     const SizedBox(
//                       height: 60,
//                     ),
//                     DefaultButton(
//                       text: "Reset password".tr,
//                       fontSize: FontSizeManager.s20,
//                       onPressed: () => controller.newPasswordOnChange(),
//                       width: double.infinity,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
