import 'package:demo/core/utils/auth.dart';
import 'package:demo/core/utils/page_navigator.dart';
import 'package:demo/presentation/home/home_screen.dart';
import 'package:demo/presentation/login/login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState()) {
    init();
  }

  void safeEmit(SplashState state) {
    if (!isClosed) emit(state);
  }

  void init() async {
    await Future.delayed(const Duration(seconds: 3));
    if (Auth.accessToken.isEmpty) {
      openAsNewPage(LoginScreen());
    } else {
      openAsNewPage(HomeScreen());
    }
  }
}
