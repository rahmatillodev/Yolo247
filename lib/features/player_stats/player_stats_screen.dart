import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return Scaffold(
      backgroundColor: AppColors.darkBackground,

      appBar: AppAppBar(title: "Player Stats"),
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
                  _buildHeader(),
                  SizedBox(height: AppConstants.largeSpacing),
                  Expanded(
                    child: _buildPlayerList(state.players, state.playerStats),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: AppConstants.defaultPadding,
      decoration: BoxDecoration(
        color: AppColors.darkSurface,
        borderRadius: AppConstants.largeBorderRadius,
        boxShadow: [
          BoxShadow(
            color: AppColors.darkShadow,
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
            "Player Stats",
            style: AppFonts.headline5.copyWith(
              color: AppColors.darkTextPrimary,
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

  Widget _buildPlayerList(List<Player> players, List<PlayerStats> playerStats) {
    if (players.isEmpty || playerStats.isEmpty) {
      return _buildEmptyState();
    }

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.darkSurface,
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
                color: AppColors.darkTextPrimary,
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
                return _buildPlayerStatsCard(player, stats);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Container(
      width: double.infinity,
      padding: AppConstants.defaultPadding,
      decoration: BoxDecoration(
        color: AppColors.darkSurface,
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

  Widget _buildPlayerStatsCard(Player player, PlayerStats stats) {
    return Container(
      margin: EdgeInsets.only(bottom: AppConstants.mediumSpacing),
      padding: AppConstants.defaultPadding,
      decoration: BoxDecoration(
        color: AppColors.darkBackground,
        borderRadius: AppConstants.smallBorderRadius,
        border: Border.all(color: AppColors.darkBorder, width: 1),
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
                        color: AppColors.darkTextPrimary,
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
                Expanded(child: _buildStatItem('Runs', '${stats.totalRuns}')),
                Expanded(
                  child: _buildStatItem(
                    'Avg',
                    stats.averageRuns.toStringAsFixed(1),
                  ),
                ),
                Expanded(
                  child: _buildStatItem(
                    'SR',
                    stats.strikeRate.toStringAsFixed(1),
                  ),
                ),
                Expanded(child: _buildStatItem('Best', '${stats.bestRuns}')),
              ],
            ),
            SizedBox(height: AppConstants.smallSpacing),
            Row(
              children: [
                Expanded(child: _buildStatItem('4s', '${stats.totalFours}')),
                Expanded(child: _buildStatItem('6s', '${stats.totalSixes}')),
                Expanded(child: _buildStatItem('Balls', '${stats.totalBalls}')),
                Expanded(child: _buildStatItem('', '')),
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
                  child: _buildStatItem('Wickets', '${stats.totalWickets}'),
                ),
                Expanded(child: _buildStatItem('Overs', '${stats.totalOvers}')),
                Expanded(
                  child: _buildStatItem(
                    'Econ',
                    stats.economyRate.toStringAsFixed(1),
                  ),
                ),
                Expanded(child: _buildStatItem('Best', '${stats.bestWickets}')),
              ],
            ),
            SizedBox(height: AppConstants.smallSpacing),
            Row(
              children: [
                Expanded(
                  child: _buildStatItem('Runs', '${stats.totalRunsConceded}'),
                ),
                Expanded(child: _buildStatItem('', '')),
                Expanded(child: _buildStatItem('', '')),
                Expanded(child: _buildStatItem('', '')),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: AppFonts.bodyText1.copyWith(
            color: AppColors.darkTextPrimary,
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
