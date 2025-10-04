import 'package:flutter/material.dart';
import 'package:yolo247/features/create_edit_team/create_edit_team_screen.dart';
import 'package:yolo247/features/home/home_screen.dart';
import 'package:yolo247/features/match_details/match_details_screen.dart';
import 'package:yolo247/features/match_history/match_history_screen.dart';
import 'package:yolo247/features/match_scoring/match_scoring_screen.dart';
import 'package:yolo247/features/match_summary/match_summary_screen.dart';
import 'package:yolo247/features/new_match/new_match_screen.dart';
import 'package:yolo247/features/player_stats/player_stats_screen.dart';
import 'package:yolo247/features/splash/splash_screen.dart';
import 'package:yolo247/features/team_management/team_management_screen.dart';
import 'package:yolo247/features/welcome/welcome_screen.dart';

class Routes {
  static const String splash = '/';
  static const String welcome = '/welcome';
  static const String home = '/home';
  static const String newMatch = '/new-match';
  static const String matchScoring = '/match-scoring';
  static const String matchHistory = '/match-history';
  static const String matchDetails = '/match-details';
  static const String teamManagement = '/team-management';
  static const String createEditTeam = '/create-edit-team';
  static const String playerStats = '/player-stats';
  static const String matchSummary = '/match-summary';
}

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
          settings: settings,
        );
      case Routes.welcome:
        return MaterialPageRoute(
          builder: (_) => const WelcomeScreen(),
          settings: settings,
        );
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
          settings: settings,
        );
      case Routes.newMatch:
        return MaterialPageRoute(
          builder: (_) => const NewMatchScreen(),
          settings: settings,
        );
      case Routes.matchScoring:
        return MaterialPageRoute(
          builder: (_) => MatchScoringScreen(),
          settings: settings,
        );
      case Routes.matchHistory:
        return MaterialPageRoute(
          builder: (_) => MatchHistoryScreen(),
          settings: settings,
        );
      case Routes.matchDetails:
        final args = settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder: (_) =>
              MatchDetailsScreen(match: args?['match'] as Map<String, dynamic>),
          settings: settings,
        );
      case Routes.teamManagement:
        return MaterialPageRoute(
          builder: (_) => const TeamManagementScreen(),
          settings: settings,
        );
      case Routes.createEditTeam:
        final args = settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder: (_) =>
              CreateEditTeamScreen(teamId: args?['teamId'] as String?),
          settings: settings,
        );
      case Routes.playerStats:
        return MaterialPageRoute(
          builder: (_) => const PlayerStatsScreen(),
          settings: settings,
        );
      case Routes.matchSummary:
        final args = settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder: (_) =>
              MatchSummaryScreen(matchId: args?['matchId'] as String?),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
          settings: settings,
        );
    }
  }
}
