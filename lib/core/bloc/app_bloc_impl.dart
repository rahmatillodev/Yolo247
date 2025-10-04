import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/team.dart';
import '../models/player.dart';
import '../models/player_stats.dart';
import '../models/match.dart';
import 'app_bloc.dart';
import 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppState()) {
    on<LoadTeams>(_onLoadTeams);
    on<AddTeam>(_onAddTeam);
    on<UpdateTeam>(_onUpdateTeam);
    on<DeleteTeam>(_onDeleteTeam);

    on<LoadPlayers>(_onLoadPlayers);
    on<AddPlayer>(_onAddPlayer);
    on<UpdatePlayer>(_onUpdatePlayer);
    on<DeletePlayer>(_onDeletePlayer);

    on<LoadMatches>(_onLoadMatches);
    on<StartNewMatch>(_onStartNewMatch);
    on<AddBallEvent>(_onAddBallEvent);
    on<UndoLastBallEvent>(_onUndoLastBallEvent);
    on<CompleteMatch>(_onCompleteMatch);
    on<SwapBatsmen>(_onSwapBatsmen);
    on<RetireBatsman>(_onRetireBatsman);

    on<LoadPlayerStats>(_onLoadPlayerStats);
    on<UpdatePlayerStats>(_onUpdatePlayerStats);

    on<ClearError>(_onClearError);
    on<ClearSuccess>(_onClearSuccess);
    on<SetLoading>(_onSetLoading);
  }

  Future<void> _onLoadTeams(LoadTeams event, Emitter<AppState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));

      final prefs = await SharedPreferences.getInstance();
      final teamsJson = prefs.getStringList('teams') ?? [];

      final teams = teamsJson
          .map((json) => Team.fromJson(jsonDecode(json)))
          .toList();

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

  Future<void> _onAddTeam(AddTeam event, Emitter<AppState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));

      final newTeam = Team.create(name: event.name, playerIds: event.playerIds);

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

  Future<void> _onUpdateTeam(UpdateTeam event, Emitter<AppState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));

      final updatedTeams = state.teams.map((team) {
        return team.id == event.team.id ? event.team : team;
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

  Future<void> _onDeleteTeam(DeleteTeam event, Emitter<AppState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));

      final updatedTeams = state.teams
          .where((team) => team.id != event.teamId)
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

  Future<void> _onLoadPlayers(LoadPlayers event, Emitter<AppState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));

      final prefs = await SharedPreferences.getInstance();
      final playersJson = prefs.getStringList('players') ?? [];

      final players = playersJson
          .map((json) => Player.fromJson(jsonDecode(json)))
          .toList();

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

  Future<void> _onAddPlayer(AddPlayer event, Emitter<AppState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));

      final newPlayer = Player.create(
        name: event.name,
        role: event.role,
        teamId: event.teamId,
      );

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

  Future<void> _onUpdatePlayer(
    UpdatePlayer event,
    Emitter<AppState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));

      final updatedPlayers = state.players.map((player) {
        return player.id == event.player.id ? event.player : player;
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

  Future<void> _onDeletePlayer(
    DeletePlayer event,
    Emitter<AppState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));

      final updatedPlayers = state.players
          .where((player) => player.id != event.playerId)
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

  Future<void> _onLoadMatches(LoadMatches event, Emitter<AppState> emit) async {
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

  Future<void> _onStartNewMatch(
    StartNewMatch event,
    Emitter<AppState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));

      final newMatch = Match.create(
        teamA: event.teamA,
        teamB: event.teamB,
        bowlingTeamName: event.bowlingTeamName,
        battingTeamId: event.battingTeamId,
        bowlingTeamId: event.bowlingTeamId,
        totalOvers: event.totalOvers,
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

  Future<void> _onAddBallEvent(
    AddBallEvent event,
    Emitter<AppState> emit,
  ) async {
    try {
      if (state.currentMatch == null) return;

      final updatedMatch = state.currentMatch!.addBallEvent(event.ballEvent);

      emit(state.copyWith(currentMatch: updatedMatch));
    } catch (e) {
      emit(state.copyWith(errorMessage: 'Failed to add ball event: $e'));
    }
  }

  Future<void> _onUndoLastBallEvent(
    UndoLastBallEvent event,
    Emitter<AppState> emit,
  ) async {
    try {
      if (state.currentMatch == null) return;

      final updatedMatch = state.currentMatch!.undoLastBallEvent();

      emit(state.copyWith(currentMatch: updatedMatch));
    } catch (e) {
      emit(state.copyWith(errorMessage: 'Failed to undo ball event: $e'));
    }
  }

  Future<void> _onCompleteMatch(
    CompleteMatch event,
    Emitter<AppState> emit,
  ) async {
    try {
      if (state.currentMatch == null) return;

      emit(state.copyWith(isLoading: true));

      final completedMatch = state.currentMatch!.completeMatch(
        winnerTeamId: event.winnerTeamId,
        winReason: event.winReason,
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

  Future<void> _onSwapBatsmen(SwapBatsmen event, Emitter<AppState> emit) async {
    // TODO: Implement batsmen swapping logic
  }

  Future<void> _onRetireBatsman(
    RetireBatsman event,
    Emitter<AppState> emit,
  ) async {
    // TODO: Implement batsman retirement logic
  }

  Future<void> _onLoadPlayerStats(
    LoadPlayerStats event,
    Emitter<AppState> emit,
  ) async {
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

  Future<void> _onUpdatePlayerStats(
    UpdatePlayerStats event,
    Emitter<AppState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));

      final updatedStats = state.playerStats.map((stats) {
        return stats.playerId == event.playerId ? event.stats : stats;
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

  Future<void> _onClearError(ClearError event, Emitter<AppState> emit) async {
    emit(state.copyWith(errorMessage: null));
  }

  Future<void> _onClearSuccess(
    ClearSuccess event,
    Emitter<AppState> emit,
  ) async {
    emit(state.copyWith(successMessage: null));
  }

  Future<void> _onSetLoading(SetLoading event, Emitter<AppState> emit) async {
    emit(state.copyWith(isLoading: event.isLoading));
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
