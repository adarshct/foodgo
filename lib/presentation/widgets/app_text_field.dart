import 'package:demo/core/constants/font_strings.dart';
import 'package:demo/core/extensions/number_extn.dart';
import 'package:demo/core/utils/app_colors.dart';
import 'package:demo/presentation/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.prefixIconColor,
    this.maxLines,
    this.validator,
    this.obscureText,
    this.onSuffixTap,
    this.keyboardType,
    this.inputFormatters,
    this.maxLength,
    this.controller,
    this.onChanged,
    this.image,
  });

  final Color? prefixIconColor;
  final IconData? suffixIcon;
  final String hintText;
  final int? maxLines;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final void Function()? onSuffixTap;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final TextEditingController? controller;
  final void Function(String val)? onChanged;
  final ImageProvider? image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: maxLines == 1 ? 50 : null,
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        style: const TextStyle(
          fontSize: 15,
          fontFamily: inter400,
          decorationThickness: 0,
          height: 1.2,
        ),
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        maxLength: maxLength,
        decoration: InputDecoration(
          counter: const Offstage(),
          enabledBorder: outlineInputBorder(),
          focusedBorder: outlineInputBorder(),
          errorBorder: outlineInputBorder(isError: true),
          focusedErrorBorder: outlineInputBorder(isError: true),
          errorStyle: TextStyle(fontFamily: inter400),

          hint: AppText(hintText, color: AppColors.appGrey, size: 13.5),
          suffixIcon: suffixIcon != null
              ? GestureDetector(
                  onTap: onSuffixTap,
                  child: Icon(
                    suffixIcon,
                    color: AppColors.appGrey.withAlpha(180),
                    size: 22,
                  ),
                )
              : null,
        ),
        maxLines: maxLines ?? 1,
        validator: validator,
        obscureText: obscureText ?? false,
      ),
    );
  }

  OutlineInputBorder outlineInputBorder({bool isError = false}) =>
      OutlineInputBorder(
        borderRadius: 8.bRad,
        borderSide: BorderSide(
          color: isError
              ? AppColors.appRed.withAlpha(200)
              : AppColors.appGrey.withAlpha(100),
          width: 0.8,
        ),
      );
}
