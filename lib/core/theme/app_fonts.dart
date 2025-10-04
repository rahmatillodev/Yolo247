import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yolo247/core/theme/app_colors.dart';

class AppFonts {
  // Font Sizes using ScreenUtil
  static double fontSize8 = 8.sp;
  static double fontSize10 = 10.sp;
  static double fontSize12 = 12.sp;
  static double fontSize14 = 14.sp;
  static double fontSize16 = 16.sp;
  static double fontSize18 = 18.sp;
  static double fontSize20 = 20.sp;
  static double fontSize22 = 22.sp;
  static double fontSize24 = 24.sp;
  static double fontSize28 = 28.sp;
  static double fontSize30 = 30.sp;
  static double fontSize32 = 32.sp;
  static double fontSize36 = 36.sp;
  static double fontSize40 = 40.sp;
  static double fontSize48 = 48.sp;
  static double fontSize56 = 56.sp;
  static double fontSize64 = 64.sp;

  // Font Weights
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
  static const FontWeight black = FontWeight.w900;

  // Material Design Typography using GoogleFonts
  static TextStyle headline1 = GoogleFonts.inter(
    fontSize: fontSize48,
    fontWeight: bold,
  );

  static TextStyle headline2 = GoogleFonts.inter(
    fontSize: fontSize40,
    fontWeight: bold,
  );

  static TextStyle headline3 = GoogleFonts.inter(
    fontSize: fontSize32,
    fontWeight: semiBold,
  );

  static TextStyle headline4 = GoogleFonts.inter(
    fontSize: fontSize28,
    fontWeight: semiBold,
  );

  static TextStyle headline5 = GoogleFonts.inter(
    fontSize: fontSize24,
    fontWeight: medium,
  );

  static TextStyle headline6 = GoogleFonts.inter(
    fontSize: fontSize20,
    fontWeight: medium,
  );

  static TextStyle subtitle1 = GoogleFonts.inter(
    fontSize: fontSize16,
    fontWeight: medium,
  );

  static TextStyle subtitle2 = GoogleFonts.inter(
    fontSize: fontSize14,
    fontWeight: medium,
  );

  static TextStyle bodyText1 = GoogleFonts.inter(
    fontSize: fontSize16,
    fontWeight: regular,
  );

  static TextStyle bodyText2 = GoogleFonts.inter(
    fontSize: fontSize14,
    fontWeight: regular,
  );

  static TextStyle caption = GoogleFonts.inter(
    fontSize: fontSize12,
    fontWeight: regular,
  );

  static TextStyle overline = GoogleFonts.inter(
    fontSize: fontSize10,
    fontWeight: medium,
  );

  static TextStyle button = GoogleFonts.inter(
    fontSize: fontSize16,
    fontWeight: medium,
  );

  // Special Fonts
  static TextStyle kaushanScript = GoogleFonts.kaushanScript();
  static TextStyle afacad = GoogleFonts.afacad();

  // Common Text Styles with Colors
  static TextStyle bold12Inter = GoogleFonts.inter(
    fontSize: fontSize12,
    fontWeight: bold,
    color: AppColors.textWhite,
  );

  static TextStyle bold14Inter = GoogleFonts.inter(
    fontSize: fontSize14,
    fontWeight: bold,
    color: AppColors.textWhite,
  );

  static TextStyle bold16Inter = GoogleFonts.inter(
    fontSize: fontSize16,
    fontWeight: bold,
    color: AppColors.textWhite,
  );

  static TextStyle bold18Inter = GoogleFonts.inter(
    fontSize: fontSize18,
    fontWeight: bold,
    color: AppColors.textWhite,
  );

  static TextStyle bold20Inter = GoogleFonts.inter(
    fontSize: fontSize20,
    fontWeight: bold,
    color: AppColors.textWhite,
  );

  static TextStyle bold22Inter = GoogleFonts.inter(
    fontSize: fontSize22,
    fontWeight: bold,
    color: AppColors.textWhite,
  );

  static TextStyle bold24Inter = GoogleFonts.inter(
    fontSize: fontSize24,
    fontWeight: bold,
    color: AppColors.textWhite,
  );

  static TextStyle bold28Inter = GoogleFonts.inter(
    fontSize: fontSize28,
    fontWeight: bold,
    color: AppColors.textWhite,
  );

  static TextStyle bold32Inter = GoogleFonts.inter(
    fontSize: fontSize32,
    fontWeight: bold,
    color: AppColors.textWhite,
  );

  static TextStyle bold36Inter = GoogleFonts.inter(
    fontSize: fontSize36,
    fontWeight: bold,
    color: AppColors.textWhite,
  );

  static TextStyle semibold30Inter = GoogleFonts.inter(
    fontSize: fontSize30,
    fontWeight: semiBold,
    color: AppColors.textWhite,
  );

  static TextStyle semibold20Inter = GoogleFonts.inter(
    fontSize: fontSize20,
    fontWeight: semiBold,
    color: AppColors.textWhite,
  );

  static TextStyle semibold16Inter = GoogleFonts.inter(
    fontSize: fontSize16,
    fontWeight: semiBold,
    color: AppColors.textWhite,
  );

  static TextStyle semibold14Inter = GoogleFonts.inter(
    fontSize: fontSize14,
    fontWeight: semiBold,
    color: AppColors.textWhite,
  );

  static TextStyle regular12Inter = GoogleFonts.inter(
    fontSize: fontSize12,
    fontWeight: regular,
    color: AppColors.textWhite,
  );

  static TextStyle light12Inter = GoogleFonts.inter(
    fontSize: fontSize12,
    fontWeight: light,
    color: AppColors.textWhite,
  );

  static TextStyle regular18Inter = GoogleFonts.inter(
    fontSize: fontSize18,
    fontWeight: regular,
    color: AppColors.textWhite,
  );

  static TextStyle regular16Inter = GoogleFonts.inter(
    fontSize: fontSize16,
    fontWeight: regular,
    color: AppColors.textWhite,
  );

  static TextStyle light18Inter = GoogleFonts.inter(
    fontSize: fontSize18,
    fontWeight: light,
    color: AppColors.textWhite,
  );

  static TextStyle light14Inter = GoogleFonts.inter(
    fontSize: fontSize14,
    fontWeight: light,
    color: AppColors.textWhite,
  );

  static TextStyle regular14Inter = GoogleFonts.inter(
    fontSize: fontSize14,
    fontWeight: regular,
    color: AppColors.textWhite,
  );

  // Dark Theme Text Styles
  static TextStyle darkTextPrimary = GoogleFonts.inter(
    fontSize: fontSize16,
    fontWeight: regular,
    color: AppColors.darkTextPrimary,
  );

  static TextStyle darkTextSecondary = GoogleFonts.inter(
    fontSize: fontSize14,
    fontWeight: regular,
    color: AppColors.darkTextSecondary,
  );

  static TextStyle darkTextLight = GoogleFonts.inter(
    fontSize: fontSize12,
    fontWeight: light,
    color: AppColors.darkTextLight,
  );
}
