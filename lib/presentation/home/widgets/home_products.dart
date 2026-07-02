import 'package:demo/core/constants/assets_helper.dart';
import 'package:demo/core/constants/font_strings.dart';
import 'package:demo/core/extensions/number_extn.dart';
import 'package:demo/core/utils/app_colors.dart';
import 'package:demo/presentation/widgets/app_text.dart';
import 'package:flutter/material.dart';

class HomeProducts extends StatelessWidget {
  const HomeProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: .8,
        crossAxisSpacing: 12,
        mainAxisSpacing: 15,
        padding: 100.bPad,
        children: const [
          FoodCard(
            image: AssetsHelper.burger1,
            title: "Cheeseburger",
            subtitle: "Wendy's Burger",
            rating: "4.9",
          ),

          FoodCard(
            image: AssetsHelper.burger2,
            title: "Hamburger",
            subtitle: "Veggie Burger",
            rating: "4.8",
          ),

          FoodCard(
            image: AssetsHelper.burger3,
            title: "Hamburger",
            subtitle: "Chicken Burger",
            rating: "4.6",
          ),

          FoodCard(
            image: AssetsHelper.burger4,
            title: "Hamburger",
            subtitle: "Fried Chicken Burger",
            rating: "4.5",
          ),
          FoodCard(
            image: AssetsHelper.burger1,
            title: "Cheeseburger",
            subtitle: "Wendy's Burger",
            rating: "4.9",
          ),

          FoodCard(
            image: AssetsHelper.burger2,
            title: "Hamburger",
            subtitle: "Veggie Burger",
            rating: "4.8",
          ),

          FoodCard(
            image: AssetsHelper.burger3,
            title: "Hamburger",
            subtitle: "Chicken Burger",
            rating: "4.6",
          ),

          FoodCard(
            image: AssetsHelper.burger4,
            title: "Hamburger",
            subtitle: "Fried Chicken Burger",
            rating: "4.5",
          ),
        ],
      ),
    );
  }
}

class FoodCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final String rating;

  const FoodCard({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: 5.aPad,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: 22.bRad,
        boxShadow: [
          BoxShadow(
            color: AppColors.appGrey.withAlpha(50),
            blurRadius: 9,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: 10.aPad,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Center(child: Image.asset(image))),
            AppText(title, size: 16, family: inter700),
            AppText(
              subtitle,
              size: 14,
              family: inter400,
              color: Colors.black87,
            ),
            4.hBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.orange, size: 18),
                    const SizedBox(width: 4),
                    AppText(rating),
                  ],
                ),
                Icon(Icons.favorite_border, color: AppColors.black),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
