import 'package:demo/core/extensions/number_extn.dart';
import 'package:demo/core/utils/app_colors.dart';
import 'package:demo/core/utils/page_navigator.dart';
import 'package:demo/presentation/widgets/app_text.dart';
import 'package:flutter/material.dart';

abstract class CustomSnackbar {
  // Method to show a basic snackbar with customizable message and action
  static void snackbar(
    String message, {
    String? actionLabel,
    VoidCallback? onActionPressed,
    Color? backgroundColor,
    Color? textColor,
    IconData? icon,
    bool showCloseButton = false,
    EdgeInsetsGeometry? margin,
    Animation<double>? animation,
    double? width,
    BoxShadow? boxShadow,
    Color? actionBackgroundColor,
    Color? actionColor,
    int? duration,
  }) {
    final context = NavigationService.context;
    if (context == null) return;

    clearAll();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: StatefulBuilder(
          builder: (context, setState) {
            return Container(
              width: width,
              padding: 5.vPad + 16.hPad,
              decoration: BoxDecoration(
                color: backgroundColor ?? Colors.black87,
                borderRadius: 16.bRad,
                boxShadow: boxShadow != null
                    ? [boxShadow]
                    : [
                        BoxShadow(
                          color: AppColors.black.withValues(alpha: 0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
              ),
              child: Row(
                children: [
                  if (icon != null) ...[
                    Icon(icon, color: textColor ?? AppColors.white, size: 20),
                    12.wBox,
                  ],
                  Expanded(
                    child: AppText(
                      message,
                      color: textColor ?? Colors.white,
                      maxLines: 10,
                    ),
                  ),
                  if (showCloseButton)
                    IconButton(
                      icon: Icon(
                        Icons.close,
                        color: textColor ?? Colors.white,
                        size: 18,
                      ),
                      onPressed: () =>
                          ScaffoldMessenger.of(context).hideCurrentSnackBar(),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                ],
              ),
            );
          },
        ),
        backgroundColor: Colors.transparent,
        action: actionLabel != null
            ? SnackBarAction(
                label: actionLabel,
                onPressed: onActionPressed ?? () {},
                textColor: actionColor ?? Colors.blue,
                backgroundColor: actionBackgroundColor,
              )
            : null,
        behavior: SnackBarBehavior.floating,
        margin: margin ?? 16.aPad,
        elevation: 0,
        animation: animation,
        duration: Duration(seconds: duration ?? 3),
      ),
    );
  }

  // Method to show success snackbar with enhanced features
  static void showSuccess(
    String message, {
    String? actionLabel,
    VoidCallback? onActionPressed,
    Duration duration = const Duration(seconds: 4),
    bool showCloseButton = true,
  }) {
    snackbar(
      message,
      backgroundColor: AppColors.appGreen,
      textColor: Colors.white,
      icon: Icons.check_circle,
      actionLabel: actionLabel,
      onActionPressed: onActionPressed,
      showCloseButton: showCloseButton,
      boxShadow: BoxShadow(
        color: AppColors.appGreen.withValues(alpha: 0.3),
        blurRadius: 12,
        offset: const Offset(0, 6),
      ),
    );
  }

  // Method to show error snackbar with enhanced features
  static void showError(
    String message, {
    String? actionLabel,
    VoidCallback? onActionPressed,
    Duration duration = const Duration(seconds: 5),
    bool showCloseButton = true,
  }) {
    snackbar(
      message,
      backgroundColor: AppColors.appRed,
      textColor: Colors.white,
      icon: Icons.error,
      actionLabel: actionLabel,
      onActionPressed: onActionPressed,
      showCloseButton: showCloseButton,
      boxShadow: BoxShadow(
        color: AppColors.appRed.withValues(alpha: 0.3),
        blurRadius: 12,
        offset: const Offset(0, 6),
      ),
    );
  }

  // Method to show warning snackbar with enhanced features
  static void showWarning(
    String message, {
    String? actionLabel,
    VoidCallback? onActionPressed,
    int? duration,
    bool showCloseButton = true,
    Color? actionBackgroundColor,
    Color? actionColor,
  }) {
    snackbar(
      message,
      backgroundColor: AppColors.appYellow,
      textColor: Colors.white,
      icon: Icons.warning,
      actionLabel: actionLabel,
      onActionPressed: onActionPressed,
      showCloseButton: showCloseButton,
      boxShadow: BoxShadow(
        color: AppColors.appYellow.withValues(alpha: 0.3),
        blurRadius: 12,
        offset: const Offset(0, 6),
      ),
      actionBackgroundColor: actionBackgroundColor,
      actionColor: actionColor,
      duration: duration,
    );
  }

  // Method to show info snackbar with enhanced features
  static void showInfo(
    String message, {
    String? actionLabel,
    VoidCallback? onActionPressed,
    Duration duration = const Duration(seconds: 4),
    bool showCloseButton = true,
  }) {
    snackbar(
      message,
      backgroundColor: AppColors.appBlue,
      textColor: Colors.white,
      icon: Icons.info,
      actionLabel: actionLabel,
      onActionPressed: onActionPressed,
      showCloseButton: showCloseButton,
      boxShadow: BoxShadow(
        color: AppColors.appBlue.withValues(alpha: 0.3),
        blurRadius: 12,
        offset: const Offset(0, 6),
      ),
    );
  }

  // Method to dismiss current snackbar
  static void dismiss() {
    final context = NavigationService.context;
    if (context != null) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
    }
  }

  // Method to clear all snackbars
  static void clearAll() {
    final context = NavigationService.context;
    if (context != null) {
      ScaffoldMessenger.of(context).clearSnackBars();
    }
  }
}
