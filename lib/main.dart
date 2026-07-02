import 'package:demo/core/utils/app_colors.dart';
import 'package:demo/core/utils/page_navigator.dart';
import 'package:demo/presentation/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigationService.navigatorKey,
      navigatorObservers: [routeObserver],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: AppColors.white),
      themeMode: ThemeMode.light,
      builder: (context, child) {
        return SafeArea(top: false, bottom: true, child: child!);
      },
      home: const SplashScreen(),
    );
  }
}
