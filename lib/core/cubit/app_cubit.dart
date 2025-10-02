import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bloc/app_state.dart';
import '../models/match.dart';
import '../models/player.dart';
import '../models/player_stats.dart';
import '../models/team.dart';
import '../utils/mock_data.dart';

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
        teams = MockData.getMockTeams();
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
          errorMessage: 'Failed to load teams: $e',
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
          successMessage: 'Team created successfully!',
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: 'Failed to create team: $e',
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
          errorMessage: 'Failed to update team: $e',
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
          errorMessage: 'Failed to delete team: $e',
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
        players = MockData.getMockPlayers();
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
          errorMessage: 'Failed to load players: $e',
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
          successMessage: 'Player added successfully!',
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: 'Failed to add player: $e',
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
          errorMessage: 'Failed to update player: $e',
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
          errorMessage: 'Failed to delete player: $e',
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

      final matches = matchesJson
          .map((json) => Match.fromJson(jsonDecode(json)))
          .toList();

      emit(state.copyWith(matches: matches, isLoading: false));
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: 'Failed to load matches: $e',
        ),
      );
    }
  }

  Future<void> startNewMatch(
    String battingTeamId,
    String bowlingTeamId,
    int totalOvers,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));

      final newMatch = Match.create(
        battingTeamId: battingTeamId,
        bowlingTeamId: bowlingTeamId,
        totalOvers: totalOvers,
      );

      emit(
        state.copyWith(
          currentMatch: newMatch,
          isLoading: false,
          successMessage: 'Match started successfully!',
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: 'Failed to start match: $e',
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
      emit(state.copyWith(errorMessage: 'Failed to add ball event: $e'));
    }
  }

  Future<void> undoLastBallEvent() async {
    try {
      if (state.currentMatch == null) return;

      final updatedMatch = state.currentMatch!.undoLastBallEvent();
      emit(state.copyWith(currentMatch: updatedMatch));
    } catch (e) {
      emit(state.copyWith(errorMessage: 'Failed to undo ball event: $e'));
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
          successMessage: 'Match completed successfully!',
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: 'Failed to complete match: $e',
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

      final stats = statsJson
          .map((json) => PlayerStats.fromJson(jsonDecode(json)))
          .toList();

      emit(state.copyWith(playerStats: stats, isLoading: false));
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: 'Failed to load player stats: $e',
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
          successMessage: 'Player stats updated successfully!',
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: 'Failed to update player stats: $e',
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
