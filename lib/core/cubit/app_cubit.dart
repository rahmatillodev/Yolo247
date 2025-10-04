import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/mock_data.dart';
import '../models/match.dart';
import '../models/player.dart';
import '../models/player_stats.dart';
import '../models/team.dart';
import 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState()) {
    _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    await loadTeams();
    await loadPlayers();
    await loadMatches();
    await loadPlayerStats();
  }

  // Team Methods
  Future<void> loadTeams() async {
    try {
      emit(state.copyWith(isLoading: true));

      final prefs = await SharedPreferences.getInstance();
      final teamsJson = prefs.getStringList('teams') ?? [];

      List<Team> teams;
      if (teamsJson.isEmpty) {
        // Load mock data if no teams exist
        teams = MockData.mockTeams;
        await _saveTeams(teams);
      } else {
        teams = teamsJson
            .map((json) => Team.fromJson(jsonDecode(json)))
            .toList();
      }

      emit(state.copyWith(teams: teams, isLoading: false));
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: '${MockData.failedToLoadTeams}: $e',
        ),
      );
    }
  }

  Future<void> addTeam(String name, {List<String> playerIds = const []}) async {
    try {
      emit(state.copyWith(isLoading: true));

      final newTeam = Team.create(name: name, playerIds: playerIds);
      final updatedTeams = [...state.teams, newTeam];

      await _saveTeams(updatedTeams);

      emit(
        state.copyWith(
          teams: updatedTeams,
          isLoading: false,
          successMessage: MockData.teamCreatedSuccessfully,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: '${MockData.failedToCreateTeam}: $e',
        ),
      );
    }
  }

  Future<void> updateTeam(Team team) async {
    try {
      emit(state.copyWith(isLoading: true));

      final updatedTeams = state.teams.map((t) {
        return t.id == team.id ? team : t;
      }).toList();

      await _saveTeams(updatedTeams);

      emit(
        state.copyWith(
          teams: updatedTeams,
          isLoading: false,
          successMessage: 'Team updated successfully!',
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: '${MockData.failedToUpdateTeam}: $e',
        ),
      );
    }
  }

  Future<void> deleteTeam(String teamId) async {
    try {
      emit(state.copyWith(isLoading: true));

      final updatedTeams = state.teams
          .where((team) => team.id != teamId)
          .toList();

      await _saveTeams(updatedTeams);

      emit(
        state.copyWith(
          teams: updatedTeams,
          isLoading: false,
          successMessage: 'Team deleted successfully!',
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: '${MockData.failedToDeleteTeam}: $e',
        ),
      );
    }
  }

  // Player Methods
  Future<void> loadPlayers() async {
    try {
      emit(state.copyWith(isLoading: true));

      final prefs = await SharedPreferences.getInstance();
      final playersJson = prefs.getStringList('players') ?? [];

      List<Player> players;
      if (playersJson.isEmpty) {
        // Load mock data if no players exist
        players = MockData.mockPlayers;
        await _savePlayers(players);
      } else {
        players = playersJson
            .map((json) => Player.fromJson(jsonDecode(json)))
            .toList();
      }

      emit(state.copyWith(players: players, isLoading: false));
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: '${MockData.failedToLoadPlayers}: $e',
        ),
      );
    }
  }

  Future<void> addPlayer(String name, String role, String teamId) async {
    try {
      emit(state.copyWith(isLoading: true));

      final newPlayer = Player.create(name: name, role: role, teamId: teamId);

      final updatedPlayers = [...state.players, newPlayer];
      await _savePlayers(updatedPlayers);

      emit(
        state.copyWith(
          players: updatedPlayers,
          isLoading: false,
          successMessage: MockData.playerAddedSuccessfully,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: '${MockData.failedToAddPlayer}: $e',
        ),
      );
    }
  }

  Future<void> updatePlayer(Player player) async {
    try {
      emit(state.copyWith(isLoading: true));

      final updatedPlayers = state.players.map((p) {
        return p.id == player.id ? player : p;
      }).toList();

      await _savePlayers(updatedPlayers);

      emit(
        state.copyWith(
          players: updatedPlayers,
          isLoading: false,
          successMessage: 'Player updated successfully!',
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: '${MockData.failedToUpdatePlayer}: $e',
        ),
      );
    }
  }

  Future<void> deletePlayer(String playerId) async {
    try {
      emit(state.copyWith(isLoading: true));

      final updatedPlayers = state.players
          .where((player) => player.id != playerId)
          .toList();

      await _savePlayers(updatedPlayers);

      emit(
        state.copyWith(
          players: updatedPlayers,
          isLoading: false,
          successMessage: 'Player deleted successfully!',
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: '${MockData.failedToDeletePlayer}: $e',
        ),
      );
    }
  }

  // Match Methods
  Future<void> loadMatches() async {
    try {
      emit(state.copyWith(isLoading: true));

      final prefs = await SharedPreferences.getInstance();
      final matchesJson = prefs.getStringList('matches') ?? [];

      List<Match> matches;
      if (matchesJson.isEmpty) {
        // Load mock data if no matches exist
        matches = [];
      } else {
        matches = matchesJson
            .map((json) => Match.fromJson(jsonDecode(json)))
            .toList();
      }

      emit(state.copyWith(matches: matches, isLoading: false));
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: '${MockData.failedToLoadMatches}: $e',
        ),
      );
    }
  }

  Future<void> startNewMatch(
    String teamA,
    String teamB,
    String bowlingTeamName,
    String battingTeamId,
    String bowlingTeamId,
    int totalOvers,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));

      final newMatch = Match.create(
        teamA: teamA,
        teamB: teamB,
        bowlingTeamName: bowlingTeamName,
        battingTeamId: battingTeamId,
        bowlingTeamId: bowlingTeamId,
        totalOvers: totalOvers,
      );

      emit(
        state.copyWith(
          currentMatch: newMatch,
          isLoading: false,
          successMessage: MockData.matchStartedSuccessfully,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: '${MockData.failedToStartMatch}: $e',
        ),
      );
    }
  }

  Future<void> addBallEvent(BallEvent ballEvent) async {
    try {
      if (state.currentMatch == null) return;

      final updatedMatch = state.currentMatch!.addBallEvent(ballEvent);
      emit(state.copyWith(currentMatch: updatedMatch));
    } catch (e) {
      emit(
        state.copyWith(errorMessage: '${MockData.failedToAddBallEvent}: $e'),
      );
    }
  }

  Future<void> undoLastBallEvent() async {
    try {
      if (state.currentMatch == null) return;

      final updatedMatch = state.currentMatch!.undoLastBallEvent();
      emit(state.copyWith(currentMatch: updatedMatch));
    } catch (e) {
      emit(
        state.copyWith(errorMessage: '${MockData.failedToUndoBallEvent}: $e'),
      );
    }
  }

  Future<void> completeMatch(String winnerTeamId, String winReason) async {
    try {
      if (state.currentMatch == null) return;

      emit(state.copyWith(isLoading: true));

      final completedMatch = state.currentMatch!.completeMatch(
        winnerTeamId: winnerTeamId,
        winReason: winReason,
      );

      final updatedMatches = [...state.matches, completedMatch];
      await _saveMatches(updatedMatches);

      emit(
        state.copyWith(
          matches: updatedMatches,
          currentMatch: null,
          isLoading: false,
          successMessage: MockData.matchCompletedSuccessfully,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: '${MockData.failedToCompleteMatch}: $e',
        ),
      );
    }
  }

  // Player Stats Methods
  Future<void> loadPlayerStats() async {
    try {
      emit(state.copyWith(isLoading: true));

      final prefs = await SharedPreferences.getInstance();
      final statsJson = prefs.getStringList('player_stats') ?? [];

      List<PlayerStats> stats;
      if (statsJson.isEmpty) {
        // Load mock data if no stats exist
        stats = MockData.mockPlayerStats;
        await _savePlayerStats(stats);
      } else {
        stats = statsJson
            .map((json) => PlayerStats.fromJson(jsonDecode(json)))
            .toList();
      }

      emit(state.copyWith(playerStats: stats, isLoading: false));
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: '${MockData.failedToLoadPlayerStats}: $e',
        ),
      );
    }
  }

  Future<void> updatePlayerStats(String playerId, PlayerStats stats) async {
    try {
      emit(state.copyWith(isLoading: true));

      final updatedStats = state.playerStats.map((s) {
        return s.playerId == playerId ? stats : s;
      }).toList();

      await _savePlayerStats(updatedStats);

      emit(
        state.copyWith(
          playerStats: updatedStats,
          isLoading: false,
          successMessage: MockData.playerStatsUpdatedSuccessfully,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: '${MockData.failedToUpdatePlayerStats}: $e',
        ),
      );
    }
  }

  // Utility Methods
  void clearError() {
    emit(state.copyWith(errorMessage: null));
  }

  void clearSuccess() {
    emit(state.copyWith(successMessage: null));
  }

  void setLoading(bool isLoading) {
    emit(state.copyWith(isLoading: isLoading));
  }

  // Helper methods for getting data
  String getTeamName(String teamId) {
    final team = state.teams.firstWhere(
      (team) => team.id == teamId,
      orElse: () => Team.create(name: 'Unknown Team'),
    );
    return team.name;
  }

  Match? getMatchById(String matchId) {
    try {
      return state.matches.firstWhere((match) => match.id == matchId);
    } catch (e) {
      return null;
    }
  }

  String getMatchResult(Match match) {
    if (match.status != 'completed' || match.winnerTeamId == null) {
      return 'Match in progress';
    }

    final winnerTeamName = getTeamName(match.winnerTeamId!);
    return match.winReason ?? '$winnerTeamName won';
  }

  String getMatchScoreDisplay(Match match) {
    if (match.status == 'completed') {
      return '${match.battingTeamScore.runs}/${match.battingTeamScore.wickets} - ${match.bowlingTeamScore.runs}/${match.bowlingTeamScore.wickets}';
    } else {
      return '${match.battingTeamScore.runs}/${match.battingTeamScore.wickets} (${match.battingTeamScore.overs} overs)';
    }
  }

  // Helper methods for saving data
  Future<void> _saveTeams(List<Team> teams) async {
    final prefs = await SharedPreferences.getInstance();
    final teamsJson = teams.map((team) => jsonEncode(team.toJson())).toList();
    await prefs.setStringList('teams', teamsJson);
  }

  Future<void> _savePlayers(List<Player> players) async {
    final prefs = await SharedPreferences.getInstance();
    final playersJson = players
        .map((player) => jsonEncode(player.toJson()))
        .toList();
    await prefs.setStringList('players', playersJson);
  }

  Future<void> _saveMatches(List<Match> matches) async {
    final prefs = await SharedPreferences.getInstance();
    final matchesJson = matches
        .map((match) => jsonEncode(match.toJson()))
        .toList();
    await prefs.setStringList('matches', matchesJson);
  }

  Future<void> _savePlayerStats(List<PlayerStats> stats) async {
    final prefs = await SharedPreferences.getInstance();
    final statsJson = stats.map((stat) => jsonEncode(stat.toJson())).toList();
    await prefs.setStringList('player_stats', statsJson);
  }
}
