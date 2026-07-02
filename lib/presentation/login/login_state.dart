part of 'login_cubit.dart';

final class LoginState {
  final bool isLoading;
  final bool isPasswordVisible;

  const LoginState({this.isLoading = false, this.isPasswordVisible = false});

  LoginState copyWith({bool? isLoading, bool? isPasswordVisible}) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
    );
  }
}
