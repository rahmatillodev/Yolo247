part of 'match_history_bloc.dart';

@freezed
class MatchHistoryState with _$MatchHistoryState {
  const factory MatchHistoryState.initial() = _Initial;
  const factory MatchHistoryState.loading() = _Loading;
  const factory MatchHistoryState.loaded(List<MatchHistoryEntity> matches) =
      _Loaded;
  const factory MatchHistoryState.error(String message) = _Error;
}
