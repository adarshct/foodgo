import 'package:demo/core/constants/font_strings.dart';
import 'package:demo/core/extensions/number_extn.dart';
import 'package:demo/core/utils/app_colors.dart';
import 'package:demo/presentation/widgets/app_text.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.text,
    required this.onTap,
    this.isLoading = false,
  });

  final String text;
  final void Function() onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: isLoading ? null : onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.appYellow,
          shape: RoundedRectangleBorder(borderRadius: 10.bRad),
          elevation: 0.1,
          splashFactory: NoSplash.splashFactory,
        ),
        child: isLoading
            ? SizedBox(
                height: 23,
                width: 23,
                child: const CircularProgressIndicator(color: AppColors.black),
              )
            : AppText(text, family: inter600, size: 16),
      ),
    );
  }
}
