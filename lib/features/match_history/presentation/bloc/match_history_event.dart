part of 'match_history_bloc.dart';

@freezed
class MatchHistoryEvent with _$MatchHistoryEvent {
  const factory MatchHistoryEvent.loadMatchHistory({@Default(0) int offset}) =
      LoadMatchHistory;

  const factory MatchHistoryEvent.refreshMatchHistory() = RefreshMatchHistory;
}
