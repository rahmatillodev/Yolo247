import 'package:dartz/dartz.dart';

import '../../domain/entities/match_history_entity.dart';
import '../../domain/repository/match_history_repository.dart';
import '../mock_data/match_history_mock_data.dart';

class MockMatchHistoryRepository implements MatchHistoryRepository {
  @override
  Future<Either<String, List<MatchHistoryEntity>>> getMatchHistory({
    int offset = 0,
  }) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    try {
      final matches = MockMatchHistoryService.getMockMatchHistory();
      return Right(matches);
    } catch (e) {
      return Left('Mock error: $e');
    }
  }
}
