import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/match_history_entity.dart';
import '../../domain/repository/match_history_repository.dart';

part 'match_history_bloc.freezed.dart';
part 'match_history_event.dart';
part 'match_history_state.dart';

class MatchHistoryBloc extends Bloc<MatchHistoryEvent, MatchHistoryState> {
  final MatchHistoryRepository _repository;

  MatchHistoryBloc(this._repository)
    : super(const MatchHistoryState.initial()) {
    on<MatchHistoryEvent>((event, emit) async {
      await event.map(
        loadMatchHistory: (event) => _onLoadMatchHistory(event, emit),
        refreshMatchHistory: (event) => _onRefreshMatchHistory(event, emit),
      );
    });
  }

  Future<void> _onLoadMatchHistory(
    LoadMatchHistory event,
    Emitter<MatchHistoryState> emit,
  ) async {
    emit(const MatchHistoryState.loading());

    final result = await _repository.getMatchHistory(offset: event.offset);

    result.fold(
      (error) => emit(MatchHistoryState.error(error)),
      (matches) => emit(MatchHistoryState.loaded(matches)),
    );
  }

  Future<void> _onRefreshMatchHistory(
    RefreshMatchHistory event,
    Emitter<MatchHistoryState> emit,
  ) async {
    emit(const MatchHistoryState.loading());

    final result = await _repository.getMatchHistory(offset: 0);

    result.fold(
      (error) => emit(MatchHistoryState.error(error)),
      (matches) => emit(MatchHistoryState.loaded(matches)),
    );
  }
}
