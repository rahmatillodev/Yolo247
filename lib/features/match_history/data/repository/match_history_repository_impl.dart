import 'package:dartz/dartz.dart';

import '../../domain/entities/match_history_entity.dart';
import '../../domain/repository/match_history_repository.dart';
import '../data_source/match_history_data_source.dart';
import '../models/match_history_dto.dart';

class MatchHistoryRepositoryImpl implements MatchHistoryRepository {
  final MatchHistoryDataSource _dataSource;

  MatchHistoryRepositoryImpl(this._dataSource);

  @override
  Future<Either<String, List<MatchHistoryEntity>>> getMatchHistory({
    int offset = 0,
  }) async {
    try {
      final response = await _dataSource.getMatchHistory(offset: offset);

      if (response.status == 'success') {
        final entities = response.data.map((dto) => dto.toEntity()).toList();
        return Right(entities);
      } else {
        return const Left('Failed to fetch match history');
      }
    } catch (e) {
      return Left('Error: $e');
    }
  }
}

// Extension to convert DTO to Entity
extension MatchHistoryDtoExtension on MatchHistoryDto {
  MatchHistoryEntity toEntity() {
    return MatchHistoryEntity(
      id: this.id,
      name: name,
      matchType: matchType,
      status: status,
      venue: venue,
      date: date,
      dateTimeGMT: dateTimeGMT,
      teams: teams,
      teamInfo: teamInfo.map((team) => team.toEntity()).toList(),
      seriesId: seriesId,
      fantasyEnabled: fantasyEnabled,
      bbbEnabled: bbbEnabled,
      hasSquad: hasSquad,
      matchStarted: matchStarted,
      matchEnded: matchEnded,
      score: score?.map((s) => s.toEntity()).toList(),
      tossWinner: tossWinner,
      tossChoice: tossChoice,
      matchWinner: matchWinner,
    );
  }
}

extension TeamInfoDtoExtension on TeamInfoDto {
  TeamInfoEntity toEntity() {
    return TeamInfoEntity(name: name, shortname: shortname, img: img);
  }
}

extension ScoreDtoExtension on ScoreDto {
  ScoreEntity toEntity() {
    return ScoreEntity(runs: r, wickets: w, overs: o, inning: inning);
  }
}
