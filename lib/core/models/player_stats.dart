import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'player_stats.g.dart';

@JsonSerializable()
class PlayerStats extends Equatable {
  final String playerId;
  final int totalMatches;
  final int totalRuns;
  final int totalBalls;
  final int totalFours;
  final int totalSixes;
  final int totalWickets;
  final int totalOvers;
  final int totalRunsConceded;
  final double averageRuns;
  final double strikeRate;
  final double economyRate;
  final int bestRuns;
  final int bestWickets;
  final DateTime lastUpdated;

  const PlayerStats({
    required this.playerId,
    required this.totalMatches,
    required this.totalRuns,
    required this.totalBalls,
    required this.totalFours,
    required this.totalSixes,
    required this.totalWickets,
    required this.totalOvers,
    required this.totalRunsConceded,
    required this.averageRuns,
    required this.strikeRate,
    required this.economyRate,
    required this.bestRuns,
    required this.bestWickets,
    required this.lastUpdated,
  });

  factory PlayerStats.create(String playerId) {
    return PlayerStats(
      playerId: playerId,
      totalMatches: 0,
      totalRuns: 0,
      totalBalls: 0,
      totalFours: 0,
      totalSixes: 0,
      totalWickets: 0,
      totalOvers: 0,
      totalRunsConceded: 0,
      averageRuns: 0.0,
      strikeRate: 0.0,
      economyRate: 0.0,
      bestRuns: 0,
      bestWickets: 0,
      lastUpdated: DateTime.now(),
    );
  }

  factory PlayerStats.fromJson(Map<String, dynamic> json) =>
      _$PlayerStatsFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerStatsToJson(this);

  PlayerStats copyWith({
    String? playerId,
    int? totalMatches,
    int? totalRuns,
    int? totalBalls,
    int? totalFours,
    int? totalSixes,
    int? totalWickets,
    int? totalOvers,
    int? totalRunsConceded,
    double? averageRuns,
    double? strikeRate,
    double? economyRate,
    int? bestRuns,
    int? bestWickets,
    DateTime? lastUpdated,
  }) {
    return PlayerStats(
      playerId: playerId ?? this.playerId,
      totalMatches: totalMatches ?? this.totalMatches,
      totalRuns: totalRuns ?? this.totalRuns,
      totalBalls: totalBalls ?? this.totalBalls,
      totalFours: totalFours ?? this.totalFours,
      totalSixes: totalSixes ?? this.totalSixes,
      totalWickets: totalWickets ?? this.totalWickets,
      totalOvers: totalOvers ?? this.totalOvers,
      totalRunsConceded: totalRunsConceded ?? this.totalRunsConceded,
      averageRuns: averageRuns ?? this.averageRuns,
      strikeRate: strikeRate ?? this.strikeRate,
      economyRate: economyRate ?? this.economyRate,
      bestRuns: bestRuns ?? this.bestRuns,
      bestWickets: bestWickets ?? this.bestWickets,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }

  @override
  List<Object?> get props => [
    playerId,
    totalMatches,
    totalRuns,
    totalBalls,
    totalFours,
    totalSixes,
    totalWickets,
    totalOvers,
    totalRunsConceded,
    averageRuns,
    strikeRate,
    economyRate,
    bestRuns,
    bestWickets,
    lastUpdated,
  ];
}
