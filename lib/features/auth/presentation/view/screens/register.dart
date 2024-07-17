import '../../../../../core/const.dart';
import '../../../data/model/register_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../../../../core/recourses/color manager/color manager.dart';
import '../../../../../core/recourses/fount manager/font manager.dart';
import '../../../../../core/recourses/styles manger/styles manager.dart';
import '../../../../../core/recourses/value manger/value manager.dart';
import '../../../../../core/widgets/default Text Form Field.dart';
import '../../../../../core/widgets/default button.dart';
import '../../../../../injection_container.dart' as di;
import '../../bloc/bloc/auth_cubit.dart';
import '../widgets/Text manager.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

final TextEditingController _nameController = TextEditingController();
final TextEditingController _passwordConfController = TextEditingController();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
final TextEditingController _phoneController = TextEditingController();

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<AuthCubit>(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            return setState(() {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Loading')),
              );
            });
          } else if (state is AuthSuccess) {
            Navigator.pushReplacementNamed(context, testScreen);
          } else if (state is AuthError) {
            return setState(() {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.er.toString())),
              );
            });
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: AppSize.s26,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: CommonText(
                            text: 'sign up now'.tr,
                            fontSize: FontSizeManager.s30),
                      ),
                      const SizedBox(
                        height: AppSize.s30,
                      ),
                      Text(
                        "start exploring a world of online home services".tr,
                        style: getLightStyle(
                            color: ColorManager.gray, fontSize: AppSize.s16),
                      ),
                      const SizedBox(
                        height: AppSize.s30,
                      ),
                      CommonText(
                        text: "Full name".tr,
                      ),
                      const SizedBox(
                        height: AppSize.s4,
                      ),
                      DefaultTextFormField(
                        controller: _nameController,
                        type: TextInputType.text,
                        hintText: "Full name".tr,
                        prefixIcon: Icons.person,
                      ),
                      const SizedBox(
                        height: AppSize.s18,
                      ),
                      CommonText(
                        text: "Phone Number".tr,
                      ),
                      const SizedBox(
                        height: AppSize.s4,
                      ),
                      DefaultTextFormField(
                        controller: _phoneController,
                        type: TextInputType.phone,
                        hintText: "Phone Number".tr,
                        prefixIcon: Icons.phone,
                      ),
                      const SizedBox(
                        height: AppSize.s18,
                      ),
                      CommonText(
                        text: "Email".tr,
                      ),
                      const SizedBox(
                        height: AppSize.s4,
                      ),
                      DefaultTextFormField(
                        controller: _emailController,
                        type: TextInputType.emailAddress,
                        hintText: "Email".tr,
                        prefixIcon: Icons.email_outlined,
                      ),
                      const SizedBox(
                        height: AppSize.s18,
                      ),
                      CommonText(
                        text: "Password".tr,
                      ),
                      const SizedBox(
                        height: AppSize.s4,
                      ),
                      DefaultTextFormField(
                        controller: _passwordController,
                        type: TextInputType.emailAddress,
                        hintText: "Password".tr,
                        prefixIcon: Icons.lock_outline,
                        suffixIcon: CupertinoIcons.eye_slash,
                      ),
                      const SizedBox(
                        height: AppSize.s30,
                      ),
                      CommonText(
                        text: "Confirm Password".tr,
                      ),
                      const SizedBox(
                        height: AppSize.s4,
                      ),
                      DefaultTextFormField(
                        controller: _passwordConfController,
                        type: TextInputType.emailAddress,
                        hintText: "Confirm Password".tr,
                        prefixIcon: Icons.lock_outline,
                        suffixIcon: CupertinoIcons.eye_slash,
                      ),
                      const SizedBox(
                        height: 56,
                      ),
                      DefaultButton(
                        text: "Sign up".tr,
                        fontSize: FontSizeManager.s22,
                        onPressed: () {
                          BlocProvider.of<AuthCubit>(context)
                            ..userRegister(RegisterModel(
                                name: _nameController.text.toString(),
                                email: _emailController.text.toString(),
                                phone: _phoneController.text.toString(),
                                password: _passwordController.text.toString(),
                                confPass:
                                    _passwordConfController.text.toString()));
                        },
                        width: double.infinity,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?".tr,
                            style: getSemiBoldStyle(
                                color: ColorManager.darkBlue,
                                fontSize: AppSize.s16),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Login".tr,
                              style: TextStyle(
                                  fontSize: FontSizeManager.s18,
                                  color: ColorManager.amber),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
