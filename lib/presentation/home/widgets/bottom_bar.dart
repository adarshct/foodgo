import 'package:demo/core/extensions/number_extn.dart';
import 'package:demo/core/utils/app_colors.dart';
import 'package:demo/presentation/home/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final cubit = context.read<HomeCubit>();

        return BottomAppBar(
          height: 70,
          shape: const CircularNotchedRectangle(),
          notchMargin: 12,
          color: AppColors.appYellow,
          child: SizedBox(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                icon(
                  state.navigationIndex == 0 ? Icons.home : Icons.home_outlined,
                  state.navigationIndex == 0,
                  () {
                    cubit.selectNavigationBar(0);
                  },
                ),
                icon(
                  state.navigationIndex == 1
                      ? Icons.person
                      : Icons.person_outline,
                  state.navigationIndex == 1,
                  () {
                    cubit.selectNavigationBar(1);
                  },
                ),
                60.wBox,
                icon(
                  state.navigationIndex == 2
                      ? Icons.shopping_cart
                      : Icons.shopping_cart_outlined,
                  state.navigationIndex == 2,
                  () {
                    cubit.selectNavigationBar(2);
                  },
                ),
                icon(
                  state.navigationIndex == 3
                      ? Icons.favorite
                      : Icons.favorite_border,
                  state.navigationIndex == 3,
                  () {
                    cubit.selectNavigationBar(3);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget icon(IconData icon, bool isActive, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          7.hBox,
          Icon(icon, color: AppColors.white, size: 28),
          2.hBox,
          Icon(
            Icons.circle,
            color: isActive ? AppColors.white : Colors.transparent,
            size: 5,
          ),
        ],
      ),
    );
  }
}
