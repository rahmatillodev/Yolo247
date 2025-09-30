import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_fonts.dart';
import '../../core/constants/app_constants.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppColors.fieldGradient),
        child: SafeArea(
          child: Padding(
            padding: AppConstants.defaultPadding,
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Welcome Icon
                      Container(
                        width: 100.w,
                        height: 100.w,
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          borderRadius: AppConstants.circularBorderRadius,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.shadowDark,
                              blurRadius: 20.r,
                              offset: Offset(0, 10.h),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.sports_cricket,
                          size: 50.w,
                          color: AppColors.primary,
                        ),
                      ).animate().scale(
                        duration: AppConstants.mediumAnimation,
                        curve: Curves.elasticOut,
                      ),

                      SizedBox(height: AppConstants.largeSpacing),

                      // Welcome Text
                      Text(
                            'Welcome to Cricket Score Counter! 🏏',
                            style: AppFonts.headline3.copyWith(
                              color: AppColors.textWhite,
                              fontWeight: AppFonts.bold,
                            ),
                            textAlign: TextAlign.center,
                          )
                          .animate()
                          .fadeIn(
                            duration: AppConstants.mediumAnimation,
                            delay: const Duration(milliseconds: 300),
                          )
                          .slideY(
                            begin: 0.3,
                            end: 0,
                            duration: AppConstants.mediumAnimation,
                            delay: const Duration(milliseconds: 300),
                          ),

                      SizedBox(height: AppConstants.mediumSpacing),

                      // Description
                      Text(
                            AppTexts.appTagline,
                            style: AppFonts.bodyText1.copyWith(
                              color: AppColors.textWhite.withOpacity(0.9),
                              height: 1.5,
                            ),
                            textAlign: TextAlign.center,
                          )
                          .animate()
                          .fadeIn(
                            duration: AppConstants.mediumAnimation,
                            delay: const Duration(milliseconds: 600),
                          )
                          .slideY(
                            begin: 0.3,
                            end: 0,
                            duration: AppConstants.mediumAnimation,
                            delay: const Duration(milliseconds: 600),
                          ),
                    ],
                  ),
                ),

                // Get Started Button
                SizedBox(
                      width: double.infinity,
                      height: 56.h,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/home');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.secondary,
                          foregroundColor: AppColors.textPrimary,
                          elevation: 4,
                          shadowColor: AppColors.shadowDark,
                          shape: RoundedRectangleBorder(
                            borderRadius: AppConstants.largeBorderRadius,
                          ),
                        ),
                        child: Text(
                          AppTexts.getStarted,
                          style: AppFonts.button.copyWith(
                            fontSize: AppFonts.fontSize18,
                            fontWeight: AppFonts.semiBold,
                          ),
                        ),
                      ),
                    )
                    .animate()
                    .fadeIn(
                      duration: AppConstants.mediumAnimation,
                      delay: const Duration(milliseconds: 900),
                    )
                    .slideY(
                      begin: 0.5,
                      end: 0,
                      duration: AppConstants.mediumAnimation,
                      delay: const Duration(milliseconds: 900),
                    ),

                SizedBox(height: AppConstants.largeSpacing),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
