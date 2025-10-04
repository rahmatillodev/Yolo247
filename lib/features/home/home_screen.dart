import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yolo247/core/assets/assets.gen.dart';
import 'package:yolo247/core/constants/app_constants.dart';
import 'package:yolo247/core/cubit/theme_cubit.dart';
import 'package:yolo247/core/theme/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        final isDark = themeMode == ThemeMode.dark;
        return Scaffold(
          backgroundColor: isDark
              ? AppColors.darkBackground
              : AppColors.background,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Header
                  _buildHeader(context, isDark),

                  // Hero Section
                  _buildHeroSection(context, isDark),

                  20.verticalSpace,

                  // Menu Grid
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: _buildMenuCard(
                                context: context,
                                title: AppTexts.newMatch,
                                iconPath: Assets.images.newMatch.path,
                                isDark: isDark,
                                onTap: () =>
                                    Navigator.pushNamed(context, '/new-match'),
                              ),
                            ),
                            SizedBox(width: 16.w),
                            Expanded(
                              child: _buildMenuCard(
                                context: context,
                                title: AppTexts.matchHistory,
                                iconPath: Assets.images.historyIcon.path,
                                isDark: isDark,
                                onTap: () => Navigator.pushNamed(
                                  context,
                                  '/match-history',
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        Row(
                          children: [
                            Expanded(
                              child: _buildMenuCard(
                                context: context,
                                title: AppTexts.teams,
                                iconPath: Assets.images.team.path,
                                isDark: isDark,
                                onTap: () => Navigator.pushNamed(
                                  context,
                                  '/team-management',
                                ),
                              ),
                            ),
                            SizedBox(width: 16.w),
                            Expanded(
                              child: _buildMenuCard(
                                context: context,
                                title: AppTexts.playerStats,
                                iconPath: Assets.images.statistics.path,
                                isDark: isDark,
                                onTap: () => Navigator.pushNamed(
                                  context,
                                  '/player-stats',
                                ),
                              ),
                            ),
                          ],
                        ),
                        16.verticalSpace,
                        _buildMatchSummaryCard(context, isDark),
                      ],
                    ),
                  ),

                  20.verticalSpace,
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context, bool isDark) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // App Title
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Cricket ',
                      style: TextStyle(
                        color: isDark
                            ? AppColors.darkTextPrimary
                            : AppColors.textPrimary,
                        fontSize: 32.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: 'Score',
                      style: TextStyle(
                        color: AppColors.secondary,
                        fontSize: 32.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'Counter',
                style: TextStyle(
                  color: AppColors.error,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),

          // Theme Toggle Icon
          Container(
            width: 50.w,
            height: 50.w,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: AppColors.primaryLight, width: 2.5),
            ),
            child: IconButton(
              onPressed: () {
                context.read<ThemeCubit>().toggleTheme();
              },
              icon: Icon(
                isDark ? Icons.light_mode : Icons.dark_mode,
                size: 28.w,
                color: AppColors.primaryLight,
              ),
              padding: EdgeInsets.zero,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context, bool isDark) {
    return Container(
      width: double.infinity,
      height: 200.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.images.bannerBackground.path),
          fit: BoxFit.cover,
        ),
        gradient: const LinearGradient(
          colors: [Color(0xFF1565C0), Color(0xFF0D47A1)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          // Content on the left
          Positioned(
            left: 24.w,
            top: 0,
            bottom: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Score ',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: 'Every ',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFFB74D),
                        ),
                      ),
                      TextSpan(
                        text: 'Run.',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Track Every Ball.',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white70,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF6272DB), Color(0xFF3B4AA2)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(73),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x40000000),
                        offset: const Offset(2, 4),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, '/new-match'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(73),
                      ),
                    ),
                    child: const Text(
                      'Start New Match',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Player image on the right
          Positioned(
            right: -30.w,
            bottom: -30.h,
            child: Opacity(
              opacity: 0.8,
              child: Image.asset(
                Assets.images.banner.path,
                width: 250.w,
                height: 250.w,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuCard({
    required BuildContext context,
    required String title,
    required String iconPath,
    required bool isDark,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 140.h,
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkSurface : AppColors.surface,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: isDark ? AppColors.darkBorder : AppColors.border,
            width: 1.5,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              iconPath,
              width: 48.w,
              height: 48.w,
            ),
            SizedBox(height: 12.h),
            Text(
              title,
              style: TextStyle(
                color: isDark
                    ? AppColors.darkTextPrimary
                    : AppColors.textPrimary,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMatchSummaryCard(BuildContext context, bool isDark) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/match-summary');
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkSurface : AppColors.surface,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: isDark ? AppColors.darkBorder : AppColors.border,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Image.asset(
              Assets.images.historyIcon.path,
              width: 40.w,
              height: 40.w,
            ),
            SizedBox(width: 16.w),
            Text(
              'Match Summary',
              style: TextStyle(
                color: isDark
                    ? AppColors.darkTextPrimary
                    : AppColors.textPrimary,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
