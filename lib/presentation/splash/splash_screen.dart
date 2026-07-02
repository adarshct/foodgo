import 'package:demo/core/constants/assets_helper.dart';
import 'package:demo/core/constants/font_strings.dart';
import 'package:demo/core/extensions/number_extn.dart';
import 'package:demo/core/utils/app_colors.dart';
import 'package:demo/core/utils/device.dart';
import 'package:demo/presentation/splash/splash_cubit.dart';
import 'package:demo/presentation/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => SplashCubit(),
      child: Scaffold(
        body: SizedBox(
          width: Device.width,
          height: Device.height,
          child: Stack(
            children: [
              Image.asset(AssetsHelper.splash, fit: BoxFit.cover),
              Positioned(
                bottom: Device.width * 0.1,
                right: Device.width * 0.1,
                left: Device.width * 0.1,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Image.asset(
                        AssetsHelper.foodgo,
                        width: Device.width * 0.55,
                        color: AppColors.white,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    30.hBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AppText(
                          "Start Now",
                          color: AppColors.white,
                          size: 18,
                          family: inter600,
                        ),
                        10.wBox,
                        const Icon(Icons.arrow_forward, color: AppColors.white),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
