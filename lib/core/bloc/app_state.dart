import 'package:freezed_annotation/freezed_annotation.dart';
import '../models/team.dart';
import '../models/player.dart';
import '../models/player_stats.dart';
import '../models/match.dart';

part 'app_state.freezed.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({
    @Default([]) List<Team> teams,
    @Default([]) List<Player> players,
    @Default([]) List<Match> matches,
    @Default([]) List<PlayerStats> playerStats,
    @Default(null) Match? currentMatch,
    @Default(false) bool isLoading,
    @Default(null) String? errorMessage,
    @Default(null) String? successMessage,
  }) = _AppState;
}
