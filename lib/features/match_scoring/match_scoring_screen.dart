import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/bloc/app_bloc.dart';
import '../../core/bloc/app_bloc_impl.dart';
import '../../core/bloc/app_state.dart';
import '../../core/constants/app_constants.dart';
import '../../core/models/match.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_fonts.dart';
import '../../core/widgets/app_app_bar.dart';

class MatchScoringScreen extends StatefulWidget {
  final String? matchId;

  const MatchScoringScreen({super.key, this.matchId});

  @override
  State<MatchScoringScreen> createState() => _MatchScoringScreenState();
}

class _MatchScoringScreenState extends State<MatchScoringScreen> {
  bool _isWide = false;
  bool _isNoBall = false;
  bool _isWicket = false;
  bool _isByes = false;
  bool _isLegByes = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        title: 'Live Scoring',
        actions: [
          IconButton(
            icon: const Icon(Icons.undo),
            onPressed: () {
              context.read<AppBloc>().add(UndoLastBallEvent());
            },
          ),
          IconButton(
            icon: const Icon(Icons.swap_horiz),
            onPressed: () {
              context.read<AppBloc>().add(SwapBatsmen());
            },
          ),
        ],
      ),
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
          final currentMatch = state.currentMatch;
          if (currentMatch == null) {
            return const Center(child: Text('No active match found'));
          }

          return Container(
            decoration: const BoxDecoration(gradient: AppColors.fieldGradient),
            child: SafeArea(
              child: SingleChildScrollView(
                padding: AppConstants.defaultPadding,
                child: Column(
                  children: [
                    // Live Scoreboard
                    _buildLiveScoreboard(currentMatch),

                    SizedBox(height: AppConstants.largeSpacing),

                    // Run Rate Chart
                    _buildRunRateChart(),

                    SizedBox(height: AppConstants.largeSpacing),

                    // Player Stats
                    _buildPlayerStats(currentMatch),

                    SizedBox(height: AppConstants.largeSpacing),

                    // Scoring Panel
                    _buildScoringPanel(),

                    SizedBox(height: AppConstants.largeSpacing),

                    // Ball Events
                    _buildBallEvents(currentMatch),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLiveScoreboard(Match match) {
    return Container(
      width: double.infinity,
      padding: AppConstants.defaultPadding,
      decoration: BoxDecoration(
        color: AppColors.surface.withOpacity(0.95),
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
        children: [
          // Team Names
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Team A', // TODO: Get actual team names
                style: AppFonts.headline6.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: AppFonts.bold,
                ),
              ),
              Text(
                'Team B', // TODO: Get actual team names
                style: AppFonts.headline6.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: AppFonts.bold,
                ),
              ),
            ],
          ),

          SizedBox(height: AppConstants.mediumSpacing),

          // Score
          Text(
            '${match.battingTeamScore.runs}/${match.battingTeamScore.wickets}',
            style: AppFonts.scoreDisplay.copyWith(color: AppColors.primary),
          ),

          SizedBox(height: AppConstants.mediumSpacing),

          // Match Info
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildInfoItem('Overs', '${match.battingTeamScore.overs}'),
              _buildInfoItem(
                AppTexts.currentRunRate,
                match.battingTeamScore.runRate.toStringAsFixed(2),
              ),
              _buildInfoItem(
                AppTexts.requiredRunRate,
                '6.50',
              ), // TODO: Calculate RRR
              _buildInfoItem(AppTexts.target, '150'), // TODO: Calculate target
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: AppFonts.statsValue.copyWith(color: AppColors.textPrimary),
        ),
        Text(
          label,
          style: AppFonts.statsLabel.copyWith(color: AppColors.textSecondary),
        ),
      ],
    );
  }

  Widget _buildRunRateChart() {
    return Container(
      width: double.infinity,
      height: 200.h,
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
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: true),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
            bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          borderData: FlBorderData(show: true),
          lineBarsData: [
            LineChartBarData(
              spots: [
                const FlSpot(0, 0),
                const FlSpot(1, 2),
                const FlSpot(2, 4),
                const FlSpot(3, 3),
                const FlSpot(4, 5),
                const FlSpot(5, 6),
              ],
              isCurved: true,
              color: AppColors.primary,
              barWidth: 3,
              belowBarData: BarAreaData(
                show: true,
                color: AppColors.primary.withOpacity(0.1),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlayerStats(Match match) {
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
            'Current Players',
            style: AppFonts.subtitle1.copyWith(
              color: AppColors.textPrimary,
              fontWeight: AppFonts.semiBold,
            ),
          ),
          SizedBox(height: AppConstants.mediumSpacing),

          // Batsmen
          _buildPlayerRow('Batsman 1', '45', '30', '5', '2', '150.0'),
          _buildPlayerRow('Batsman 2', '23', '18', '2', '1', '127.8'),

          SizedBox(height: AppConstants.mediumSpacing),

          // Bowler
          _buildPlayerRow('Bowler', '2.4', '15', '1', '6.25'),
        ],
      ),
    );
  }

  Widget _buildPlayerRow(
    String name,
    String runs,
    String balls,
    String fours,
    String sixes, [
    String? strikeRate,
  ]) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppConstants.smallSpacing),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              name,
              style: AppFonts.playerName.copyWith(color: AppColors.textPrimary),
            ),
          ),
          Expanded(
            child: Text(
              runs,
              style: AppFonts.statsValue.copyWith(color: AppColors.textPrimary),
            ),
          ),
          Expanded(
            child: Text(
              balls,
              style: AppFonts.statsValue.copyWith(color: AppColors.textPrimary),
            ),
          ),
          Expanded(
            child: Text(
              fours,
              style: AppFonts.statsValue.copyWith(color: AppColors.textPrimary),
            ),
          ),
          Expanded(
            child: Text(
              sixes,
              style: AppFonts.statsValue.copyWith(color: AppColors.textPrimary),
            ),
          ),
          if (strikeRate != null)
            Expanded(
              child: Text(
                strikeRate,
                style: AppFonts.statsValue.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildScoringPanel() {
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
            'Scoring Panel',
            style: AppFonts.subtitle1.copyWith(
              color: AppColors.textPrimary,
              fontWeight: AppFonts.semiBold,
            ),
          ),
          SizedBox(height: AppConstants.mediumSpacing),

          // Run Buttons
          _buildRunButtons(),

          SizedBox(height: AppConstants.mediumSpacing),

          // Special Events
          _buildSpecialEvents(),

          SizedBox(height: AppConstants.mediumSpacing),

          // Action Buttons
          _buildActionButtons(),
        ],
      ),
    );
  }

  Widget _buildRunButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildRunButton('0', 0),
        _buildRunButton('1', 1),
        _buildRunButton('2', 2),
        _buildRunButton('3', 3),
        _buildRunButton('4', 4),
        _buildRunButton('6', 6),
      ],
    );
  }

  Widget _buildRunButton(String label, int runs) {
    return GestureDetector(
      onTap: () {
        _addBallEvent(runs);
      },
      child: Container(
        width: 50.w,
        height: 50.w,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: AppConstants.circularBorderRadius,
          boxShadow: [
            BoxShadow(
              color: AppColors.shadow,
              blurRadius: 5.r,
              offset: Offset(0, 3.h),
            ),
          ],
        ),
        child: Center(
          child: Text(
            label,
            style: AppFonts.button.copyWith(
              color: AppColors.textWhite,
              fontWeight: AppFonts.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSpecialEvents() {
    return Wrap(
      spacing: AppConstants.smallSpacing,
      runSpacing: AppConstants.smallSpacing,
      children: [
        _buildEventChip(
          AppTexts.wide,
          _isWide,
          (value) => setState(() => _isWide = value),
        ),
        _buildEventChip(
          AppTexts.noBall,
          _isNoBall,
          (value) => setState(() => _isNoBall = value),
        ),
        _buildEventChip(
          AppTexts.wicket,
          _isWicket,
          (value) => setState(() => _isWicket = value),
        ),
        _buildEventChip(
          AppTexts.byes,
          _isByes,
          (value) => setState(() => _isByes = value),
        ),
        _buildEventChip(
          AppTexts.legByes,
          _isLegByes,
          (value) => setState(() => _isLegByes = value),
        ),
      ],
    );
  }

  Widget _buildEventChip(
    String label,
    bool isSelected,
    ValueChanged<bool> onChanged,
  ) {
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: onChanged,
      selectedColor: AppColors.secondary.withOpacity(0.3),
      checkmarkColor: AppColors.primary,
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton.icon(
          onPressed: () {
            // TODO: Implement retire functionality
          },
          icon: const Icon(Icons.exit_to_app),
          label: Text(AppTexts.retire),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.warning,
            foregroundColor: AppColors.textWhite,
          ),
        ),
        ElevatedButton.icon(
          onPressed: () {
            // TODO: Implement complete match functionality
            Navigator.pushNamed(
              context,
              '/match-summary',
              arguments: {'matchId': widget.matchId},
            );
          },
          icon: const Icon(Icons.check_circle),
          label: Text('Complete Match'),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.success,
            foregroundColor: AppColors.textWhite,
          ),
        ),
      ],
    );
  }

  Widget _buildBallEvents(Match match) {
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
            'Recent Balls',
            style: AppFonts.subtitle1.copyWith(
              color: AppColors.textPrimary,
              fontWeight: AppFonts.semiBold,
            ),
          ),
          SizedBox(height: AppConstants.mediumSpacing),

          // Show last 10 ball events
          ...match.ballEvents
              .take(10)
              .map((event) => _buildBallEventItem(event)),
        ],
      ),
    );
  }

  Widget _buildBallEventItem(BallEvent event) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppConstants.smallSpacing),
      child: Row(
        children: [
          Container(
            width: 30.w,
            height: 30.w,
            decoration: BoxDecoration(
              color: event.isWicket ? AppColors.error : AppColors.primary,
              borderRadius: AppConstants.circularBorderRadius,
            ),
            child: Center(
              child: Text(
                '${event.ballNumber}',
                style: AppFonts.caption.copyWith(
                  color: AppColors.textWhite,
                  fontWeight: AppFonts.semiBold,
                ),
              ),
            ),
          ),
          SizedBox(width: AppConstants.mediumSpacing),
          Expanded(
            child: Text(
              '${event.runs} runs - ${event.ballType}',
              style: AppFonts.bodyText2.copyWith(color: AppColors.textPrimary),
            ),
          ),
        ],
      ),
    );
  }

  void _addBallEvent(int runs) {
    // TODO: Implement ball event addition
    // This would create a BallEvent and add it to the current match
  }
}
