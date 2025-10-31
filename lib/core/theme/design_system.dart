import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// --- Colors ---
class AppColors {
  static const Color primaryAction = Color(0xFF7257FF);
  static const Color primaryText = Color(0xFF131214);
  static const Color secondaryText = Color(0xFF898D8F);
  static const Color surfacePrimary = Color(0xFFFFFFFF);
  static const Color surfaceSecondary = Color(0xFFF4F6F7);
  static const Color surfaceTertiary = Color(0xFFF0EDFF);
  static const Color disabledBackground = Color(0xFFDADDDE);
  static const Color success = Color(0xFF008557);
  static const Color failure = Color(0xFFDB340B);
  static const Color borderGrey = Color(0xFFE5E7EB); // From input field example
}

// --- Typography ---
class AppTextStyles {
  static TextStyle get pageTitle => GoogleFonts.roboto(
        fontWeight: FontWeight.bold,
        fontSize: 32,
        height: 1.2,
        color: AppColors.primaryText,
      );

  static TextStyle get sectionHeader => GoogleFonts.roboto(
        fontWeight: FontWeight.bold,
        fontSize: 24,
        height: 1.2,
        color: AppColors.primaryText,
      );

  static TextStyle get cardTitle => GoogleFonts.roboto(
        fontWeight: FontWeight.bold,
        fontSize: 18,
        height: 1.2,
        color: AppColors.primaryText,
      );

  static TextStyle get itemTitle => GoogleFonts.roboto(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        height: 1.2,
        color: AppColors.primaryText,
      );

  static TextStyle get bodyRegular => GoogleFonts.roboto(
        fontWeight: FontWeight.normal,
        fontSize: 16,
        height: 1.5,
        color: AppColors.primaryText,
      );

  static TextStyle get bodySmall => GoogleFonts.roboto(
        fontWeight: FontWeight.normal,
        fontSize: 14,
        height: 1.5,
        color: AppColors.secondaryText,
      );

  static TextStyle get button => GoogleFonts.roboto(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        height: 1.0,
        color: AppColors.surfacePrimary, // Default for primary button
      );

  static TextStyle get link => GoogleFonts.roboto(
        fontWeight: FontWeight.w500, // Medium
        fontSize: 16,
        height: 1.5,
        color: AppColors.primaryAction,
      );

  static TextStyle get label => GoogleFonts.roboto(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        height: 1.0,
        color: AppColors.secondaryText,
      );

  static TextStyle get tabLabelActive => GoogleFonts.roboto(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        height: 1.0,
        color: AppColors.primaryAction,
      );

  static TextStyle get tabLabelInactive => GoogleFonts.roboto(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        height: 1.0,
        color: AppColors.secondaryText,
      );
}

// --- Spacing ---
class AppSpaces {
  static const double s4 = 4.0;
  static const double s8 = 8.0;
  static const double s12 = 12.0;
  static const double s16 = 16.0;
  static const double s20 = 20.0;
  static const double s24 = 24.0;
  static const double s32 = 32.0;
  static const double screenPadding = 24.0;
}

// --- Radii ---
class AppRadii {
  static const Radius r8 = Radius.circular(8.0);
  static const BorderRadius borderR8 = BorderRadius.all(r8);
  static const Radius r16 = Radius.circular(16.0);
  static const BorderRadius borderR16 = BorderRadius.all(r16);
  static const Radius rPill = Radius.circular(60.0); // For pill-shaped buttons
  static const BorderRadius borderRPill = BorderRadius.all(rPill);
}

// --- Shadows ---
class AppShadows {
  static List<BoxShadow> get inputFocusShadow => [
        BoxShadow(
          color: AppColors.primaryAction.withValues(alpha: 0.15),
          blurRadius: 15.0,
          spreadRadius: 5.0,
          offset: const Offset(0, 0),
        ),
      ];
}

// --- Dividers ---
class AppDividers {
  static Widget get primary => Container(
        height: 1.0,
        color: AppColors.surfaceSecondary,
      );
}