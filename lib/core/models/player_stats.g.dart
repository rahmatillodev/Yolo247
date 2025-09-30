// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayerStats _$PlayerStatsFromJson(Map<String, dynamic> json) => PlayerStats(
  playerId: json['playerId'] as String,
  totalMatches: (json['totalMatches'] as num).toInt(),
  totalRuns: (json['totalRuns'] as num).toInt(),
  totalBalls: (json['totalBalls'] as num).toInt(),
  totalFours: (json['totalFours'] as num).toInt(),
  totalSixes: (json['totalSixes'] as num).toInt(),
  totalWickets: (json['totalWickets'] as num).toInt(),
  totalOvers: (json['totalOvers'] as num).toInt(),
  totalRunsConceded: (json['totalRunsConceded'] as num).toInt(),
  averageRuns: (json['averageRuns'] as num).toDouble(),
  strikeRate: (json['strikeRate'] as num).toDouble(),
  economyRate: (json['economyRate'] as num).toDouble(),
  bestRuns: (json['bestRuns'] as num).toInt(),
  bestWickets: (json['bestWickets'] as num).toInt(),
  lastUpdated: DateTime.parse(json['lastUpdated'] as String),
);

Map<String, dynamic> _$PlayerStatsToJson(PlayerStats instance) =>
    <String, dynamic>{
      'playerId': instance.playerId,
      'totalMatches': instance.totalMatches,
      'totalRuns': instance.totalRuns,
      'totalBalls': instance.totalBalls,
      'totalFours': instance.totalFours,
      'totalSixes': instance.totalSixes,
      'totalWickets': instance.totalWickets,
      'totalOvers': instance.totalOvers,
      'totalRunsConceded': instance.totalRunsConceded,
      'averageRuns': instance.averageRuns,
      'strikeRate': instance.strikeRate,
      'economyRate': instance.economyRate,
      'bestRuns': instance.bestRuns,
      'bestWickets': instance.bestWickets,
      'lastUpdated': instance.lastUpdated.toIso8601String(),
    };
