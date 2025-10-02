import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yolo247/core/cubit/theme_cubit.dart';

import '../../core/bloc/app_state.dart';
import '../../core/constants/app_constants.dart';
import '../../core/cubit/app_cubit.dart';
import '../../core/models/player.dart';
import '../../core/models/player_stats.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_fonts.dart';
import '../../core/widgets/app_app_bar.dart';

class PlayerStatsScreen extends StatelessWidget {
  const PlayerStatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        final isDark = themeMode == ThemeMode.dark;
        return Scaffold(
          backgroundColor: isDark
              ? AppColors.darkBackground
              : AppColors.background,
          appBar: AppAppBar(title: AppTexts.playerStats),
          body: BlocConsumer<AppCubit, AppState>(
            listener: (context, state) {
              if (state.errorMessage != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.errorMessage!),
                    backgroundColor: AppColors.error,
                  ),
                );
                context.read<AppCubit>().clearError();
              }
            },
            builder: (context, state) {
              return SafeArea(
                child: Padding(
                  padding: AppConstants.defaultPadding,
                  child: Column(
                    children: [
                      _buildHeader(isDark),
                      SizedBox(height: AppConstants.largeSpacing),
                      Expanded(
                        child: _buildPlayerList(
                          state.players,
                          state.playerStats,
                          isDark,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildHeader(bool isDark) {
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
          Icon(Icons.bar_chart, size: 48.w, color: AppColors.primary),
          SizedBox(height: AppConstants.mediumSpacing),
          Text(
            AppTexts.playerStats,
            style: AppFonts.headline5.copyWith(
              color: isDark ? AppColors.darkTextPrimary : AppColors.textPrimary,
              fontWeight: AppFonts.bold,
            ),
          ),
          SizedBox(height: AppConstants.smallSpacing),
          Text(
            'View player performance statistics',
            style: AppFonts.bodyText2.copyWith(color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }

  Widget _buildPlayerList(
    List<Player> players,
    List<PlayerStats> playerStats,
    bool isDark,
  ) {
    if (players.isEmpty || playerStats.isEmpty) {
      return _buildEmptyState(isDark);
    }

    return Container(
      width: double.infinity,
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
          Padding(
            padding: AppConstants.defaultPadding,
            child: Text(
              'Player Statistics',
              style: AppFonts.subtitle1.copyWith(
                color: isDark
                    ? AppColors.darkTextPrimary
                    : AppColors.textPrimary,
                fontWeight: AppFonts.semiBold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              itemCount: playerStats.length,
              itemBuilder: (context, index) {
                final stats = playerStats[index];
                final player = players.firstWhere(
                  (p) => p.id == stats.playerId,
                  orElse: () => Player.create(
                    name: 'Unknown',
                    role: 'Unknown',
                    teamId: '',
                  ),
                );
                return _buildPlayerStatsCard(player, stats, isDark);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(bool isDark) {
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.person_outline,
            size: 64.w,
            color: AppColors.textSecondary,
          ),
          SizedBox(height: AppConstants.largeSpacing),
          Text(
            'No player statistics available',
            style: AppFonts.headline6.copyWith(color: AppColors.textSecondary),
          ),
          SizedBox(height: AppConstants.mediumSpacing),
          Text(
            'Player statistics will appear here once matches are played.',
            style: AppFonts.bodyText2.copyWith(color: AppColors.textSecondary),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildPlayerStatsCard(Player player, PlayerStats stats, bool isDark) {
    return Container(
      margin: EdgeInsets.only(bottom: AppConstants.mediumSpacing),
      padding: AppConstants.defaultPadding,
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkBackground : AppColors.background,
        borderRadius: AppConstants.smallBorderRadius,
        border: Border.all(
          color: isDark ? AppColors.darkBorder : AppColors.border,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Player Header
          Row(
            children: [
              CircleAvatar(
                radius: 20.r,
                backgroundColor: AppColors.primary.withOpacity(0.1),
                child: Text(
                  player.name.substring(0, 1).toUpperCase(),
                  style: AppFonts.subtitle1.copyWith(
                    color: AppColors.primary,
                    fontWeight: AppFonts.bold,
                  ),
                ),
              ),
              SizedBox(width: AppConstants.mediumSpacing),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      player.name,
                      style: AppFonts.subtitle1.copyWith(
                        color: isDark
                            ? AppColors.darkTextPrimary
                            : AppColors.textPrimary,
                        fontWeight: AppFonts.semiBold,
                      ),
                    ),
                    Text(
                      player.role,
                      style: AppFonts.bodyText2.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppConstants.smallSpacing,
                  vertical: 4.h,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: AppConstants.smallBorderRadius,
                ),
                child: Text(
                  '${stats.totalMatches} matches',
                  style: AppFonts.caption.copyWith(
                    color: AppColors.primary,
                    fontWeight: AppFonts.semiBold,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: AppConstants.mediumSpacing),

          // Batting Stats
          if (stats.totalRuns > 0) ...[
            Text(
              'Batting',
              style: AppFonts.bodyText2.copyWith(
                color: AppColors.primary,
                fontWeight: AppFonts.semiBold,
              ),
            ),
            SizedBox(height: AppConstants.smallSpacing),
            Row(
              children: [
                Expanded(
                  child: _buildStatItem('Runs', '${stats.totalRuns}', isDark),
                ),
                Expanded(
                  child: _buildStatItem(
                    'Avg',
                    stats.averageRuns.toStringAsFixed(1),
                    isDark,
                  ),
                ),
                Expanded(
                  child: _buildStatItem(
                    'SR',
                    stats.strikeRate.toStringAsFixed(1),
                    isDark,
                  ),
                ),
                Expanded(
                  child: _buildStatItem('Best', '${stats.bestRuns}', isDark),
                ),
              ],
            ),
            SizedBox(height: AppConstants.smallSpacing),
            Row(
              children: [
                Expanded(
                  child: _buildStatItem('4s', '${stats.totalFours}', isDark),
                ),
                Expanded(
                  child: _buildStatItem('6s', '${stats.totalSixes}', isDark),
                ),
                Expanded(
                  child: _buildStatItem('Balls', '${stats.totalBalls}', isDark),
                ),
                Expanded(child: _buildStatItem('', '', isDark)),
              ],
            ),
            SizedBox(height: AppConstants.mediumSpacing),
          ],

          // Bowling Stats
          if (stats.totalWickets > 0) ...[
            Text(
              'Bowling',
              style: AppFonts.bodyText2.copyWith(
                color: AppColors.secondary,
                fontWeight: AppFonts.semiBold,
              ),
            ),
            SizedBox(height: AppConstants.smallSpacing),
            Row(
              children: [
                Expanded(
                  child: _buildStatItem(
                    'Wickets',
                    '${stats.totalWickets}',
                    isDark,
                  ),
                ),
                Expanded(
                  child: _buildStatItem('Overs', '${stats.totalOvers}', isDark),
                ),
                Expanded(
                  child: _buildStatItem(
                    'Econ',
                    stats.economyRate.toStringAsFixed(1),
                    isDark,
                  ),
                ),
                Expanded(
                  child: _buildStatItem('Best', '${stats.bestWickets}', isDark),
                ),
              ],
            ),
            SizedBox(height: AppConstants.smallSpacing),
            Row(
              children: [
                Expanded(
                  child: _buildStatItem(
                    'Runs',
                    '${stats.totalRunsConceded}',
                    isDark,
                  ),
                ),
                Expanded(child: _buildStatItem('', '', isDark)),
                Expanded(child: _buildStatItem('', '', isDark)),
                Expanded(child: _buildStatItem('', '', isDark)),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value, bool isDark) {
    return Column(
      children: [
        Text(
          value,
          style: AppFonts.bodyText1.copyWith(
            color: isDark ? AppColors.darkTextPrimary : AppColors.textPrimary,
            fontWeight: AppFonts.semiBold,
          ),
        ),
        Text(
          label,
          style: AppFonts.caption.copyWith(color: AppColors.textSecondary),
        ),
      ],
    );
  }
}
