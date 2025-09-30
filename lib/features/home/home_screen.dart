import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_fonts.dart';
import '../../core/constants/app_constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                // Header
                _buildHeader(context),

                SizedBox(height: AppConstants.largeSpacing),

                // Main Menu
                Expanded(child: _buildMainMenu(context)),

                SizedBox(height: AppConstants.largeSpacing),

                // Match Summary
                _buildMatchSummary(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Logo
            Row(
              children: [
                Container(
                  width: 50.w,
                  height: 50.w,
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: AppConstants.circularBorderRadius,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.shadow,
                        blurRadius: 10.r,
                        offset: Offset(0, 5.h),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.sports_cricket,
                    size: 30.w,
                    color: AppColors.primary,
                  ),
                ),
                SizedBox(width: AppConstants.mediumSpacing),
                Text(
                  AppTexts.appName,
                  style: AppFonts.headline5.copyWith(
                    color: AppColors.textWhite,
                    fontWeight: AppFonts.bold,
                  ),
                ),
              ],
            ),

            // Settings Icon
            Container(
              width: 50.w,
              height: 50.w,
              decoration: BoxDecoration(
                color: AppColors.surface.withOpacity(0.2),
                borderRadius: AppConstants.circularBorderRadius,
                border: Border.all(
                  color: AppColors.surface.withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: IconButton(
                onPressed: () {
                  // TODO: Navigate to settings
                },
                icon: Icon(
                  Icons.settings,
                  size: 24.w,
                  color: AppColors.textWhite,
                ),
              ),
            ),
          ],
        )
        .animate()
        .fadeIn(duration: AppConstants.mediumAnimation)
        .slideY(begin: -0.3, end: 0, duration: AppConstants.mediumAnimation);
  }

  Widget _buildMainMenu(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: AppConstants.mediumSpacing,
      mainAxisSpacing: AppConstants.mediumSpacing,
      childAspectRatio: 1.2,
      children: [
        _buildMenuCard(
          context: context,
          title: AppTexts.newMatch,
          icon: Icons.add_circle_outline,
          color: AppColors.primary,
          onTap: () => Navigator.pushNamed(context, '/new-match'),
          delay: const Duration(milliseconds: 100),
        ),
        _buildMenuCard(
          context: context,
          title: AppTexts.matchHistory,
          icon: Icons.history,
          color: AppColors.secondary,
          onTap: () => Navigator.pushNamed(context, '/match-history'),
          delay: const Duration(milliseconds: 200),
        ),
        _buildMenuCard(
          context: context,
          title: AppTexts.teams,
          icon: Icons.groups,
          color: AppColors.info,
          onTap: () => Navigator.pushNamed(context, '/team-management'),
          delay: const Duration(milliseconds: 300),
        ),
        _buildMenuCard(
          context: context,
          title: AppTexts.playerStats,
          icon: Icons.bar_chart,
          color: AppColors.success,
          onTap: () => Navigator.pushNamed(context, '/player-stats'),
          delay: const Duration(milliseconds: 400),
        ),
      ],
    );
  }

  Widget _buildMenuCard({
    required BuildContext context,
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
    required Duration delay,
  }) {
    return GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: AppConstants.largeBorderRadius,
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadowDark,
                  blurRadius: 15.r,
                  offset: Offset(0, 8.h),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 60.w,
                  height: 60.w,
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: AppConstants.circularBorderRadius,
                  ),
                  child: Icon(icon, size: 30.w, color: color),
                ),
                SizedBox(height: AppConstants.mediumSpacing),
                Text(
                  title,
                  style: AppFonts.subtitle1.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: AppFonts.semiBold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        )
        .animate()
        .fadeIn(duration: AppConstants.mediumAnimation, delay: delay)
        .slideY(
          begin: 0.3,
          end: 0,
          duration: AppConstants.mediumAnimation,
          delay: delay,
        )
        .then()
        .shimmer(
          duration: AppConstants.longAnimation,
          color: color.withOpacity(0.3),
        );
  }

  Widget _buildMatchSummary(BuildContext context) {
    return Container(
          width: double.infinity,
          padding: AppConstants.defaultPadding,
          decoration: BoxDecoration(
            color: AppColors.surface.withOpacity(0.9),
            borderRadius: AppConstants.largeBorderRadius,
            boxShadow: [
              BoxShadow(
                color: AppColors.shadow,
                blurRadius: 10.r,
                offset: Offset(0, 5.h),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.emoji_events,
                    size: 24.w,
                    color: AppColors.secondary,
                  ),
                  SizedBox(width: AppConstants.smallSpacing),
                  Text(
                    AppTexts.matchSummary,
                    style: AppFonts.subtitle1.copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: AppFonts.semiBold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppConstants.mediumSpacing),
              Text(
                'No completed matches yet.\nStart your first match to see summaries here!',
                style: AppFonts.bodyText2.copyWith(
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
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
        );
  }
}
