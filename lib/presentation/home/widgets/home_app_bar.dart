import 'package:demo/core/constants/assets_helper.dart';
import 'package:demo/core/extensions/number_extn.dart';
import 'package:demo/core/utils/app_colors.dart';
import 'package:demo/presentation/widgets/app_text.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              10.hBox,
              Image.asset(
                AssetsHelper.foodgo,
                height: 40,
                color: AppColors.black,
              ),
              5.hBox,
              AppText(
                "Order your favourite food!",
                size: 17,
                color: AppColors.appGrey,
              ),
            ],
          ),
        ),
        CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage(AssetsHelper.profile),
        ),
      ],
    );
  }
}
