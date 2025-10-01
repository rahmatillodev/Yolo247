import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppConstants {
  // Screen Dimensions
  static double get screenWidth => ScreenUtil().screenWidth;
  static double get screenHeight => ScreenUtil().screenHeight;

  // Padding Values
  static EdgeInsets get defaultPadding => EdgeInsets.all(16.w);
  static EdgeInsets get smallPadding => EdgeInsets.all(8.w);
  static EdgeInsets get largePadding => EdgeInsets.all(24.w);
  static EdgeInsets get horizontalPadding =>
      EdgeInsets.symmetric(horizontal: 16.w);
  static EdgeInsets get verticalPadding => EdgeInsets.symmetric(vertical: 16.h);

  // Border Radius
  static BorderRadius get defaultBorderRadius => BorderRadius.circular(12.r);
  static BorderRadius get smallBorderRadius => BorderRadius.circular(8.r);
  static BorderRadius get largeBorderRadius => BorderRadius.circular(16.r);
  static BorderRadius get circularBorderRadius => BorderRadius.circular(50.r);

  // Spacing
  static double get smallSpacing => 8.h;
  static double get mediumSpacing => 16.h;
  static double get largeSpacing => 24.h;
  static double get extraLargeSpacing => 32.h;

  // Button Dimensions
  static Size get defaultButtonSize => Size(double.infinity, 48.h);
  static Size get smallButtonSize => Size(120.w, 40.h);
  static Size get largeButtonSize => Size(double.infinity, 56.h);

  // Icon Sizes
  static double get smallIconSize => 16.w;
  static double get mediumIconSize => 24.w;
  static double get largeIconSize => 32.w;
  static double get extraLargeIconSize => 48.w;

  // Animation Durations
  static Duration get shortAnimation => const Duration(milliseconds: 200);
  static Duration get mediumAnimation => const Duration(milliseconds: 300);
  static Duration get longAnimation => const Duration(milliseconds: 500);

  // Cricket Specific Constants
  static const int maxOvers = 50;
  static const int maxWickets = 10;
  static const int maxRunsPerBall = 6;
  static const int minOvers = 1;
}

class AppTexts {
  // App Name
  static const String appName = 'Cricket Score Counter';
  static const String appTagline =
      'Track matches, manage teams, and keep your cricket scores effortlessly.';

  // Common Texts
  static const String getStarted = 'Get Started';
  static const String startMatch = 'Start Match';
  static const String newMatch = 'New Match';
  static const String matchHistory = 'Match History';
  static const String teams = 'Teams';
  static const String playerStats = 'Player Stats';
  static const String matchSummary = 'Match Summary';
  static const String settings = 'Settings';
  static const String back = 'Back';
  static const String save = 'Save';
  static const String cancel = 'Cancel';
  static const String edit = 'Edit';
  static const String delete = 'Delete';
  static const String add = 'Add';
  static const String addNew = 'Add New';
  static const String addPlayer = 'Add Player';
  static const String addTeam = 'Add Team';
  static const String teamName = 'Team Name';
  static const String playerName = 'Player Name';
  static const String overs = 'Overs';
  static const String battingTeam = 'Batting Team';
  static const String bowlingTeam = 'Bowling Team';
  static const String undo = 'Undo';
  static const String swap = 'Swap';
  static const String retire = 'Retire';
  static const String wide = 'Wide';
  static const String noBall = 'No Ball';
  static const String wicket = 'Wicket';
  static const String byes = 'Byes';
  static const String legByes = 'Leg Byes';

  // Match Texts
  static const String currentRunRate = 'CRR';
  static const String requiredRunRate = 'RRR';
  static const String target = 'Target';
  static const String runs = 'Runs';
  static const String balls = 'Balls';
  static const String fours = '4s';
  static const String sixes = '6s';
  static const String strikeRate = 'SR';
  static const String economyRate = 'ER';
  static const String wickets = 'Wickets';
  static const String extras = 'Extras';

  // Statistics Texts
  static const String totalRuns = 'Total Runs';
  static const String averageRuns = 'Avg. Runs';
  static const String bestPerformance = 'Best Performance';
  static const String totalWickets = 'Total Wickets';
  static const String totalMatches = 'Total Matches';
  static const String bestBatsman = 'Best Batsman';
  static const String bestBowler = 'Best Bowler';
  static const String mostRuns = 'Most Runs';
  static const String mostWickets = 'Most Wickets';

  // Result Texts
  static const String wonBy = 'won by';
  static const String runsText = 'runs';
  static const String wicketsText = 'wickets';
  static const String result = 'Result';
  static const String score = 'Score';
  static const String date = 'Date';
  static const String time = 'Time';

  // Error Messages
  static const String errorGeneric = 'Something went wrong. Please try again.';
  static const String errorNetwork =
      'Network error. Please check your connection.';
  static const String errorValidation =
      'Please check your input and try again.';
  static const String errorNotFound = 'Item not found.';
  static const String errorUnauthorized = 'Unauthorized access.';

  // Success Messages
  static const String successSaved = 'Saved successfully!';
  static const String successDeleted = 'Deleted successfully!';
  static const String successUpdated = 'Updated successfully!';
  static const String successCreated = 'Created successfully!';
}
