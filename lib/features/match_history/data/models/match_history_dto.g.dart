// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_history_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchHistoryResponseDto _$MatchHistoryResponseDtoFromJson(
  Map<String, dynamic> json,
) => MatchHistoryResponseDto(
  apikey: json['apikey'] as String,
  data: (json['data'] as List<dynamic>)
      .map((e) => MatchHistoryDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  status: json['status'] as String,
  info: MatchHistoryInfoDto.fromJson(json['info'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MatchHistoryResponseDtoToJson(
  MatchHistoryResponseDto instance,
) => <String, dynamic>{
  'apikey': instance.apikey,
  'data': instance.data,
  'status': instance.status,
  'info': instance.info,
};

MatchHistoryDto _$MatchHistoryDtoFromJson(Map<String, dynamic> json) =>
    MatchHistoryDto(
      id: json['id'] as String,
      name: json['name'] as String,
      matchType: json['matchType'] as String,
      status: json['status'] as String,
      venue: json['venue'] as String,
      date: json['date'] as String,
      dateTimeGMT: json['dateTimeGMT'] as String,
      teams: (json['teams'] as List<dynamic>).map((e) => e as String).toList(),
      teamInfo: (json['teamInfo'] as List<dynamic>)
          .map((e) => TeamInfoDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      seriesId: json['series_id'] as String,
      fantasyEnabled: json['fantasyEnabled'] as bool,
      bbbEnabled: json['bbbEnabled'] as bool,
      hasSquad: json['hasSquad'] as bool,
      matchStarted: json['matchStarted'] as bool,
      matchEnded: json['matchEnded'] as bool,
      score: (json['score'] as List<dynamic>?)
          ?.map((e) => ScoreDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      tossWinner: json['tossWinner'] as String?,
      tossChoice: json['tossChoice'] as String?,
      matchWinner: json['matchWinner'] as String?,
    );

Map<String, dynamic> _$MatchHistoryDtoToJson(MatchHistoryDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'matchType': instance.matchType,
      'status': instance.status,
      'venue': instance.venue,
      'date': instance.date,
      'dateTimeGMT': instance.dateTimeGMT,
      'teams': instance.teams,
      'teamInfo': instance.teamInfo,
      'series_id': instance.seriesId,
      'fantasyEnabled': instance.fantasyEnabled,
      'bbbEnabled': instance.bbbEnabled,
      'hasSquad': instance.hasSquad,
      'matchStarted': instance.matchStarted,
      'matchEnded': instance.matchEnded,
      'score': instance.score,
      'tossWinner': instance.tossWinner,
      'tossChoice': instance.tossChoice,
      'matchWinner': instance.matchWinner,
    };

TeamInfoDto _$TeamInfoDtoFromJson(Map<String, dynamic> json) => TeamInfoDto(
  name: json['name'] as String,
  shortname: json['shortname'] as String,
  img: json['img'] as String,
);

Map<String, dynamic> _$TeamInfoDtoToJson(TeamInfoDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'shortname': instance.shortname,
      'img': instance.img,
    };

ScoreDto _$ScoreDtoFromJson(Map<String, dynamic> json) => ScoreDto(
  r: (json['r'] as num).toInt(),
  w: (json['w'] as num).toInt(),
  o: (json['o'] as num).toDouble(),
  inning: json['inning'] as String,
);

Map<String, dynamic> _$ScoreDtoToJson(ScoreDto instance) => <String, dynamic>{
  'r': instance.r,
  'w': instance.w,
  'o': instance.o,
  'inning': instance.inning,
};

MatchHistoryInfoDto _$MatchHistoryInfoDtoFromJson(Map<String, dynamic> json) =>
    MatchHistoryInfoDto(
      hitsToday: (json['hitsToday'] as num).toInt(),
      hitsUsed: (json['hitsUsed'] as num).toInt(),
      hitsLimit: (json['hitsLimit'] as num).toInt(),
      credits: (json['credits'] as num).toInt(),
      server: (json['server'] as num).toInt(),
      offsetRows: (json['offsetRows'] as num).toInt(),
      totalRows: (json['totalRows'] as num).toInt(),
      queryTime: (json['queryTime'] as num).toDouble(),
      s: (json['s'] as num).toInt(),
      cache: (json['cache'] as num).toInt(),
    );

Map<String, dynamic> _$MatchHistoryInfoDtoToJson(
  MatchHistoryInfoDto instance,
) => <String, dynamic>{
  'hitsToday': instance.hitsToday,
  'hitsUsed': instance.hitsUsed,
  'hitsLimit': instance.hitsLimit,
  'credits': instance.credits,
  'server': instance.server,
  'offsetRows': instance.offsetRows,
  'totalRows': instance.totalRows,
  'queryTime': instance.queryTime,
  's': instance.s,
  'cache': instance.cache,
};
