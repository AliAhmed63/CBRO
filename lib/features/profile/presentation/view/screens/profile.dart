import '../../../../../core/const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/recourses/images%20manager/images%20manager.dart';
import '../../manger/profile_controller/profile_cubit.dart';
import '../../manger/profile_controller/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../injection_container.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/recourses/color manager/color manager.dart';
import '../../../../../core/recourses/fount manager/font manager.dart';
import '../../../../../core/recourses/styles manger/styles manager.dart';
import '../../../../../core/recourses/value manger/value manager.dart';
import '../../../../../core/widgets/default button.dart';
import '../widget/profile row.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(sl())..getProfile(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                BlocBuilder<ProfileCubit, ProfileState>(
                  builder: (context, state) {
                    if (state is ProfileSuccessState) {
                      return Container(
                        height: 230.h,
                        width: 400.w,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: AppSize.s40,
                            ),
                            CircleAvatar(
                              radius: 60,
                              backgroundColor: ColorManager.white,
                              child: Container(
                                child: Image.asset(
                                  ImagesManager.logo,
                                  fit: BoxFit.fill,
                                  height: 130,
                                  width: 150,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                            ),
                            const SizedBox(
                              height: AppSize.s8,
                            ),
                            Text(
                              state.model.name,
                              style: getBoldStyle(
                                  color: context.theme.canvasColor,
                                  fontSize: FontSizeManager.s24),
                            ),
                            Text(
                              state.model.email,
                              style: getMediumStyle(
                                  color: ColorManager.gray,
                                  fontSize: FontSizeManager.s20),
                            ),
                          ],
                        ),
                      );
                    } else if (state is ProfileFailureState) {
                      return Center(child: Text(state.errorMessage));
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
                const SizedBox(
                  height: AppSize.s40,
                ),
                // ProfileRow(
                //   icon: CupertinoIcons.profile_circled,
                //   text: "Edit Profile".tr,
                //   onTap: () {
                //     Get.to(const EditProfileView());
                //   },
                // ),
                Padding(
                  padding: const EdgeInsets.only(
                      right: PaddingSize.p30, left: PaddingSize.p30),
                  child: Container(
                    width: double.infinity,
                    height: 1,
                    color: ColorManager.gray,
                  ),
                ),
                ProfileRow(
                  icon: Icons.lock_outline_rounded,
                  text: 'Security and Privacy'.tr,
                  onTap: () {
                    Navigator.pushNamed(context, privacyView);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      right: PaddingSize.p30, left: PaddingSize.p30),
                  child: Container(
                    width: double.infinity,
                    height: 1,
                    color: ColorManager.gray,
                  ),
                ),
                ProfileRow(
                  icon: Icons.help,
                  text: 'Help'.tr,
                  onTap: () {
                    Navigator.pushNamed(context, help);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      right: PaddingSize.p30, left: PaddingSize.p30),
                  child: Container(
                    width: double.infinity,
                    height: 1,
                    color: ColorManager.gray,
                  ),
                ),
                ProfileRow(
                  icon: Icons.settings_rounded,
                  text: "Settings".tr,
                  onTap: () {
                    Navigator.pushNamed(context, settingView);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      right: PaddingSize.p30, left: PaddingSize.p30),
                  child: Container(
                    width: double.infinity,
                    height: 1,
                    color: ColorManager.gray,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(PaddingSize.p20),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: DefaultButton(
                        text: 'Logout'.tr,
                        fontSize: FontSizeManager.s20,
                        width: 190,
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, login);
                        },
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
