import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_fonts.dart';
import '../../core/constants/app_constants.dart';
import '../../core/assets/assets.gen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToWelcome();
  }

  void _navigateToWelcome() async {
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      Navigator.pushReplacementNamed(context, '/welcome');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppColors.fieldGradient),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Container(
                    width: 120.w,
                    height: 120.w,
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
                      size: 60.w,
                      color: AppColors.primary,
                    ),
                  )
                  .animate()
                  .scale(
                    duration: AppConstants.mediumAnimation,
                    curve: Curves.elasticOut,
                  )
                  .then()
                  .shimmer(
                    duration: AppConstants.longAnimation,
                    color: AppColors.secondary.withOpacity(0.5),
                  ),

              SizedBox(height: AppConstants.largeSpacing),

              // App Name
              Text(
                    AppTexts.appName,
                    style: AppFonts.headline2.copyWith(
                      color: AppColors.textWhite,
                      fontWeight: AppFonts.bold,
                    ),
                    textAlign: TextAlign.center,
                  )
                  .animate()
                  .fadeIn(
                    duration: AppConstants.mediumAnimation,
                    delay: const Duration(milliseconds: 500),
                  )
                  .slideY(
                    begin: 0.3,
                    end: 0,
                    duration: AppConstants.mediumAnimation,
                    delay: const Duration(milliseconds: 500),
                  ),

              SizedBox(height: AppConstants.mediumSpacing),

              // Tagline
              Text(
                    AppTexts.appTagline,
                    style: AppFonts.bodyText1.copyWith(
                      color: AppColors.textWhite.withOpacity(0.9),
                    ),
                    textAlign: TextAlign.center,
                  )
                  .animate()
                  .fadeIn(
                    duration: AppConstants.mediumAnimation,
                    delay: const Duration(milliseconds: 800),
                  )
                  .slideY(
                    begin: 0.3,
                    end: 0,
                    duration: AppConstants.mediumAnimation,
                    delay: const Duration(milliseconds: 800),
                  ),

              SizedBox(height: AppConstants.extraLargeSpacing),

              // Loading Indicator
              SizedBox(
                width: 40.w,
                height: 40.w,
                child: CircularProgressIndicator(
                  strokeWidth: 3.w,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.textWhite.withOpacity(0.8),
                  ),
                ),
              ).animate().fadeIn(
                duration: AppConstants.shortAnimation,
                delay: const Duration(milliseconds: 1200),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
