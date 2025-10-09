import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repository/player_repository_impl.dart';
import '../../domain/entities/player_entity.dart';

// Events
abstract class PlayerEvent extends Equatable {
  const PlayerEvent();

  @override
  List<Object> get props => [];
}

class LoadPlayers extends PlayerEvent {
  const LoadPlayers();
}

class LoadPlayerInfo extends PlayerEvent {
  final String playerId;

  const LoadPlayerInfo(this.playerId);

  @override
  List<Object> get props => [playerId];
}

// States
abstract class PlayerState extends Equatable {
  const PlayerState();

  @override
  List<Object> get props => [];
}

class PlayerInitial extends PlayerState {}

class PlayerLoading extends PlayerState {}

class PlayerLoaded extends PlayerState {
  final List<PlayerEntity> players;

  const PlayerLoaded(this.players);

  @override
  List<Object> get props => [players];
}

class PlayerInfoLoaded extends PlayerState {
  final PlayerEntity player;

  const PlayerInfoLoaded(this.player);

  @override
  List<Object> get props => [player];
}

class PlayerError extends PlayerState {
  final String message;

  const PlayerError(this.message);

  @override
  List<Object> get props => [message];
}

// Bloc
class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  final PlayerRepository _repository;

  PlayerBloc({required PlayerRepository repository})
    : _repository = repository,
      super(PlayerInitial()) {
    on<LoadPlayers>(_onLoadPlayers);
    on<LoadPlayerInfo>(_onLoadPlayerInfo);
  }

  Future<void> _onLoadPlayers(
    LoadPlayers event,
    Emitter<PlayerState> emit,
  ) async {
    emit(PlayerLoading());
    try {
      final players = await _repository.getAllPlayers();
      emit(PlayerLoaded(players));
    } catch (e) {
      emit(PlayerError(e.toString()));
    }
  }

  Future<void> _onLoadPlayerInfo(
    LoadPlayerInfo event,
    Emitter<PlayerState> emit,
  ) async {
    emit(PlayerLoading());
    try {
      final player = await _repository.getPlayerInfo(event.playerId);
      emit(PlayerInfoLoaded(player));
    } catch (e) {
      emit(PlayerError(e.toString()));
    }
  }
}
