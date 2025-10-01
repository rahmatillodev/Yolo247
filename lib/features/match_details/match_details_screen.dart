import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/app_constants.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_fonts.dart';
import '../../core/widgets/app_app_bar.dart';

class MatchDetailsScreen extends StatelessWidget {
  final String? matchId;

  const MatchDetailsScreen({super.key, this.matchId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: 'Match Details'),
      body: Container(
        decoration: const BoxDecoration(gradient: AppColors.fieldGradient),
        child: SafeArea(
          child: Padding(
            padding: AppConstants.defaultPadding,
            child: Column(
              children: [
                _buildMatchSummary(),
                SizedBox(height: AppConstants.largeSpacing),
                Expanded(child: _buildMatchStats()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMatchSummary() {
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
          Text(
            'Team A vs Team B',
            style: AppFonts.headline5.copyWith(
              color: AppColors.textPrimary,
              fontWeight: AppFonts.bold,
            ),
          ),
          SizedBox(height: AppConstants.mediumSpacing),
          Text(
            'Team A won by 25 runs',
            style: AppFonts.bodyText1.copyWith(
              color: AppColors.success,
              fontWeight: AppFonts.semiBold,
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

  Widget _buildMatchStats() {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Match Statistics',
            style: AppFonts.subtitle1.copyWith(
              color: AppColors.textPrimary,
              fontWeight: AppFonts.semiBold,
            ),
          ),
          SizedBox(height: AppConstants.largeSpacing),
          Text(
            'Detailed match statistics will be displayed here.',
            style: AppFonts.bodyText2.copyWith(color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}
