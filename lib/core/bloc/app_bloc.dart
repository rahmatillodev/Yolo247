import 'package:equatable/equatable.dart';

import '../models/match.dart';
import '../models/player.dart';
import '../models/player_stats.dart';
import '../models/team.dart';

// Events
abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object?> get props => [];
}

// Team Events
class LoadTeams extends AppEvent {}

class AddTeam extends AppEvent {
  final String name;
  final List<String> playerIds;

  const AddTeam({required this.name, this.playerIds = const []});

  @override
  List<Object?> get props => [name, playerIds];
}

class UpdateTeam extends AppEvent {
  final Team team;

  const UpdateTeam({required this.team});

  @override
  List<Object?> get props => [team];
}

class DeleteTeam extends AppEvent {
  final String teamId;

  const DeleteTeam({required this.teamId});

  @override
  List<Object?> get props => [teamId];
}

// Player Events
class LoadPlayers extends AppEvent {}

class AddPlayer extends AppEvent {
  final String name;
  final String role;
  final String teamId;

  const AddPlayer({
    required this.name,
    required this.role,
    required this.teamId,
  });

  @override
  List<Object?> get props => [name, role, teamId];
}

class UpdatePlayer extends AppEvent {
  final Player player;

  const UpdatePlayer({required this.player});

  @override
  List<Object?> get props => [player];
}

class DeletePlayer extends AppEvent {
  final String playerId;

  const DeletePlayer({required this.playerId});

  @override
  List<Object?> get props => [playerId];
}

// Match Events
class LoadMatches extends AppEvent {}

class StartNewMatch extends AppEvent {
  final String teamA;
  final String teamB;
  final String bowlingTeamName;
  final String battingTeamId;
  final String bowlingTeamId;
  final int totalOvers;

  const StartNewMatch({
    required this.teamA,
    required this.teamB,
    required this.bowlingTeamName,
    required this.battingTeamId,
    required this.bowlingTeamId,
    required this.totalOvers,
  });

  @override
  List<Object?> get props => [battingTeamId, bowlingTeamId, totalOvers];
}

class AddBallEvent extends AppEvent {
  final BallEvent ballEvent;

  const AddBallEvent({required this.ballEvent});

  @override
  List<Object?> get props => [ballEvent];
}

class UndoLastBallEvent extends AppEvent {}

class CompleteMatch extends AppEvent {
  final String winnerTeamId;
  final String winReason;

  const CompleteMatch({required this.winnerTeamId, required this.winReason});

  @override
  List<Object?> get props => [winnerTeamId, winReason];
}

class SwapBatsmen extends AppEvent {}

class RetireBatsman extends AppEvent {
  final String batsmanId;

  const RetireBatsman({required this.batsmanId});

  @override
  List<Object?> get props => [batsmanId];
}

// Player Stats Events
class LoadPlayerStats extends AppEvent {}

class UpdatePlayerStats extends AppEvent {
  final String playerId;
  final PlayerStats stats;

  const UpdatePlayerStats({required this.playerId, required this.stats});

  @override
  List<Object?> get props => [playerId, stats];
}

// General Events
class ClearError extends AppEvent {}

class ClearSuccess extends AppEvent {}

class SetLoading extends AppEvent {
  final bool isLoading;

  const SetLoading({required this.isLoading});

  @override
  List<Object?> get props => [isLoading];
}
