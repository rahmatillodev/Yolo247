import '../../domain/entities/match_history_entity.dart';

class MockMatchHistoryService {
  static List<MatchHistoryEntity> getMockMatchHistory() {
    return [
      MatchHistoryEntity(
        id: "1",
        name: "India vs Australia, 1st T20I",
        matchType: "t20",
        status: "India won by 15 runs",
        venue: "Melbourne Cricket Ground",
        date: "2025-10-04",
        dateTimeGMT: "2025-10-04T19:30:00",
        teams: ["India", "Australia"],
        teamInfo: [
          TeamInfoEntity(
            name: "India",
            shortname: "IND",
            img: "https://example.com/india.png",
          ),
          TeamInfoEntity(
            name: "Australia",
            shortname: "AUS",
            img: "https://example.com/australia.png",
          ),
        ],
        seriesId: "series-1",
        fantasyEnabled: true,
        bbbEnabled: true,
        hasSquad: true,
        matchStarted: true,
        matchEnded: true,
        score: [
          ScoreEntity(
            runs: 180,
            wickets: 5,
            overs: 20.0,
            inning: "India Inning 1",
          ),
          ScoreEntity(
            runs: 165,
            wickets: 8,
            overs: 20.0,
            inning: "Australia Inning 1",
          ),
        ],
        tossWinner: "India",
        tossChoice: "bat",
        matchWinner: "India",
      ),
      MatchHistoryEntity(
        id: "2",
        name: "Australia vs England, 2nd T20I",
        matchType: "t20",
        status: "Australia won by 10 wickets",
        venue: "Sydney Cricket Ground",
        date: "2025-07-05",
        dateTimeGMT: "2025-07-05T14:00:00",
        teams: ["Australia", "England"],
        teamInfo: [
          TeamInfoEntity(
            name: "Australia",
            shortname: "AUS",
            img: "https://example.com/australia.png",
          ),
          TeamInfoEntity(
            name: "England",
            shortname: "ENG",
            img: "https://example.com/england.png",
          ),
        ],
        seriesId: "series-2",
        fantasyEnabled: true,
        bbbEnabled: true,
        hasSquad: true,
        matchStarted: true,
        matchEnded: true,
        score: [
          ScoreEntity(
            runs: 200,
            wickets: 0,
            overs: 20.0,
            inning: "Australia Inning 1",
          ),
          ScoreEntity(
            runs: 190,
            wickets: 10,
            overs: 20.0,
            inning: "England Inning 1",
          ),
        ],
        tossWinner: "Australia",
        tossChoice: "bat",
        matchWinner: "Australia",
      ),
    ];
  }
}
