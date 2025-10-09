import '../models/player_dto.dart';
import 'player_data_source.dart';

class MockPlayerDataSource implements PlayerDataSource {
  @override
  Future<List<PlayerDto>> getAllPlayers() async {
    // Simulate API delay
    await Future.delayed(const Duration(seconds: 1));

    return [
      const PlayerDto(id: "1", name: "Virat Kohli", country: "India"),
      const PlayerDto(id: "2", name: "Rohit Sharma", country: "India"),
      const PlayerDto(id: "3", name: "Steve Smith", country: "Australia"),
      const PlayerDto(id: "4", name: "Joe Root", country: "England"),
      const PlayerDto(id: "5", name: "Babar Azam", country: "Pakistan"),
    ];
  }

  @override
  Future<PlayerInfoDto> getPlayerInfo(String playerId) async {
    // Simulate API delay
    await Future.delayed(const Duration(seconds: 1));

    // Mock player info based on playerId
    switch (playerId) {
      case "1":
        return PlayerInfoDto(
          id: "1",
          name: "Virat Kohli",
          country: "India",
          role: "Batsman",
          battingStyle: "Right Handed Bat",
          bowlingStyle: "Right-arm medium",
          placeOfBirth: "Delhi, India",
          playerImg: "https://h.cricapi.com/img/icon512.png",
          stats: const [
            PlayerStatDto(
              fn: "batting",
              matchType: "odi",
              stat: "runs",
              value: "12326",
            ),
            PlayerStatDto(
              fn: "batting",
              matchType: "odi",
              stat: "avg",
              value: "57.38",
            ),
            PlayerStatDto(
              fn: "batting",
              matchType: "odi",
              stat: "sr",
              value: "93.17",
            ),
          ],
        );
      case "2":
        return PlayerInfoDto(
          id: "2",
          name: "Rohit Sharma",
          country: "India",
          role: "Batsman",
          battingStyle: "Right Handed Bat",
          bowlingStyle: "Right-arm offbreak",
          placeOfBirth: "Nagpur, India",
          playerImg: "https://h.cricapi.com/img/icon512.png",
          stats: const [
            PlayerStatDto(
              fn: "batting",
              matchType: "odi",
              stat: "runs",
              value: "9205",
            ),
            PlayerStatDto(
              fn: "batting",
              matchType: "odi",
              stat: "avg",
              value: "48.96",
            ),
            PlayerStatDto(
              fn: "batting",
              matchType: "odi",
              stat: "sr",
              value: "88.92",
            ),
          ],
        );
      default:
        return PlayerInfoDto(
          id: playerId,
          name: "Player Name",
          country: "Country",
          role: "All-rounder",
          battingStyle: "Right Handed Bat",
          bowlingStyle: "Right-arm medium",
          placeOfBirth: "City, Country",
          playerImg: "https://h.cricapi.com/img/icon512.png",
          stats: const [],
        );
    }
  }
}
