import 'package:demo/core/extensions/number_extn.dart';
import 'package:demo/presentation/home/home_cubit.dart';
import 'package:demo/presentation/home/widgets/bottom_bar.dart';
import 'package:demo/presentation/home/widgets/home_app_bar.dart';
import 'package:demo/presentation/home/widgets/home_categories.dart';
import 'package:demo/presentation/home/widgets/home_floating_button.dart';
import 'package:demo/presentation/home/widgets/home_products.dart';
import 'package:demo/presentation/home/widgets/home_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => HomeCubit(),
      child: Scaffold(
        floatingActionButton: HomeFloatingButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomBar(),
        body: SafeArea(
          child: Padding(
            padding: 20.hPad,
            child: Column(
              children: [
                HomeAppBar(),
                25.hBox,
                HomeSearch(),
                25.hBox,
                HomeCategories(),
                15.hBox,
                HomeProducts(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
