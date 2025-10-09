import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/player_entity.dart';

part 'player_dto.g.dart';

@JsonSerializable()
class PlayerResponseDto {
  final String apikey;
  final List<PlayerDto> data;
  final String status;
  final PlayerInfoDto info;

  const PlayerResponseDto({
    required this.apikey,
    required this.data,
    required this.status,
    required this.info,
  });

  factory PlayerResponseDto.fromJson(Map<String, dynamic> json) =>
      _$PlayerResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerResponseDtoToJson(this);
}

@JsonSerializable()
class PlayerDto {
  final String id;
  final String name;
  final String country;

  const PlayerDto({
    required this.id,
    required this.name,
    required this.country,
  });

  factory PlayerDto.fromJson(Map<String, dynamic> json) =>
      _$PlayerDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerDtoToJson(this);

  PlayerEntity toEntity() {
    return PlayerEntity(
      id: id,
      name: name,
      country: country,
      stats: [], // Will be populated from player info API
    );
  }
}

@JsonSerializable()
class PlayerInfoDto {
  final String id;
  final String name;
  @JsonKey(name: 'dateOfBirth')
  final String? dateOfBirth;
  final String? role;
  @JsonKey(name: 'battingStyle')
  final String? battingStyle;
  @JsonKey(name: 'bowlingStyle')
  final String? bowlingStyle;
  @JsonKey(name: 'placeOfBirth')
  final String? placeOfBirth;
  final String country;
  @JsonKey(name: 'playerImg')
  final String? playerImg;
  final List<PlayerStatDto> stats;

  const PlayerInfoDto({
    required this.id,
    required this.name,
    this.dateOfBirth,
    this.role,
    this.battingStyle,
    this.bowlingStyle,
    this.placeOfBirth,
    required this.country,
    this.playerImg,
    required this.stats,
  });

  factory PlayerInfoDto.fromJson(Map<String, dynamic> json) =>
      _$PlayerInfoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerInfoDtoToJson(this);

  PlayerEntity toEntity() {
    return PlayerEntity(
      id: id,
      name: name,
      country: country,
      dateOfBirth: dateOfBirth,
      role: role,
      battingStyle: battingStyle,
      bowlingStyle: bowlingStyle,
      placeOfBirth: placeOfBirth,
      playerImg: playerImg,
      stats: stats.map((stat) => stat.toEntity()).toList(),
    );
  }
}

@JsonSerializable()
class PlayerStatDto {
  final String fn;
  @JsonKey(name: 'matchtype')
  final String matchType;
  final String stat;
  final String value;

  const PlayerStatDto({
    required this.fn,
    required this.matchType,
    required this.stat,
    required this.value,
  });

  factory PlayerStatDto.fromJson(Map<String, dynamic> json) =>
      _$PlayerStatDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerStatDtoToJson(this);

  PlayerStatEntity toEntity() {
    return PlayerStatEntity(
      function: fn,
      matchType: matchType,
      stat: stat,
      value: value,
    );
  }
}

@JsonSerializable()
class PlayerInfoResponseDto {
  final String apikey;
  final PlayerInfoDto data;
  final String status;
  final PlayerInfoDto info;

  const PlayerInfoResponseDto({
    required this.apikey,
    required this.data,
    required this.status,
    required this.info,
  });

  factory PlayerInfoResponseDto.fromJson(Map<String, dynamic> json) =>
      _$PlayerInfoResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerInfoResponseDtoToJson(this);
}
