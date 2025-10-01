import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';
import 'app_fonts.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        brightness: Brightness.light,
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: AppColors.surface,
        background: AppColors.background,
        error: AppColors.error,
        onPrimary: AppColors.textWhite,
        onSecondary: AppColors.textWhite,
        onSurface: AppColors.textPrimary,
        onBackground: AppColors.textPrimary,
      ),
      textTheme: TextTheme(
        headlineLarge: AppFonts.headline1.copyWith(
          color: AppColors.textPrimary,
        ),
        headlineMedium: AppFonts.headline2.copyWith(
          color: AppColors.textPrimary,
        ),
        headlineSmall: AppFonts.headline3.copyWith(
          color: AppColors.textPrimary,
        ),
        titleLarge: AppFonts.headline4.copyWith(color: AppColors.textPrimary),
        titleMedium: AppFonts.headline5.copyWith(color: AppColors.textPrimary),
        titleSmall: AppFonts.headline6.copyWith(color: AppColors.textPrimary),
        bodyLarge: AppFonts.bodyText1.copyWith(color: AppColors.textPrimary),
        bodyMedium: AppFonts.bodyText2.copyWith(color: AppColors.textSecondary),
        labelLarge: AppFonts.button.copyWith(color: AppColors.textWhite),
        labelMedium: AppFonts.subtitle2.copyWith(
          color: AppColors.textSecondary,
        ),
        labelSmall: AppFonts.caption.copyWith(color: AppColors.textLight),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textWhite,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: AppFonts.headline6.copyWith(color: AppColors.textWhite),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.buttonPrimary,
          foregroundColor: AppColors.textWhite,
          elevation: 2,
          shadowColor: AppColors.shadow,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          textStyle: AppFonts.button,
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          side: BorderSide(color: AppColors.primary),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          textStyle: AppFonts.button,
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          textStyle: AppFonts.button,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.surface,
        elevation: 2,
        shadowColor: AppColors.shadow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        margin: EdgeInsets.all(8.w),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: AppColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: AppColors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: AppColors.error),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        labelStyle: AppFonts.bodyText2.copyWith(color: AppColors.textSecondary),
        hintStyle: AppFonts.bodyText2.copyWith(color: AppColors.textLight),
      ),
      dividerTheme: DividerThemeData(
        color: AppColors.border,
        thickness: 1,
        space: 1,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.surface,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textSecondary,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        brightness: Brightness.dark,
        primary: AppColors.primaryLight,
        secondary: AppColors.secondary,
        surface: AppColors.darkSurface,
        background: AppColors.darkBackground,
        error: AppColors.error,
        onPrimary: AppColors.textWhite,
        onSecondary: AppColors.textWhite,
        onSurface: AppColors.darkTextPrimary,
        onBackground: AppColors.darkTextPrimary,
      ),
      textTheme: TextTheme(
        headlineLarge: AppFonts.headline1.copyWith(
          color: AppColors.darkTextPrimary,
        ),
        headlineMedium: AppFonts.headline2.copyWith(
          color: AppColors.darkTextPrimary,
        ),
        headlineSmall: AppFonts.headline3.copyWith(
          color: AppColors.darkTextPrimary,
        ),
        titleLarge: AppFonts.headline4.copyWith(
          color: AppColors.darkTextPrimary,
        ),
        titleMedium: AppFonts.headline5.copyWith(
          color: AppColors.darkTextPrimary,
        ),
        titleSmall: AppFonts.headline6.copyWith(
          color: AppColors.darkTextPrimary,
        ),
        bodyLarge: AppFonts.bodyText1.copyWith(
          color: AppColors.darkTextPrimary,
        ),
        bodyMedium: AppFonts.bodyText2.copyWith(
          color: AppColors.darkTextSecondary,
        ),
        labelLarge: AppFonts.button.copyWith(color: AppColors.textWhite),
        labelMedium: AppFonts.subtitle2.copyWith(
          color: AppColors.darkTextSecondary,
        ),
        labelSmall: AppFonts.caption.copyWith(color: AppColors.darkTextLight),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.darkSurface,
        foregroundColor: AppColors.darkTextPrimary,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: AppFonts.headline6.copyWith(
          color: AppColors.darkTextPrimary,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryLight,
          foregroundColor: AppColors.textWhite,
          elevation: 2,
          shadowColor: AppColors.shadowDark,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          textStyle: AppFonts.button,
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primaryLight,
          side: BorderSide(color: AppColors.primaryLight),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          textStyle: AppFonts.button,
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primaryLight,
          textStyle: AppFonts.button,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.darkSurface,
        elevation: 2,
        shadowColor: AppColors.shadowDark,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        margin: EdgeInsets.all(8.w),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.darkSurfaceLight,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: AppColors.darkBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: AppColors.darkBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: AppColors.primaryLight, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: AppColors.error),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        labelStyle: AppFonts.bodyText2.copyWith(
          color: AppColors.darkTextSecondary,
        ),
        hintStyle: AppFonts.bodyText2.copyWith(color: AppColors.darkTextLight),
      ),
      dividerTheme: DividerThemeData(
        color: AppColors.darkBorder,
        thickness: 1,
        space: 1,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.darkSurface,
        selectedItemColor: AppColors.primaryLight,
        unselectedItemColor: AppColors.darkTextSecondary,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
    );
  }
}
