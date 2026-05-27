import 'package:flutter/material.dart';

import '../constants/colors.dart'; // Adjust this path to match your project structure

class AppButtonStyles {
  // Prevent instantiation of this utility class
  AppButtonStyles._();

  /// 1. Reusable ElevatedButton Style (Amber background, White text)
  static ButtonStyle get primaryElevated =>
      ElevatedButton.styleFrom(
        foregroundColor: CustomColors.yellowPrimary,
        // Text and icon color
        backgroundColor: CustomColors.scaffoldBd,
        // Default background color
        disabledForegroundColor: CustomColors.yellowPrimary,
        disabledBackgroundColor: CustomColors.scaffoldBd,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ).copyWith(
        // Moving clipBehavior inside copyWith fixes the compiler error!
        //clipBehavior: const WidgetStatePropertyAll(Clip.antiAlias),

        // Dynamic onHover overlay using WidgetStateProperty
        backgroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.hovered)) {
            return CustomColors.scaffoldBd;
          }
          if (states.contains(WidgetState.pressed)) {
            return CustomColors.yellowPrimary.withOpacity(0.7);
          }
          return CustomColors.yellowPrimary;
        }),
        foregroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.hovered)) {
            return CustomColors.yellowPrimary;
          }
          return CustomColors.whiteSecondary;
        }),
        // Subtle scale/elevation lift on hover
        elevation: WidgetStateProperty.resolveWith<double>((states) {
          if (states.contains(WidgetState.hovered)) return 4.0;
          return 2.0;
        }),
      );

  /// 2. Reusable TextButton Style (Clean navigation links)
  static ButtonStyle get navigationText =>
      TextButton.styleFrom(
        foregroundColor: CustomColors.whiteSecondary,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ).copyWith(
        // Moving clipBehavior inside copyWith fixes the compiler error!
        //clipBehavior: const WidgetStatePropertyAll(Clip.antiAlias),

        // Change text color to primary amber when hovered over on Desktop
        foregroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.hovered)) {
            return CustomColors.yellowPrimary;
          }
          return CustomColors.whiteSecondary;
        }),
        // Add a subtle background highlight on hover
        backgroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.hovered)) {
            return CustomColors.whiteSecondary.withOpacity(0.08);
          }
          return null;
        }),
      );

  /// 3. Reusable IconButton Style
  static ButtonStyle get primaryIcon =>
      IconButton.styleFrom(
        foregroundColor: CustomColors.customTransparent,
        disabledForegroundColor: CustomColors.customTransparent,
        backgroundColor: CustomColors.whitePrimary,
        // Default background color
        disabledBackgroundColor: CustomColors.yellowPrimary,
        padding: const EdgeInsets.all(12),
        iconSize: 24,
      ).copyWith(
        // Moving clipBehavior inside copyWith fixes the compiler error!
        //clipBehavior: const WidgetStatePropertyAll(Clip.antiAlias),
        foregroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.hovered)) {
            return CustomColors.customTransparent;
          }
          return null;
        }),

        backgroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.hovered)) {
            return CustomColors.yellowPrimary;
          }
          return null;
        }),
      );
}
