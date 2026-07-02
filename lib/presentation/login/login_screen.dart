import 'package:demo/core/constants/assets_helper.dart';
import 'package:demo/core/constants/font_strings.dart';
import 'package:demo/core/extensions/number_extn.dart';
import 'package:demo/core/utils/app_colors.dart';
import 'package:demo/core/utils/custom_validators.dart';
import 'package:demo/presentation/login/login_cubit.dart';
import 'package:demo/presentation/widgets/app_button.dart';
import 'package:demo/presentation/widgets/app_text.dart';
import 'package:demo/presentation/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        body: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            final cubit = context.read<LoginCubit>();

            return Form(
              key: cubit.formKey,
              child: Center(
                child: SingleChildScrollView(
                  padding: 20.hPad,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        "Welcome Back",
                        color: AppColors.appYellow,
                        weight: FontWeight.w500,
                        size: 30,
                      ),
                      28.hBox,
                      AppText("Login", size: 20, weight: FontWeight.w600),
                      45.hBox,
                      AppText("Email", size: 15, weight: FontWeight.w500),
                      5.hBox,
                      AppTextField(
                        controller: cubit.emailController,
                        hintText: "Enter your Email",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          } else if (!CustomValidators.emailValidator(
                            value: value,
                          )) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      20.hBox,
                      AppText("Password", size: 15, weight: FontWeight.w500),
                      5.hBox,
                      AppTextField(
                        controller: cubit.passwordController,
                        hintText: "Enter your Password",
                        obscureText: !state.isPasswordVisible,
                        suffixIcon: state.isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off_outlined,
                        onSuffixTap: () {
                          cubit.togglePasswordVisibility();
                        },
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      20.hBox,
                      Align(
                        alignment: Alignment.centerRight,
                        child: AppText(
                          "Forgot Password ?",
                          color: Color(0xffFF8C69),
                          family: inter500,
                        ),
                      ),
                      100.hBox,
                      AppButton(
                        text: "Login",
                        isLoading: state.isLoading,
                        onTap: () async {
                          if (cubit.formKey.currentState?.validate() ?? false) {
                            await cubit.login();
                          }
                        },
                      ),
                      20.hBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText(
                            "Don't have an account ?",
                            family: inter400,
                            color: AppColors.appGrey,
                          ),
                          5.wBox,
                          AppText(
                            "Register",
                            color: Color(0xffFF8C69),
                            family: inter400,
                          ),
                        ],
                      ),
                      30.hBox,
                      Row(
                        children: [
                          divider(),
                          10.wBox,
                          AppText("Or Login With", size: 15),
                          10.wBox,
                          divider(),
                        ],
                      ),
                      30.hBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(AssetsHelper.google, width: 30),
                          50.wBox,
                          Image.asset(AssetsHelper.apple, width: 30),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget divider() {
    return Expanded(
      child: Container(height: 1.5, color: AppColors.appGrey.withAlpha(100)),
    );
  }
}
