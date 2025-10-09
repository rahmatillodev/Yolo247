import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yolo247/core/assets/assets.gen.dart';
import 'package:yolo247/core/di/dependency_injection.dart';
import 'package:yolo247/features/match_history/history_card_widget.dart';
import 'package:yolo247/features/match_history/presentation/bloc/match_history_bloc.dart';

import '../../core/constants/app_constants.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/app_app_bar.dart';

// ignore: must_be_immutable
class MatchHistoryScreen extends StatelessWidget {
  const MatchHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DependencyInjection.matchHistoryBloc
            ..add(const MatchHistoryEvent.loadMatchHistory()),
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: AppAppBar(title: "Match History"),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(gradient: AppColors.screenGradient),
            child: SafeArea(
              child: Padding(
                padding: AppConstants.defaultPadding,
                child: BlocBuilder<MatchHistoryBloc, MatchHistoryState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () =>
                          const Center(child: Text('Initializing...')),
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      loaded: (matches) {
                        if (matches.isEmpty) {
                          return const Center(child: Text('No matches found'));
                        }
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: matches.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final match = matches[index];
                            // Convert entity to Map for existing UI compatibility
                            final matchMap = _convertEntityToMap(match);
                            return HistoryCardWidget(match: matchMap);
                          },
                        );
                      },
                      error: (message) => Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.error_outline,
                              size: 64,
                              color: Colors.red,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Error: $message',
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Colors.red),
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () {
                                context.read<MatchHistoryBloc>().add(
                                  const MatchHistoryEvent.refreshMatchHistory(),
                                );
                              },
                              child: const Text('Retry'),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Helper method to convert entity to Map for UI compatibility
  Map<String, dynamic> _convertEntityToMap(match) {
    return {
      "id": match.id,
      "teamA": match.teams.isNotEmpty ? match.teams[0] : "Team A",
      "teamB": match.teams.length > 1 ? match.teams[1] : "Team B",
      "teamAFlag": _getTeamFlag(match.teams.isNotEmpty ? match.teams[0] : ""),
      "teamBFlag": _getTeamFlag(match.teams.length > 1 ? match.teams[1] : ""),
      "date": _formatDate(match.date),
      "time": _formatTime(match.dateTimeGMT),
      "status": match.status,
      "result": match.status,
      "teamInfo": match.teamInfo.map((e) => e.shortname).toList(),
      "imageA": match.teamInfo.first.img,
      "imageB": match.teamInfo.last.img,
      "scoreA": match.score != null && match.score!.isNotEmpty
          ? "${match.score![0].runs}/${match.score![0].wickets}"
          : "TBD",
      "scoreB": match.score != null && match.score!.length > 1
          ? "${match.score![1].runs}/${match.score![1].wickets}"
          : "TBD",
      "battingA": _getDefaultBattingData(),
      "bowlingA": _getDefaultBowlingData(),
      "battingB": _getDefaultBattingData(),
      "bowlingB": _getDefaultBowlingData(),
      "venue": match.venue,
      "matchType": match.matchType,
      "seriesId": match.seriesId,
    };
  }

  // Helper method to get team flag based on team name
  AssetGenImage _getTeamFlag(String teamName) {
    switch (teamName.toLowerCase()) {
      case 'india':
        return Assets.images.indiaFlag;
      case 'australia':
        return Assets.images.australiaFlag;
      case 'england':
      case 'united kingdom':
        return Assets.images.ukFlag;
      case 'pakistan':
        return Assets.images.pakistanFlag;
      default:
        return Assets.images.indiaFlag; // Default flag
    }
  }

  // Helper method to get default batting data
  List<Map<String, dynamic>> _getDefaultBattingData() {
    return [
      {
        "Player": "Virat Kohli",
        "R": 30 + Random().nextInt(41),
        "B": 15 + Random().nextInt(16),
        "4s": 2 + Random().nextInt(3),
        "6s": 1 + Random().nextInt(2),
        "SR": 100 + Random().nextInt(101),
      },
      {
        "Player": "Rohit Sharma",
        "R": 30 + Random().nextInt(41),
        "B": 15 + Random().nextInt(16),
        "4s": 2 + Random().nextInt(3),
        "6s": 1 + Random().nextInt(2),
        "SR": 100 + Random().nextInt(101),
      },
      {
        "Player": "KL Rahul",
        "R": 30 + Random().nextInt(41),
        "B": 15 + Random().nextInt(16),
        "4s": 2 + Random().nextInt(3),
        "6s": 1 + Random().nextInt(2),
        "SR": 100 + Random().nextInt(101),
      },
      {
        "Player": "Suryakumar Yadav",
        "R": 30 + Random().nextInt(41),
        "B": 15 + Random().nextInt(16),
        "4s": 2 + Random().nextInt(3),
        "6s": 1 + Random().nextInt(2),
        "SR": 100 + Random().nextInt(101),
      },
      {
        "Player": "Hardik Pandya",
        "R": 18 + Random().nextInt(21),
        "B": 12 + Random().nextInt(13),
        "4s": 1 + Random().nextInt(2),
        "6s": 1 + Random().nextInt(2),
        "SR": 100 + Random().nextInt(101),
      },
    ];
  }

  // Helper method to get default bowling data
  List<Map<String, dynamic>> _getDefaultBowlingData() {
    return [
      {
        "Player": "Jasprit Bumrah",
        "O": 4.0,
        "R": 28 + Random().nextInt(31),
        "W": 1 + Random().nextInt(2),
        "ER": 7.0 + Random().nextInt(11),
      },
      {
        "Player": "Mohammed Shami",
        "O": 4.0,
        "R": 30 + Random().nextInt(41),
        "W": 1 + Random().nextInt(2),
        "ER": 8.0 + Random().nextInt(11),
      },
      {
        "Player": "Ravindra Jadeja",
        "O": 4.0,
        "R": 24 + Random().nextInt(26),
        "W": 2 + Random().nextInt(3),
        "ER": 6.0 + Random().nextInt(11),
      },
      {
        "Player": "Yuzvendra Chahal",
        "O": 4.0,
        "R": 30 + Random().nextInt(41),
        "W": 1 + Random().nextInt(2),
        "ER": 7.5 + Random().nextInt(11),
      },
      {
        "Player": "Hardik Pandya",
        "O": 4.0,
        "R": 35 + Random().nextInt(41),
        "W": 1 + Random().nextInt(2),
        "ER": 8.75 + Random().nextInt(11),
      },
    ];
  }

  String _formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      return "${date.day.toString().padLeft(2, '0')} ${_getMonthName(date.month)} ${date.year}";
    } catch (e) {
      return "TBD";
    }
  }

  String _formatTime(String dateTimeString) {
    try {
      final dateTime = DateTime.parse(dateTimeString);
      return "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";
    } catch (e) {
      return "TBD";
    }
  }

  String _getMonthName(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return months[month - 1];
  }
}
