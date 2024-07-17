import '../../../../../core/const.dart';
import '../../../../../core/recourses/images%20manager/images%20manager.dart';
import '../../../data/model/log_model.dart';
import '../../bloc/bloc/auth_cubit.dart';
import '../../../../../injection_container.dart';
import '../../../../../shred.dart';
import '../../../../../core/recourses/color manager/color manager.dart';
import '../../../../../core/recourses/fount manager/font manager.dart';
import '../../../../../core/recourses/styles manger/styles manager.dart';
import '../../../../../core/recourses/value manger/value manager.dart';
import '../../../../../core/widgets/default Text Form Field.dart';
import '../../../../../core/widgets/default button.dart';
import '../../../../../injection_container.dart' as di;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../widgets/Text manager.dart';
import 'register.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<AuthCubit>(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) async {
          if (state is AuthLoading) {
            return setState(() {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Loading')),
              );
            });
          } else if (state is AuthSuccess) {
            await sl.get<CacheHelper>().saveLogin(true);
            Navigator.pushReplacementNamed(context, testScreen);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: CommonText(
                            text: 'Login'.tr,
                            fontSize: FontSizeManager.s30,
                          ),
                        ),
                        SizedBox(
                          height: 270,
                          width: double.infinity,
                          child: Image.asset(ImagesManager.loginImage),
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
                          height: AppSize.s24,
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
                          height: AppSize.s40,
                        ),
                        DefaultButton(
                          text: "Login".tr,
                          fontSize: FontSizeManager.s22,
                          onPressed: () {
                            BlocProvider.of<AuthCubit>(context)
                              ..userLogin(LogModel(
                                  email: _emailController.text.toString(),
                                  password:
                                      _passwordController.text.toString()));
                          },
                          width: double.infinity,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account ?".tr,
                              style: getMediumStyle(
                                color: ColorManager.darkBlue,
                                fontSize: AppSize.s16,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterView()),
                                );
                              },
                              child: Text(
                                "Sign up".tr,
                                style: TextStyle(
                                  fontSize: FontSizeManager.s18,
                                  color: ColorManager.amber,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
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
