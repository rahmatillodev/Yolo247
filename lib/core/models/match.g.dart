// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Match _$MatchFromJson(Map<String, dynamic> json) => Match(
  id: json['id'] as String,
  battingTeamId: json['battingTeamId'] as String,
  bowlingTeamId: json['bowlingTeamId'] as String,
  teamA: json['teamA'] as String,
  teamB: json['teamB'] as String,
  bowlingTeamName: json['bowlingTeamName'] as String,
  totalOvers: (json['totalOvers'] as num).toInt(),
  status: json['status'] as String,
  startTime: DateTime.parse(json['startTime'] as String),
  endTime: json['endTime'] == null
      ? null
      : DateTime.parse(json['endTime'] as String),
  battingTeamScore: MatchScore.fromJson(
    json['battingTeamScore'] as Map<String, dynamic>,
  ),
  bowlingTeamScore: MatchScore.fromJson(
    json['bowlingTeamScore'] as Map<String, dynamic>,
  ),
  ballEvents: (json['ballEvents'] as List<dynamic>)
      .map((e) => BallEvent.fromJson(e as Map<String, dynamic>))
      .toList(),
  winnerTeamId: json['winnerTeamId'] as String?,
  winReason: json['winReason'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$MatchToJson(Match instance) => <String, dynamic>{
  'id': instance.id,
  'battingTeamId': instance.battingTeamId,
  'bowlingTeamId': instance.bowlingTeamId,
  'teamA': instance.teamA,
  'teamB': instance.teamB,
  'bowlingTeamName': instance.bowlingTeamName,
  'totalOvers': instance.totalOvers,
  'status': instance.status,
  'startTime': instance.startTime.toIso8601String(),
  'endTime': instance.endTime?.toIso8601String(),
  'battingTeamScore': instance.battingTeamScore,
  'bowlingTeamScore': instance.bowlingTeamScore,
  'ballEvents': instance.ballEvents,
  'winnerTeamId': instance.winnerTeamId,
  'winReason': instance.winReason,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
};

MatchScore _$MatchScoreFromJson(Map<String, dynamic> json) => MatchScore(
  runs: (json['runs'] as num).toInt(),
  wickets: (json['wickets'] as num).toInt(),
  overs: (json['overs'] as num).toDouble(),
  extras: (json['extras'] as num).toInt(),
  runRate: (json['runRate'] as num).toDouble(),
);

Map<String, dynamic> _$MatchScoreToJson(MatchScore instance) =>
    <String, dynamic>{
      'runs': instance.runs,
      'wickets': instance.wickets,
      'overs': instance.overs,
      'extras': instance.extras,
      'runRate': instance.runRate,
    };

BallEvent _$BallEventFromJson(Map<String, dynamic> json) => BallEvent(
  id: json['id'] as String,
  ballNumber: (json['ballNumber'] as num).toInt(),
  runs: (json['runs'] as num).toInt(),
  ballType: json['ballType'] as String,
  batsmanId: json['batsmanId'] as String?,
  bowlerId: json['bowlerId'] as String?,
  isWicket: json['isWicket'] as bool,
  wicketType: json['wicketType'] as String?,
  timestamp: DateTime.parse(json['timestamp'] as String),
);

Map<String, dynamic> _$BallEventToJson(BallEvent instance) => <String, dynamic>{
  'id': instance.id,
  'ballNumber': instance.ballNumber,
  'runs': instance.runs,
  'ballType': instance.ballType,
  'batsmanId': instance.batsmanId,
  'bowlerId': instance.bowlerId,
  'isWicket': instance.isWicket,
  'wicketType': instance.wicketType,
  'timestamp': instance.timestamp.toIso8601String(),
};
