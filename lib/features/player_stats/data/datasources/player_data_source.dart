import 'package:dio/dio.dart';

import '../models/player_dto.dart';

abstract class PlayerDataSource {
  Future<List<PlayerDto>> getAllPlayers();
  Future<PlayerInfoDto> getPlayerInfo(String playerId);
}

class PlayerDataSourceImpl implements PlayerDataSource {
  final Dio _dio;
  static const String _baseUrl = 'https://api.cricapi.com/v1';
  static const String _apiKey = '80a0e6bc-c7d4-41f2-bde0-71e5e040ce13';

  PlayerDataSourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<List<PlayerDto>> getAllPlayers() async {
    try {
      final response = await _dio.get(
        '$_baseUrl/players',
        queryParameters: {'apikey': _apiKey, 'offset': 0},
      );

      if (response.statusCode == 200) {
        final playerResponse = PlayerResponseDto.fromJson(response.data);
        return playerResponse.data;
      } else {
        throw Exception('Failed to load players: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load players: $e');
    }
  }

  @override
  Future<PlayerInfoDto> getPlayerInfo(String playerId) async {
    try {
      final response = await _dio.get(
        '$_baseUrl/players_info',
        queryParameters: {'apikey': _apiKey, 'offset': 0, 'id': playerId},
      );

      if (response.statusCode == 200) {
        final playerInfoResponse = PlayerInfoResponseDto.fromJson(
          response.data,
        );
        return playerInfoResponse.data;
      } else {
        throw Exception('Failed to load player info: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load player info: $e');
    }
  }
}
