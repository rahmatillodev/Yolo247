import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yolo247/core/cubit/theme_cubit.dart';

import '../../core/bloc/app_bloc.dart';
import '../../core/bloc/app_bloc_impl.dart';
import '../../core/bloc/app_state.dart';
import '../../core/constants/app_constants.dart';
import '../../core/models/match.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_fonts.dart';
import '../../core/widgets/app_app_bar.dart';

class MatchHistoryScreen extends StatelessWidget {
  const MatchHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        final isDark = themeMode == ThemeMode.dark;
        return Scaffold(
          backgroundColor: isDark
              ? AppColors.darkBackground
              : AppColors.background,
          appBar: AppAppBar(title: AppTexts.matchHistory),
          body: BlocConsumer<AppBloc, AppState>(
            listener: (context, state) {
              if (state.errorMessage != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.errorMessage!),
                    backgroundColor: AppColors.error,
                  ),
                );
                context.read<AppBloc>().add(ClearError());
              }
            },
            builder: (context, state) {
              return SafeArea(
                child: Padding(
                  padding: AppConstants.defaultPadding,
                  child: Column(
                    children: [
                      // Header
                      _buildHeader(isDark),

                      SizedBox(height: AppConstants.largeSpacing),

                      // Match List
                      Expanded(
                        child: _buildMatchList(state.matches, context, isDark),
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
          Icon(Icons.history, size: 48.w, color: AppColors.primary),
          SizedBox(height: AppConstants.mediumSpacing),
          Text(
            AppTexts.matchHistory,
            style: AppFonts.headline5.copyWith(
              color: isDark ? AppColors.darkTextPrimary : AppColors.textPrimary,
              fontWeight: AppFonts.bold,
            ),
          ),
          SizedBox(height: AppConstants.smallSpacing),
          Text(
            'View all completed matches',
            style: AppFonts.bodyText2.copyWith(color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }

  Widget _buildMatchList(
    List<Match> matches,
    BuildContext context,
    bool isDark,
  ) {
    if (matches.isEmpty) {
      return _buildEmptyState(context);
    }

    return ListView.builder(
      itemCount: matches.length,
      itemBuilder: (context, index) {
        final match = matches[index];
        return _buildMatchCard(match, context, isDark);
      },
    );
  }

  Widget _buildEmptyState(BuildContext context) {
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
            Icons.sports_cricket,
            size: 64.w,
            color: AppColors.textSecondary,
          ),
          SizedBox(height: AppConstants.largeSpacing),
          Text(
            'No matches yet',
            style: AppFonts.headline6.copyWith(color: AppColors.textSecondary),
          ),
          SizedBox(height: AppConstants.mediumSpacing),
          Text(
            'Start your first match to see it here!',
            style: AppFonts.bodyText2.copyWith(color: AppColors.textSecondary),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: AppConstants.largeSpacing),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/new-match'),
            child: Text(AppTexts.newMatch),
          ),
        ],
      ),
    );
  }

  Widget _buildMatchCard(Match match, BuildContext context, bool isDark) {
    return Container(
      margin: EdgeInsets.only(bottom: AppConstants.mediumSpacing),
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
          // Match Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Team A vs Team B', // TODO: Get actual team names
                style: AppFonts.subtitle1.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: AppFonts.semiBold,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppConstants.smallSpacing,
                  vertical: 4.h,
                ),
                decoration: BoxDecoration(
                  color: AppColors.success.withOpacity(0.2),
                  borderRadius: AppConstants.smallBorderRadius,
                ),
                child: Text(
                  'Completed',
                  style: AppFonts.caption.copyWith(
                    color: AppColors.success,
                    fontWeight: AppFonts.semiBold,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: AppConstants.mediumSpacing),

          // Match Info
          Row(
            children: [
              Icon(
                Icons.calendar_today,
                size: 16.w,
                color: AppColors.textSecondary,
              ),
              SizedBox(width: AppConstants.smallSpacing),
              Text(
                '${match.startTime.day}/${match.startTime.month}/${match.startTime.year}',
                style: AppFonts.bodyText2.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              SizedBox(width: AppConstants.largeSpacing),
              Icon(
                Icons.access_time,
                size: 16.w,
                color: AppColors.textSecondary,
              ),
              SizedBox(width: AppConstants.smallSpacing),
              Text(
                '${match.startTime.hour}:${match.startTime.minute.toString().padLeft(2, '0')}',
                style: AppFonts.bodyText2.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),

          SizedBox(height: AppConstants.mediumSpacing),

          // Score
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${match.battingTeamScore.runs}/${match.battingTeamScore.wickets}',
                style: AppFonts.headline6.copyWith(
                  color: AppColors.primary,
                  fontWeight: AppFonts.bold,
                ),
              ),
              Text(
                '${match.battingTeamScore.overs} overs',
                style: AppFonts.bodyText2.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),

          SizedBox(height: AppConstants.mediumSpacing),

          // Result
          Container(
            width: double.infinity,
            padding: AppConstants.smallPadding,
            decoration: BoxDecoration(
              color: AppColors.accent,
              borderRadius: AppConstants.smallBorderRadius,
            ),
            child: Text(
              'Team A won by 25 runs', // TODO: Calculate actual result
              style: AppFonts.bodyText2.copyWith(
                color: AppColors.textPrimary,
                fontWeight: AppFonts.semiBold,
              ),
            ),
          ),

          SizedBox(height: AppConstants.mediumSpacing),

          // View Details Button
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/match-details',
                  arguments: {'matchId': match.id},
                );
              },
              child: Text('View Details'),
            ),
          ),
        ],
      ),
    );
  }
}
