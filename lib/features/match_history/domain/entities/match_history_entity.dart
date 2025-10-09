import 'package:equatable/equatable.dart';

class MatchHistoryEntity extends Equatable {
  final String id;
  final String name;
  final String matchType;
  final String status;
  final String venue;
  final String date;
  final String dateTimeGMT;
  final List<String> teams;
  final List<TeamInfoEntity> teamInfo;
  final String seriesId;
  final bool fantasyEnabled;
  final bool bbbEnabled;
  final bool hasSquad;
  final bool matchStarted;
  final bool matchEnded;
  final List<ScoreEntity>? score;
  final String? tossWinner;
  final String? tossChoice;
  final String? matchWinner;

  const MatchHistoryEntity({
    required this.id,
    required this.name,
    required this.matchType,
    required this.status,
    required this.venue,
    required this.date,
    required this.dateTimeGMT,
    required this.teams,
    required this.teamInfo,
    required this.seriesId,
    required this.fantasyEnabled,
    required this.bbbEnabled,
    required this.hasSquad,
    required this.matchStarted,
    required this.matchEnded,
    this.score,
    this.tossWinner,
    this.tossChoice,
    this.matchWinner,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    matchType,
    status,
    venue,
    date,
    dateTimeGMT,
    teams,
    teamInfo,
    seriesId,
    fantasyEnabled,
    bbbEnabled,
    hasSquad,
    matchStarted,
    matchEnded,
    score,
    tossWinner,
    tossChoice,
    matchWinner,
  ];
}

class TeamInfoEntity extends Equatable {
  final String name;
  final String shortname;
  final String img;

  const TeamInfoEntity({
    required this.name,
    required this.shortname,
    required this.img,
  });

  @override
  List<Object?> get props => [name, shortname, img];
}

class ScoreEntity extends Equatable {
  final int runs;
  final int wickets;
  final double overs;
  final String inning;

  const ScoreEntity({
    required this.runs,
    required this.wickets,
    required this.overs,
    required this.inning,
  });

  @override
  List<Object?> get props => [runs, wickets, overs, inning];
}
