import 'package:flutter/material.dart';

class AppFonts {
  // Font Family
  static const String primaryFont = 'Roboto';
  static const String secondaryFont = 'OpenSans';

  // Font Sizes
  static const double fontSize8 = 8.0;
  static const double fontSize10 = 10.0;
  static const double fontSize12 = 12.0;
  static const double fontSize14 = 14.0;
  static const double fontSize16 = 16.0;
  static const double fontSize18 = 18.0;
  static const double fontSize20 = 20.0;
  static const double fontSize22 = 22.0;
  static const double fontSize24 = 24.0;
  static const double fontSize28 = 28.0;
  static const double fontSize32 = 32.0;
  static const double fontSize36 = 36.0;
  static const double fontSize40 = 40.0;
  static const double fontSize48 = 48.0;
  static const double fontSize56 = 56.0;
  static const double fontSize64 = 64.0;

  // Font Weights
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
  static const FontWeight black = FontWeight.w900;

  // Text Styles
  static const TextStyle headline1 = TextStyle(
    fontSize: fontSize48,
    fontWeight: bold,
    fontFamily: primaryFont,
  );

  static const TextStyle headline2 = TextStyle(
    fontSize: fontSize40,
    fontWeight: bold,
    fontFamily: primaryFont,
  );

  static const TextStyle headline3 = TextStyle(
    fontSize: fontSize32,
    fontWeight: semiBold,
    fontFamily: primaryFont,
  );

  static const TextStyle headline4 = TextStyle(
    fontSize: fontSize28,
    fontWeight: semiBold,
    fontFamily: primaryFont,
  );

  static const TextStyle headline5 = TextStyle(
    fontSize: fontSize24,
    fontWeight: medium,
    fontFamily: primaryFont,
  );

  static const TextStyle headline6 = TextStyle(
    fontSize: fontSize20,
    fontWeight: medium,
    fontFamily: primaryFont,
  );

  static const TextStyle subtitle1 = TextStyle(
    fontSize: fontSize16,
    fontWeight: medium,
    fontFamily: primaryFont,
  );

  static const TextStyle subtitle2 = TextStyle(
    fontSize: fontSize14,
    fontWeight: medium,
    fontFamily: primaryFont,
  );

  static const TextStyle bodyText1 = TextStyle(
    fontSize: fontSize16,
    fontWeight: regular,
    fontFamily: primaryFont,
  );

  static const TextStyle bodyText2 = TextStyle(
    fontSize: fontSize14,
    fontWeight: regular,
    fontFamily: primaryFont,
  );

  static const TextStyle caption = TextStyle(
    fontSize: fontSize12,
    fontWeight: regular,
    fontFamily: primaryFont,
  );

  static const TextStyle overline = TextStyle(
    fontSize: fontSize10,
    fontWeight: medium,
    fontFamily: primaryFont,
  );

  static const TextStyle button = TextStyle(
    fontSize: fontSize16,
    fontWeight: medium,
    fontFamily: primaryFont,
  );

  // Cricket Specific Text Styles
  static const TextStyle scoreDisplay = TextStyle(
    fontSize: fontSize56,
    fontWeight: bold,
    fontFamily: primaryFont,
  );

  static const TextStyle playerName = TextStyle(
    fontSize: fontSize18,
    fontWeight: semiBold,
    fontFamily: primaryFont,
  );

  static const TextStyle statsLabel = TextStyle(
    fontSize: fontSize14,
    fontWeight: medium,
    fontFamily: primaryFont,
  );

  static const TextStyle statsValue = TextStyle(
    fontSize: fontSize16,
    fontWeight: bold,
    fontFamily: primaryFont,
  );

  static const TextStyle teamName = TextStyle(
    fontSize: fontSize24,
    fontWeight: bold,
    fontFamily: primaryFont,
  );

  static const TextStyle matchInfo = TextStyle(
    fontSize: fontSize14,
    fontWeight: regular,
    fontFamily: primaryFont,
  );
}
