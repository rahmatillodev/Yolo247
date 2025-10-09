import 'package:dartz/dartz.dart';
import '../entities/match_history_entity.dart';

abstract class MatchHistoryRepository {
  Future<Either<String, List<MatchHistoryEntity>>> getMatchHistory({
    int offset = 0,
  });
}
