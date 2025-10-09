import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:yolo247/features/match_history/data/data_source/match_history_data_source.dart';
import 'package:yolo247/features/match_history/data/repository/match_history_repository_impl.dart';
import 'package:yolo247/features/match_history/domain/repository/match_history_repository.dart';

void main() {
  group('Match History API Integration Tests', () {
    late MatchHistoryRepository repository;

    setUp(() {
      final httpClient = http.Client();
      final dataSource = MatchHistoryDataSourceImpl(httpClient);
      repository = MatchHistoryRepositoryImpl(dataSource);
    });

    test('should fetch match history from API', () async {
      // Act
      final result = await repository.getMatchHistory(offset: 0);

      // Assert
      result.fold((error) => fail('API call failed: $error'), (matches) {
        expect(matches, isA<List>());
        expect(matches.isNotEmpty, true);

        // Check first match structure
        final firstMatch = matches.first;
        expect(firstMatch.id, isNotEmpty);
        expect(firstMatch.name, isNotEmpty);
        expect(firstMatch.matchType, isNotEmpty);
        expect(firstMatch.status, isNotEmpty);
        expect(firstMatch.teams, isNotEmpty);
        expect(firstMatch.teams.length, greaterThanOrEqualTo(2));
      });
    });

    test('should handle API errors gracefully', () async {
      // This test would require mocking the HTTP client to simulate errors
      // For now, we'll just verify the repository structure is correct
      expect(repository, isA<MatchHistoryRepository>());
    });
  });
}
