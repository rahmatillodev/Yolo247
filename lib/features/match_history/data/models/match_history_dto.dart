import 'package:json_annotation/json_annotation.dart';

part 'match_history_dto.g.dart';

@JsonSerializable()
class MatchHistoryResponseDto {
  final String apikey;
  final List<MatchHistoryDto> data;
  final String status;
  final MatchHistoryInfoDto info;

  const MatchHistoryResponseDto({
    required this.apikey,
    required this.data,
    required this.status,
    required this.info,
  });

  factory MatchHistoryResponseDto.fromJson(Map<String, dynamic> json) =>
      _$MatchHistoryResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MatchHistoryResponseDtoToJson(this);
}

@JsonSerializable()
class MatchHistoryDto {
  final String id;
  final String name;
  final String matchType;
  final String status;
  final String venue;
  final String date;
  @JsonKey(name: 'dateTimeGMT')
  final String dateTimeGMT;
  final List<String> teams;
  @JsonKey(name: 'teamInfo')
  final List<TeamInfoDto> teamInfo;
  @JsonKey(name: 'series_id')
  final String seriesId;
  @JsonKey(name: 'fantasyEnabled')
  final bool fantasyEnabled;
  @JsonKey(name: 'bbbEnabled')
  final bool bbbEnabled;
  @JsonKey(name: 'hasSquad')
  final bool hasSquad;
  @JsonKey(name: 'matchStarted')
  final bool matchStarted;
  @JsonKey(name: 'matchEnded')
  final bool matchEnded;
  final List<ScoreDto>? score;
  @JsonKey(name: 'tossWinner')
  final String? tossWinner;
  @JsonKey(name: 'tossChoice')
  final String? tossChoice;
  @JsonKey(name: 'matchWinner')
  final String? matchWinner;

  const MatchHistoryDto({
    required this.id,
    required this.name,
    required this.matchType,
    required this.status,
    required this.venue,
    required this.date,
    required this.dateTimeGMT,
    required this.teams,
    required this.teamInfo,
    required this.seriesId,
    required this.fantasyEnabled,
    required this.bbbEnabled,
    required this.hasSquad,
    required this.matchStarted,
    required this.matchEnded,
    this.score,
    this.tossWinner,
    this.tossChoice,
    this.matchWinner,
  });

  factory MatchHistoryDto.fromJson(Map<String, dynamic> json) =>
      _$MatchHistoryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MatchHistoryDtoToJson(this);
}

@JsonSerializable()
class TeamInfoDto {
  final String name;
  final String shortname;
  final String img;

  const TeamInfoDto({
    required this.name,
    required this.shortname,
    required this.img,
  });

  factory TeamInfoDto.fromJson(Map<String, dynamic> json) =>
      _$TeamInfoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TeamInfoDtoToJson(this);
}

@JsonSerializable()
class ScoreDto {
  final int r;
  final int w;
  final double o;
  final String inning;

  const ScoreDto({
    required this.r,
    required this.w,
    required this.o,
    required this.inning,
  });

  factory ScoreDto.fromJson(Map<String, dynamic> json) =>
      _$ScoreDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ScoreDtoToJson(this);
}

@JsonSerializable()
class MatchHistoryInfoDto {
  @JsonKey(name: 'hitsToday')
  final int hitsToday;
  @JsonKey(name: 'hitsUsed')
  final int hitsUsed;
  @JsonKey(name: 'hitsLimit')
  final int hitsLimit;
  final int credits;
  final int server;
  @JsonKey(name: 'offsetRows')
  final int offsetRows;
  @JsonKey(name: 'totalRows')
  final int totalRows;
  @JsonKey(name: 'queryTime')
  final double queryTime;
  final int s;
  final int cache;

  const MatchHistoryInfoDto({
    required this.hitsToday,
    required this.hitsUsed,
    required this.hitsLimit,
    required this.credits,
    required this.server,
    required this.offsetRows,
    required this.totalRows,
    required this.queryTime,
    required this.s,
    required this.cache,
  });

  factory MatchHistoryInfoDto.fromJson(Map<String, dynamic> json) =>
      _$MatchHistoryInfoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MatchHistoryInfoDtoToJson(this);
}
