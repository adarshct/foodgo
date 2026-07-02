import 'package:demo/core/utils/local_storage.dart';
import 'package:demo/core/utils/page_navigator.dart';
import 'package:demo/data/models/login_model.dart';
import 'package:demo/data/repositories/auth_repository.dart';
import 'package:demo/presentation/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void safeEmit(LoginState state) {
    if (!isClosed) emit(state);
  }

  void togglePasswordVisibility() {
    safeEmit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  Future<void> login() async {
    safeEmit(state.copyWith(isLoading: true));

    dynamic resp = await AuthRepository.login(
      email: emailController.text,
      password: passwordController.text,
    );

    if (resp is LoginModel) {
      await LocalStorage.setData(key: "access", value: resp.access);
      openAsNewPage(const HomeScreen());
    }

    safeEmit(state.copyWith(isLoading: false));
  }
}
