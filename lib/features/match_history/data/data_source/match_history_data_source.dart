import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/match_history_dto.dart';

abstract class MatchHistoryDataSource {
  Future<MatchHistoryResponseDto> getMatchHistory({int offset = 0});
}

class MatchHistoryDataSourceImpl implements MatchHistoryDataSource {
  final http.Client _client;
  static const String _baseUrl = 'https://api.cricapi.com/v1';
  static const String _apiKey = '80a0e6bc-c7d4-41f2-bde0-71e5e040ce13';

  MatchHistoryDataSourceImpl(this._client);

  @override
  Future<MatchHistoryResponseDto> getMatchHistory({int offset = 0}) async {
    try {
      final uri = Uri.parse('$_baseUrl/matches').replace(
        queryParameters: {'apikey': _apiKey, 'offset': offset.toString()},
      );

      final response = await _client.get(uri);

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body) as Map<String, dynamic>;
        return MatchHistoryResponseDto.fromJson(jsonData);
      } else {
        throw Exception('Failed to load match history: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
}
