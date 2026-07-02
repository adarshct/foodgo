import 'package:demo/core/extensions/number_extn.dart';
import 'package:demo/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class HomeFloatingButton extends StatelessWidget {
  const HomeFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 70,
      child: FloatingActionButton(
        materialTapTargetSize: MaterialTapTargetSize.padded,
        backgroundColor: AppColors.appYellow,
        elevation: 5,
        onPressed: () {},
        shape: RoundedRectangleBorder(borderRadius: 100.bRad),
        child: const Icon(Icons.add, size: 30, color: AppColors.white),
      ),
    );
  }
}
