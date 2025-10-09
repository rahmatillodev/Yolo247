import 'package:http/http.dart' as http;

import '../../features/match_history/data/data_source/match_history_data_source.dart';
import '../../features/match_history/data/repository/match_history_repository_impl.dart';
import '../../features/match_history/domain/repository/match_history_repository.dart';
import '../../features/match_history/presentation/bloc/match_history_bloc.dart';
import '../../features/player_stats/data/datasources/mock_player_data_source.dart';
import '../../features/player_stats/data/datasources/player_data_source.dart';
import '../../features/player_stats/data/repository/player_repository_impl.dart';
import '../../features/player_stats/presentation/bloc/player_bloc.dart';

class DependencyInjection {
  static MatchHistoryRepository get matchHistoryRepository {
    // Real API integration
    final httpClient = http.Client();
    final dataSource = MatchHistoryDataSourceImpl(httpClient);
    return MatchHistoryRepositoryImpl(dataSource);

    // Mock data (commented out)
    // import '../../features/match_history/data/repository/mock_match_history_repository.dart';
    // return MockMatchHistoryRepository();
  }

  static MatchHistoryBloc get matchHistoryBloc {
    return MatchHistoryBloc(matchHistoryRepository);
  }

  // Player Stats Dependencies
  static PlayerDataSource get playerDataSource {
    // Using mock data for now
    return MockPlayerDataSource();

    // Real API integration (commented out)
    // final dio = Dio();
    // return PlayerDataSourceImpl(dio: dio);
  }

  static PlayerRepository get playerRepository {
    return PlayerRepositoryImpl(dataSource: playerDataSource);
  }

  static PlayerBloc get playerBloc {
    return PlayerBloc(repository: playerRepository);
  }
}
