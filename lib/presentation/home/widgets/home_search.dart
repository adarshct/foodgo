import 'package:demo/core/constants/font_strings.dart';
import 'package:demo/core/extensions/number_extn.dart';
import 'package:demo/core/utils/app_colors.dart';
import 'package:demo/presentation/widgets/app_text.dart';
import 'package:flutter/material.dart';

class HomeSearch extends StatelessWidget {
  const HomeSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 55,
            padding: 20.hPad,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: 18.bRad,
              boxShadow: [
                BoxShadow(
                  blurRadius: 15,
                  color: Colors.black12,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: TextField(
                style: TextStyle(
                  fontFamily: inter500,
                  fontSize: 16,
                  height: 1.2,
                  decorationThickness: 0,
                ),
                decoration: InputDecoration(
                  hint: AppText(
                    "Search",
                    color: AppColors.appGrey,
                    size: 16,
                    height: 1.2,
                  ),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: 14.vPad,
                  prefixIcon: Padding(
                    padding: 8.rPad,
                    child: Icon(
                      Icons.search,
                      size: 24,
                      color: AppColors.appGrey,
                    ),
                  ),
                  prefixIconConstraints: const BoxConstraints(minHeight: 45),
                ),
              ),
            ),
            // child: const Row(
            //   children: [
            //     Icon(Icons.search, size: 30),
            //     SizedBox(width: 10),
            //     Text(
            //       "Search",
            //       style: TextStyle(fontSize: 18, color: Colors.grey),
            //     ),
            //   ],
            // ),
          ),
        ),

        const SizedBox(width: 15),

        Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
            color: Color(0xffFFC107),
            borderRadius: BorderRadius.circular(18),
          ),
          child: const Icon(Icons.tune),
        ),
      ],
    );
  }
}
