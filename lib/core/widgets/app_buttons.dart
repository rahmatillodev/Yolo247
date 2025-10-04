import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/app_constants.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_fonts.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? borderRadius;
  final double? elevation;
  final Color? shadowColor;
  final Gradient? gradient;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.borderRadius,
    this.elevation,
    this.shadowColor,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56.h,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: gradient ?? AppColors.welcomeGradient,
          borderRadius: AppConstants.circularBorderRadius,
          boxShadow: [
            BoxShadow(
              color: shadowColor ?? AppColors.shadowDark,
              blurRadius: elevation ?? 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          child: Text(
            text,
            style: AppFonts.button.copyWith(
              color: textColor ?? AppColors.textWhite,
              fontSize: fontSize ?? AppFonts.fontSize18,
              fontWeight: fontWeight ?? AppFonts.semiBold,
            ),
          ),
        ),
      ),
    );
  }
}

class AppOutlinedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? borderRadius;
  final double? elevation;
  final Gradient? gradient;
  final Color? shadowColor;
  const AppOutlinedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.borderRadius,
    this.elevation,
    this.gradient,
    this.shadowColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56.h,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color ?? AppColors.transparent,
          borderRadius: AppConstants.circularBorderRadius,
          boxShadow: [
            BoxShadow(
              color: shadowColor ?? AppColors.shadowDark,
              blurRadius: elevation ?? 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          child: Text(
            text,
            style: AppFonts.button.copyWith(
              color: textColor ?? AppColors.textWhite,
              fontSize: fontSize ?? AppFonts.fontSize18,
              fontWeight: fontWeight ?? AppFonts.semiBold,
            ),
          ),
        ),
      ),
    );
  }
}

class AppIconTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? borderRadius;
  final double? elevation;
  final Gradient? gradient;
  final IconData icon;
  const AppIconTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.borderRadius,
    this.elevation,
    this.gradient,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: AppConstants.buttonPadding,
        decoration: BoxDecoration(
          gradient: gradient ?? AppColors.welcomeGradient,
          borderRadius: AppConstants.circularBorderRadius,
        ),
        child: Row(
          spacing: 4,
          children: [
            Text(
              text,
              style: AppFonts.button.copyWith(
                color: textColor ?? AppColors.textWhite,
                fontSize: fontSize ?? AppFonts.fontSize18,
                fontWeight: fontWeight ?? AppFonts.semiBold,
              ),
            ),
            Icon(icon, color: textColor ?? AppColors.textWhite),
          ],
        ),
      ),
    );
  }
}
