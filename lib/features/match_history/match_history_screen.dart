import 'package:flutter/material.dart';
import 'package:yolo247/core/assets/assets.gen.dart';
import 'package:yolo247/features/match_history/history_card_widget.dart';

import '../../core/constants/app_constants.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/app_app_bar.dart';

// ignore: must_be_immutable
class MatchHistoryScreen extends StatelessWidget {
  MatchHistoryScreen({super.key});

  List<Map<String, dynamic>> matches = [
    {
      "id": 1,
      "teamA": "India",
      "teamB": "Australia",
      "teamAFlag": Assets.images.indiaFlag,
      "teamBFlag": Assets.images.australiaFlag,
      "date": "Oct 4, 2025",
      "time": "19:30",
      "status": "completed",
      "result": "India won by 15 runs",
      "scoreA": "180/5",
      "scoreB": "165/8",
      "battingA": [
        ["Rohit", "55", "35", "6", "2", "157.14"],
        ["Rahul", "38", "28", "4", "1", "135.71"],
        ["Kohli", "25", "18", "3", "0", "138.88"],
      ],
      "bowlingA": [
        ["Bumrah", "4", "22", "2", "5.50"],
        ["Chahal", "4", "31", "1", "7.75"],
      ],
      "battingB": [
        ["Warner", "45", "30", "5", "1", "150.00"],
        ["Smith", "40", "33", "3", "0", "121.21"],
      ],
      "bowlingB": [
        ["Starc", "4", "28", "2", "7.00"],
        ["Zampa", "4", "30", "1", "7.50"],
      ],
    },
    {
      "id": 2,
      "teamA": "Australia",
      "teamB": "England",
      "date": "05 Jul 2025",
      "time": "14:00",
      "result": "Australia won by 10 wickets",
      "scoreA": "200/0",
      "scoreB": "190/10",
      "status": "completed",
      "teamAFlag": Assets.images.australiaFlag,
      "teamBFlag": Assets.images.ukFlag,
      "battingA": [
        ["Warner", "45", "30", "5", "1", "150.00"],
        ["Smith", "40", "33", "3", "0", "121.21"],
      ],
      "bowlingA": [
        ["Starc", "4", "28", "2", "7.00"],
        ["Zampa", "4", "30", "1", "7.50"],
      ],
      "battingB": [
        ["Root", "50", "35", "4", "1", "142.85"],
        ["Stokes", "35", "25", "3", "0", "140.00"],
      ],
      "bowlingB": [
        ["Anderson", "4", "25", "2", "6.25"],
        ["Broad", "4", "28", "1", "7.00"],
      ],
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      appBar: AppAppBar(title: "Match History"),
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.screenGradient),
        child: SafeArea(
          child: Padding(
            padding: AppConstants.defaultPadding,
            child: ListView.builder(
              itemCount: matches.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return HistoryCardWidget(match: matches[index]);
              },
            ),
          ),
        ),
      ),
    );
  }
}
