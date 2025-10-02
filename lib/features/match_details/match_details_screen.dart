import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/bloc/app_state.dart';
import '../../core/constants/app_constants.dart';
import '../../core/cubit/app_cubit.dart';
import '../../core/cubit/theme_cubit.dart';
import '../../core/models/match.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_fonts.dart';
import '../../core/widgets/app_app_bar.dart';

class MatchDetailsScreen extends StatelessWidget {
  final String? matchId;

  const MatchDetailsScreen({super.key, this.matchId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        final isDark = themeMode == ThemeMode.dark;
        return Scaffold(
          backgroundColor: isDark
              ? AppColors.darkBackground
              : AppColors.background,
          appBar: AppAppBar(title: 'Match Details'),
          body: BlocBuilder<AppCubit, AppState>(
            builder: (context, state) {
              final match = matchId != null
                  ? context.read<AppCubit>().getMatchById(matchId!)
                  : null;

              if (match == null) {
                return _buildErrorState(context, isDark);
              }

              return Container(
                decoration: const BoxDecoration(
                  gradient: AppColors.fieldGradient,
                ),
                child: SafeArea(
                  child: Padding(
                    padding: AppConstants.defaultPadding,
                    child: Column(
                      children: [
                        _buildMatchSummary(match, context, isDark),
                        SizedBox(height: AppConstants.largeSpacing),
                        Expanded(
                          child: _buildMatchStats(match, context, isDark),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildErrorState(BuildContext context, bool isDark) {
    return Container(
      decoration: const BoxDecoration(gradient: AppColors.fieldGradient),
      child: SafeArea(
        child: Padding(
          padding: AppConstants.defaultPadding,
          child: Center(
            child: Container(
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
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.error_outline, size: 64.w, color: AppColors.error),
                  SizedBox(height: AppConstants.largeSpacing),
                  Text(
                    'Match not found',
                    style: AppFonts.headline6.copyWith(
                      color: isDark
                          ? AppColors.darkTextPrimary
                          : AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: AppConstants.mediumSpacing),
                  Text(
                    'The requested match could not be found.',
                    style: AppFonts.bodyText2.copyWith(
                      color: AppColors.textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: AppConstants.largeSpacing),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Go Back'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMatchSummary(Match match, BuildContext context, bool isDark) {
    final appCubit = context.read<AppCubit>();
    final battingTeamName = appCubit.getTeamName(match.battingTeamId);
    final bowlingTeamName = appCubit.getTeamName(match.bowlingTeamId);
    final matchResult = appCubit.getMatchResult(match);
    final scoreDisplay = appCubit.getMatchScoreDisplay(match);

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
        children: [
          Text(
            '$battingTeamName vs $bowlingTeamName',
            style: AppFonts.headline5.copyWith(
              color: isDark ? AppColors.darkTextPrimary : AppColors.textPrimary,
              fontWeight: AppFonts.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: AppConstants.mediumSpacing),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppConstants.mediumSpacing,
              vertical: AppConstants.smallSpacing,
            ),
            decoration: BoxDecoration(
              color: match.status == 'completed'
                  ? AppColors.success.withOpacity(0.2)
                  : AppColors.warning.withOpacity(0.2),
              borderRadius: AppConstants.smallBorderRadius,
            ),
            child: Text(
              match.status == 'completed' ? 'Completed' : 'In Progress',
              style: AppFonts.bodyText2.copyWith(
                color: match.status == 'completed'
                    ? AppColors.success
                    : AppColors.warning,
                fontWeight: AppFonts.semiBold,
              ),
            ),
          ),
          SizedBox(height: AppConstants.mediumSpacing),
          Text(
            matchResult,
            style: AppFonts.bodyText1.copyWith(
              color: match.status == 'completed'
                  ? AppColors.success
                  : AppColors.warning,
              fontWeight: AppFonts.semiBold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: AppConstants.mediumSpacing),
          Container(
            padding: AppConstants.smallPadding,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: AppConstants.smallBorderRadius,
            ),
            child: Text(
              scoreDisplay,
              style: AppFonts.headline6.copyWith(
                color: AppColors.primary,
                fontWeight: AppFonts.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMatchStats(Match match, BuildContext context, bool isDark) {
    final appCubit = context.read<AppCubit>();
    final battingTeamName = appCubit.getTeamName(match.battingTeamId);
    final bowlingTeamName = appCubit.getTeamName(match.bowlingTeamId);

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
      child: SingleChildScrollView(
        padding: AppConstants.defaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Match Statistics',
              style: AppFonts.subtitle1.copyWith(
                color: isDark
                    ? AppColors.darkTextPrimary
                    : AppColors.textPrimary,
                fontWeight: AppFonts.semiBold,
              ),
            ),
            SizedBox(height: AppConstants.largeSpacing),

            // Match Info
            _buildStatRow(
              'Match Date',
              '${match.startTime.day}/${match.startTime.month}/${match.startTime.year}',
              isDark,
            ),
            _buildStatRow(
              'Start Time',
              '${match.startTime.hour}:${match.startTime.minute.toString().padLeft(2, '0')}',
              isDark,
            ),
            if (match.endTime != null)
              _buildStatRow(
                'End Time',
                '${match.endTime!.hour}:${match.endTime!.minute.toString().padLeft(2, '0')}',
                isDark,
              ),
            _buildStatRow('Total Overs', '${match.totalOvers}', isDark),

            SizedBox(height: AppConstants.largeSpacing),

            // Batting Team Stats
            Text(
              'Batting Team: $battingTeamName',
              style: AppFonts.subtitle2.copyWith(
                color: isDark
                    ? AppColors.darkTextPrimary
                    : AppColors.textPrimary,
                fontWeight: AppFonts.semiBold,
              ),
            ),
            SizedBox(height: AppConstants.mediumSpacing),
            _buildStatRow('Runs', '${match.battingTeamScore.runs}', isDark),
            _buildStatRow(
              'Wickets',
              '${match.battingTeamScore.wickets}',
              isDark,
            ),
            _buildStatRow('Overs', '${match.battingTeamScore.overs}', isDark),
            _buildStatRow('Extras', '${match.battingTeamScore.extras}', isDark),
            _buildStatRow(
              'Run Rate',
              match.battingTeamScore.runRate.toStringAsFixed(2),
              isDark,
            ),

            SizedBox(height: AppConstants.largeSpacing),

            // Bowling Team Stats
            Text(
              'Bowling Team: $bowlingTeamName',
              style: AppFonts.subtitle2.copyWith(
                color: isDark
                    ? AppColors.darkTextPrimary
                    : AppColors.textPrimary,
                fontWeight: AppFonts.semiBold,
              ),
            ),
            SizedBox(height: AppConstants.mediumSpacing),
            _buildStatRow(
              'Runs Conceded',
              '${match.bowlingTeamScore.runs}',
              isDark,
            ),
            _buildStatRow(
              'Wickets Taken',
              '${match.bowlingTeamScore.wickets}',
              isDark,
            ),
            _buildStatRow(
              'Overs Bowled',
              '${match.bowlingTeamScore.overs}',
              isDark,
            ),
            _buildStatRow(
              'Extras Given',
              '${match.bowlingTeamScore.extras}',
              isDark,
            ),
            _buildStatRow(
              'Economy Rate',
              match.bowlingTeamScore.runRate.toStringAsFixed(2),
              isDark,
            ),

            SizedBox(height: AppConstants.largeSpacing),

            // Ball Events
            Text(
              'Ball Events',
              style: AppFonts.subtitle2.copyWith(
                color: isDark
                    ? AppColors.darkTextPrimary
                    : AppColors.textPrimary,
                fontWeight: AppFonts.semiBold,
              ),
            ),
            SizedBox(height: AppConstants.mediumSpacing),
            if (match.ballEvents.isEmpty)
              Text(
                'No ball events recorded',
                style: AppFonts.bodyText2.copyWith(
                  color: AppColors.textSecondary,
                ),
              )
            else
              Text(
                '${match.ballEvents.length} balls bowled',
                style: AppFonts.bodyText2.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatRow(String label, String value, bool isDark) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppConstants.smallSpacing),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppFonts.bodyText2.copyWith(color: AppColors.textSecondary),
          ),
          Text(
            value,
            style: AppFonts.bodyText2.copyWith(
              color: isDark ? AppColors.darkTextPrimary : AppColors.textPrimary,
              fontWeight: AppFonts.semiBold,
            ),
          ),
        ],
      ),
    );
  }
}
