import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yolo247/core/cubit/theme_cubit.dart';

import '../../core/constants/app_constants.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_fonts.dart';
import '../../core/widgets/app_app_bar.dart';

class MatchSummaryScreen extends StatelessWidget {
  final String? matchId;

  const MatchSummaryScreen({super.key, this.matchId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        final isDark = themeMode == ThemeMode.dark;
        return Scaffold(
          backgroundColor: isDark
              ? AppColors.darkBackground
              : AppColors.background,
          appBar: AppAppBar(title: AppTexts.matchSummary),
          body: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: AppConstants.defaultPadding,
                child: Column(
                  children: [
                    _buildMatchResult(isDark),
                    SizedBox(height: AppConstants.largeSpacing),
                    _buildKeyStats(isDark),
                    SizedBox(height: AppConstants.largeSpacing),
                    _buildBestPlayers(isDark),
                    SizedBox(height: AppConstants.largeSpacing),
                    _buildActionButtons(context),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildMatchResult(bool isDark) {
    return Container(
      width: double.infinity,
      padding: AppConstants.defaultPadding,
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : AppColors.surface,
        borderRadius: AppConstants.largeBorderRadius,
        boxShadow: [
          BoxShadow(
            color: isDark ? AppColors.darkShadow : AppColors.shadow,
            blurRadius: 10.r,
            offset: Offset(0, 5.h),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(Icons.emoji_events, size: 48.w, color: AppColors.secondary),
          SizedBox(height: AppConstants.mediumSpacing),
          Text(
            'Team A vs Team B',
            style: AppFonts.headline5.copyWith(
              color: isDark ? AppColors.darkTextPrimary : AppColors.textPrimary,
              fontWeight: AppFonts.bold,
            ),
          ),
          SizedBox(height: AppConstants.mediumSpacing),
          Text(
            'Team A won by 25 runs',
            style: AppFonts.headline6.copyWith(
              color: AppColors.success,
              fontWeight: AppFonts.bold,
            ),
          ),
          SizedBox(height: AppConstants.mediumSpacing),
          Text(
            '175/3 - 150/8',
            style: AppFonts.headline6.copyWith(color: AppColors.primary),
          ),
        ],
      ),
    );
  }

  Widget _buildKeyStats(bool isDark) {
    return Container(
      width: double.infinity,
      padding: AppConstants.defaultPadding,
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : AppColors.surface,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Key Statistics',
            style: AppFonts.subtitle1.copyWith(
              color: isDark ? AppColors.darkTextPrimary : AppColors.textPrimary,
              fontWeight: AppFonts.semiBold,
            ),
          ),
          SizedBox(height: AppConstants.mediumSpacing),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStatItem('Total Overs', '20.0', isDark),
              _buildStatItem('Extras', '12', isDark),
              _buildStatItem('Run Rate', '8.75', isDark),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value, bool isDark) {
    return Column(
      children: [
        Text(
          value,
          style: AppFonts.statsValue.copyWith(
            color: isDark ? AppColors.darkTextPrimary : AppColors.textPrimary,
          ),
        ),
        Text(
          label,
          style: AppFonts.statsLabel.copyWith(color: AppColors.textSecondary),
        ),
      ],
    );
  }

  Widget _buildBestPlayers(bool isDark) {
    return Container(
      width: double.infinity,
      padding: AppConstants.defaultPadding,
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : AppColors.surface,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Best Players',
            style: AppFonts.subtitle1.copyWith(
              color: isDark ? AppColors.darkTextPrimary : AppColors.textPrimary,
              fontWeight: AppFonts.semiBold,
            ),
          ),
          SizedBox(height: AppConstants.mediumSpacing),
          _buildPlayerCard(
            'Best Batsman',
            'Virat Kohli',
            '78 runs | 55 balls | SR: 141.82%',
          ),
          SizedBox(height: AppConstants.mediumSpacing),
          _buildPlayerCard(
            'Best Bowler',
            'Jasprit Bumrah',
            '4 wickets | 23 runs | ER: 3.20',
          ),
        ],
      ),
    );
  }

  Widget _buildPlayerCard(String title, String name, String stats) {
    return Container(
      padding: AppConstants.smallPadding,
      decoration: BoxDecoration(
        color: AppColors.accent,
        borderRadius: AppConstants.smallBorderRadius,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppFonts.caption.copyWith(color: AppColors.textSecondary),
          ),
          Text(
            name,
            style: AppFonts.subtitle2.copyWith(
              color: AppColors.textPrimary,
              fontWeight: AppFonts.semiBold,
            ),
          ),
          Text(
            stats,
            style: AppFonts.bodyText2.copyWith(color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () => Navigator.pushNamed(context, '/match-history'),
            child: Text('View History'),
          ),
        ),
        SizedBox(width: AppConstants.mediumSpacing),
        Expanded(
          child: ElevatedButton(
            onPressed: () => Navigator.pushNamedAndRemoveUntil(
              context,
              '/home',
              (route) => false,
            ),
            child: Text('Back to Home'),
          ),
        ),
      ],
    );
  }
}
