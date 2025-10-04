import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yolo247/core/assets/assets.gen.dart';
import 'package:yolo247/core/theme/app_colors.dart';
import 'package:yolo247/core/theme/app_fonts.dart';
import 'package:yolo247/core/widgets/app_app_bar.dart';

class MatchDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> match;

  const MatchDetailsScreen({super.key, required this.match});

  @override
  State<MatchDetailsScreen> createState() => _MatchDetailsScreenState();
}

class _MatchDetailsScreenState extends State<MatchDetailsScreen> {
  late bool _isTeamASelected;

  @override
  void initState() {
    super.initState();
    _isTeamASelected = true; // 🔹 default holatda teamA tanlangan
  }

  @override
  Widget build(BuildContext context) {
    final teamA = widget.match["teamA"];
    final teamB = widget.match["teamB"];

    final selectedTeam = _isTeamASelected ? teamA : teamB;
    final battingData = _isTeamASelected
        ? widget.match["battingA"]
        : widget.match["battingB"];
    final bowlingData = _isTeamASelected
        ? widget.match["bowlingA"]
        : widget.match["bowlingB"];

    return Scaffold(
      backgroundColor: AppColors.transparent,
      appBar: AppAppBar(title: "Match Details"),
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.screenGradient),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 48.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // 🔹 Header (Match Info)
                Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    image: DecorationImage(
                      image: Assets.images.matchBackground.provider(),
                      fit: BoxFit.cover,
                    ),
                    gradient: AppColors.matchDetailsGradient,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildFlagWithName(
                            widget.match["teamA"],
                            widget.match["teamAFlag"],
                          ),
                          Text(
                            "VS",
                            style: AppFonts.semibold16Inter.copyWith(
                              color: AppColors.textColor,
                            ),
                          ),
                          _buildFlagWithName(
                            widget.match["teamB"],
                            widget.match["teamBFlag"],
                          ),
                        ],
                      ),
                      10.verticalSpace,
                      Text(
                        "${widget.match["date"]}  ${widget.match["time"]}",
                        style: AppFonts.light14Inter.copyWith(
                          color: AppColors.textColor,
                        ),
                      ),
                    ],
                  ),
                ),

                12.verticalSpace,

                // 🔹 Result
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Result: ",
                      style: AppFonts.regular16Inter.copyWith(
                        color: AppColors.textSuccess,
                      ),
                    ),
                    Text(
                      widget.match["result"],
                      style: AppFonts.regular16Inter,
                    ),
                  ],
                ),

                16.verticalSpace,

                // 🔹 Score Cards
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildScoreCard(
                      team: widget.match["teamA"],
                      score: widget.match["scoreA"],
                      overs: "20.0",
                      extras: "12",
                      runRate: "8.75",
                    ),
                    _buildScoreCard(
                      team: widget.match["teamB"],
                      score: widget.match["scoreB"],
                      overs: "20.0",
                      extras: "8",
                      runRate: "7.50",
                    ),
                  ],
                ),

                16.verticalSpace,

                // 🔹 Tabs
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () => setState(() => _isTeamASelected = true),
                      child: _buildTab(teamA, _isTeamASelected),
                    ),
                    20.horizontalSpace,
                    GestureDetector(
                      onTap: () => setState(() => _isTeamASelected = false),
                      child: _buildTab(teamB, !_isTeamASelected),
                    ),
                  ],
                ),

                12.verticalSpace,

                // 🔹 Batting Table
                _buildTableSection(
                  title: "$selectedTeam Batting",
                  headers: const ["Player", "R", "B", "4s", "6s", "SR"],
                  rows: battingData,
                ),

                12.verticalSpace,

                // 🔹 Bowling Table
                _buildTableSection(
                  title: "$selectedTeam Bowling",
                  headers: const ["Player", "O", "R", "W", "ER"],
                  rows: bowlingData,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFlagWithName(String team, AssetGenImage flag) {
    return Column(
      children: [
        SizedBox(width: 40.w, height: 25.h, child: flag.image()),
        12.verticalSpace,
        Text(
          team,
          style: AppFonts.semibold16Inter.copyWith(
            color: Colors.white.withValues(alpha: 0.85), // 🔹 yumshoq oq
          ),
        ),
      ],
    );
  }

  Widget _buildScoreCard({
    required String team,
    required String score,
    required String overs,
    required String extras,
    required String runRate,
  }) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4.w),
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          gradient: AppColors.cardGradient,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              team,
              textAlign: TextAlign.center,
              style: AppFonts.semibold14Inter.copyWith(
                color: Colors.white.withValues(alpha: 0.85),
              ),
            ),
            4.verticalSpace,
            Text(
              score,
              textAlign: TextAlign.center,
              style: AppFonts.semibold20Inter.copyWith(
                color: AppColors.textColor,
              ),
            ),
            4.verticalSpace,
            _buildScoreRow("Overs:", overs),
            _buildScoreRow("Extras:", extras),
            _buildScoreRow("Run Rate:", runRate),
          ],
        ),
      ),
    );
  }

  Widget _buildScoreRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppFonts.light12Inter.copyWith(
            color: Colors.white.withValues(alpha: 0.75),
          ),
        ),
        Text(
          value,
          style: AppFonts.light12Inter.copyWith(
            color: Colors.white.withValues(alpha: 0.9),
          ),
        ),
      ],
    );
  }

  Widget _buildTab(String title, bool selected) {
    return Text(
      title,
      style: selected
          ? AppFonts.semibold16Inter.copyWith(color: Colors.white)
          : AppFonts.regular16Inter.copyWith(
              color: Colors.white.withValues(alpha: 0.5),
            ),
    );
  }

  Widget _buildTableSection({
    required String title,
    required List<String> headers,
    required List<List<String>> rows,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        gradient: AppColors.cardGradient,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: AppFonts.semibold16Inter.copyWith(
              color: AppColors.textColor,
            ),
          ),
          8.verticalSpace,
          Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            columnWidths: const {
              0: FlexColumnWidth(2),
              1: FlexColumnWidth(1),
              2: FlexColumnWidth(1),
              3: FlexColumnWidth(1),
              4: FlexColumnWidth(1),
              5: FlexColumnWidth(1),
            },
            children: [
              TableRow(
                children: headers
                    .map(
                      (h) => Padding(
                        padding: EdgeInsets.symmetric(vertical: 4.h),
                        child: Text(
                          h,
                          textAlign: TextAlign.center,
                          style: AppFonts.regular12Inter.copyWith(
                            color: AppColors.textSubc,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              ...rows.map(
                (r) => TableRow(
                  children: r
                      .map(
                        (cell) => Padding(
                          padding: EdgeInsets.symmetric(vertical: 4.h),
                          child: Text(
                            cell,
                            textAlign: TextAlign.center,
                            style: AppFonts.regular12Inter.copyWith(
                              color: Colors.white.withValues(alpha: 0.85),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
