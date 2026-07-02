import 'package:demo/core/extensions/number_extn.dart';
import 'package:demo/core/utils/app_colors.dart';
import 'package:demo/presentation/home/home_cubit.dart';
import 'package:demo/presentation/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final cubit = context.read<HomeCubit>();

        return SizedBox(
          height: 57,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              CategoryButton("All", state.selectedCategoryIndex == 0, () {
                cubit.selectCategory(0);
              }),
              CategoryButton("Combos", state.selectedCategoryIndex == 1, () {
                cubit.selectCategory(1);
              }),
              CategoryButton("Sliders", state.selectedCategoryIndex == 2, () {
                cubit.selectCategory(2);
              }),
              CategoryButton("Classic", state.selectedCategoryIndex == 3, () {
                cubit.selectCategory(3);
              }),
            ],
          ),
        );
      },
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onTap;

  const CategoryButton(this.title, this.selected, this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: 12.rPad + 12.bPad + 6.lPad + 2.tPad,
        padding: 25.hPad,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected ? AppColors.appYellow : Colors.grey.shade100,
          borderRadius: 16.bRad,
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: AppColors.black.withAlpha(50),
                    blurRadius: 6,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: AppText(
          title,
          weight: FontWeight.w500,
          color: selected ? AppColors.black : AppColors.appGrey,
        ),
      ),
    );
  }
}
