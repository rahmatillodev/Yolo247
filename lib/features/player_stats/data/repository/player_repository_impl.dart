import '../../domain/entities/player_entity.dart';
import '../datasources/player_data_source.dart';

abstract class PlayerRepository {
  Future<List<PlayerEntity>> getAllPlayers();
  Future<PlayerEntity> getPlayerInfo(String playerId);
}

class PlayerRepositoryImpl implements PlayerRepository {
  final PlayerDataSource _dataSource;

  PlayerRepositoryImpl({required PlayerDataSource dataSource})
    : _dataSource = dataSource;

  @override
  Future<List<PlayerEntity>> getAllPlayers() async {
    try {
      final players = await _dataSource.getAllPlayers();
      return players.map((player) => player.toEntity()).toList();
    } catch (e) {
      throw Exception('Failed to get players: $e');
    }
  }

  @override
  Future<PlayerEntity> getPlayerInfo(String playerId) async {
    try {
      final playerInfo = await _dataSource.getPlayerInfo(playerId);
      return playerInfo.toEntity();
    } catch (e) {
      throw Exception('Failed to get player info: $e');
    }
  }
}
