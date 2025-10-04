import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yolo247/core/assets/assets.gen.dart';
import 'package:yolo247/core/data/mock_data.dart';
import 'package:yolo247/core/theme/app_colors.dart';
import 'package:yolo247/core/theme/app_fonts.dart';
import 'package:yolo247/core/widgets/app_app_bar.dart';

class MatchScoringScreen extends StatefulWidget {
  const MatchScoringScreen({super.key});

  @override
  State<MatchScoringScreen> createState() => _MatchScoringScreenState();
}

class _MatchScoringScreenState extends State<MatchScoringScreen> {
  int _selectedRun = 0;

  /// Use centralized mock data
  final Map<String, dynamic> _matchData = MockData.matchScoringData;

  @override
  Widget build(BuildContext context) {
    final match = _matchData["match"];

    return Scaffold(
      backgroundColor: AppColors.transparent,
      appBar: AppAppBar(title: MockData.matchScoring),
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.screenGradient),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildMatchHeader(match),
                16.verticalSpace,
                _buildStatsRow(match),
                16.verticalSpace,
                _buildRunRateChart(),
                20.verticalSpace,
                _buildPlayerSection(
                  title: "Batsmen",
                  headers: MockData.batsmanHeaders,
                  players: _matchData["batsmen"],
                ),
                12.verticalSpace,
                _buildPlayerSection(
                  title: "Bowlers",
                  headers: MockData.bowlerHeaders,
                  players: _matchData["bowlers"],
                ),
                20.verticalSpace,
                _buildBallControls(),
                24.verticalSpace,
                Text(
                  MockData.scoreCard,
                  style: AppFonts.semibold16Inter.copyWith(color: Colors.white),
                ),
                8.verticalSpace,
                _buildScoreCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 🔹 Match Header
  Widget _buildMatchHeader(Map<String, dynamic> match) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        gradient: AppColors.matchDetailsGradient,
        image: DecorationImage(
          image: Assets.images.matchBackground.provider(),
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildTeamSection(
            match["teamA"],
            match["teamAFlag"],
            match["scoreA"],
          ),
          Text(
            MockData.vs,
            style: AppFonts.semibold16Inter.copyWith(
              color: AppColors.textColor,
            ),
          ),
          _buildTeamSection(
            match["teamB"],
            match["teamBFlag"],
            match["scoreB"],
          ),
        ],
      ),
    );
  }

  Widget _buildTeamSection(String team, AssetGenImage flag, String score) {
    return Column(
      children: [
        flag.image(width: 60.w, height: 60.h),
        4.verticalSpace,
        Text(
          team,
          style: AppFonts.semibold14Inter.copyWith(color: Colors.white),
        ),
        2.verticalSpace,
        Text(score, style: AppFonts.bold16Inter.copyWith(color: Colors.white)),
      ],
    );
  }

  // 🔹 Stats Row (Overs, CRR, Target)
  Widget _buildStatsRow(Map<String, dynamic> match) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildStatItem(MockData.overs, match["overs"]),
        _buildStatItem(MockData.crr, match["crr"]),
        _buildStatItem(MockData.target, match["target"]),
      ],
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: AppFonts.regular14Inter.copyWith(color: Colors.white54),
        ),
        4.verticalSpace,
        Text(value, style: AppFonts.bold16Inter.copyWith(color: Colors.white)),
      ],
    );
  }

  // 🔹 Line Chart (Run Rate)
  Widget _buildRunRateChart() {
    final List<double> data = List<double>.from(
      _matchData["run_rate_chart"] ?? [],
    );

    // Agar data bo‘sh bo‘lsa, dummy qiymatlar beramiz
    if (data.isEmpty) {
      data.addAll([6, 7, 9, 10]);
    }

    final double minY = (data.reduce((a, b) => a < b ? a : b) - 1).clamp(
      0,
      double.infinity,
    );
    final double maxY = data.reduce((a, b) => a > b ? a : b) + 1;
    final double interval = ((maxY - minY) / 4).toDouble(); // 4ta bo‘linma

    return Container(
      height: 120.h,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        gradient: AppColors.cardGradient,
      ),
      child: LineChart(
        LineChartData(
          minY: minY,
          maxY: maxY,
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            drawHorizontalLine: true,
            horizontalInterval: interval, // Har 4ta chiziq chiqadi
            getDrawingHorizontalLine: (value) =>
                FlLine(color: Colors.white24, strokeWidth: 1),
          ),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                interval: interval,
                getTitlesWidget: (value, meta) {
                  return Text(
                    value.toStringAsFixed(0),
                    style: AppFonts.regular12Inter.copyWith(
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.center,
                  );
                },
              ),
            ),
            bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          lineBarsData: [
            LineChartBarData(
              isCurved: true,
              color: Colors.greenAccent,
              barWidth: 3,
              isStrokeCapRound: true,
              dotData: FlDotData(show: true),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [
                    Colors.greenAccent.withOpacity(0.4),
                    Colors.transparent,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              spots: List.generate(
                data.length,
                (i) => FlSpot(i.toDouble(), data[i]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Player Section
  Widget _buildPlayerSection({
    required String title,
    required List<String> headers,
    required List<Map<String, dynamic>> players,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        gradient: AppColors.cardGradient,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppFonts.semibold16Inter.copyWith(color: Colors.white),
          ),
          8.verticalSpace,
          Table(
            columnWidths: {
              for (int i = 0; i < headers.length; i++)
                i: const FlexColumnWidth(1),
            },
            children: [
              TableRow(
                children: headers
                    .map(
                      (header) => Padding(
                        padding: EdgeInsets.symmetric(vertical: 4.h),
                        child: Text(
                          header,
                          textAlign: TextAlign.center,
                          style: AppFonts.regular12Inter.copyWith(
                            color: Colors.white54,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              ...players.map((player) {
                final cells = headers.map((header) {
                  final key = _mapHeaderToKey(header);
                  return _buildPlayerCell(player[key]?.toString() ?? "-");
                }).toList();
                return TableRow(children: cells);
              }),
            ],
          ),
        ],
      ),
    );
  }

  String _mapHeaderToKey(String header) {
    switch (header) {
      case "Player":
      case "Bowler":
        return "name";
      case "R":
        return "runs";
      case "B":
        return "balls";
      case "4s":
        return "fours";
      case "6s":
        return "sixes";
      case "SR":
        return "strike_rate";
      case "O":
        return "overs";
      case "W":
        return "wickets";
      case "ER":
        return "economy";
      default:
        return "";
    }
  }

  Widget _buildPlayerCell(String text) => Padding(
    padding: EdgeInsets.symmetric(vertical: 6.h),
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: AppFonts.regular12Inter.copyWith(color: Colors.white),
    ),
  );

  // 🔹 Ball Controls + Special Buttons (scrollable)
  Widget _buildBallControls() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        gradient: AppColors.cardGradient,
      ),
      child: Column(
        children: [
          Text(
            MockData.ballControls,
            style: AppFonts.semibold16Inter.copyWith(color: Colors.white),
          ),
          12.verticalSpace,
          // Runs scroll
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: MockData.runOptions.map((run) {
                return GestureDetector(
                  onTap: () => setState(() => _selectedRun = run),
                  child: Container(
                    margin: EdgeInsets.only(right: 8.w),
                    width: 40.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: _selectedRun == run
                          ? AppColors.primary
                          : Colors.white24,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Center(
                      child: Text(
                        run.toString(),
                        style: AppFonts.bold16Inter.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          12.verticalSpace,
          // Special buttons scroll
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: MockData.specialBallEvents.map((button) {
                return Container(
                  margin: EdgeInsets.only(right: 8.w),
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 10.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    button,
                    style: AppFonts.regular14Inter.copyWith(
                      color: Colors.white,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 Score Card
  Widget _buildScoreCard() {
    final List<Map<String, dynamic>> ballHistory =
        List<Map<String, dynamic>>.from(_matchData["ball_history"]);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        gradient: AppColors.cardGradient,
      ),
      child: Column(
        children: ballHistory.map((ball) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 4.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${MockData.ball} ${ball["over"]}",
                  style: AppFonts.regular14Inter.copyWith(
                    color: Colors.white54,
                  ),
                ),
                Text(
                  ball["description"],
                  style: AppFonts.regular14Inter.copyWith(color: Colors.white),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
