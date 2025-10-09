// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayerResponseDto _$PlayerResponseDtoFromJson(Map<String, dynamic> json) =>
    PlayerResponseDto(
      apikey: json['apikey'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => PlayerDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String,
      info: PlayerInfoDto.fromJson(json['info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlayerResponseDtoToJson(PlayerResponseDto instance) =>
    <String, dynamic>{
      'apikey': instance.apikey,
      'data': instance.data,
      'status': instance.status,
      'info': instance.info,
    };

PlayerDto _$PlayerDtoFromJson(Map<String, dynamic> json) => PlayerDto(
  id: json['id'] as String,
  name: json['name'] as String,
  country: json['country'] as String,
);

Map<String, dynamic> _$PlayerDtoToJson(PlayerDto instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'country': instance.country,
};

PlayerInfoDto _$PlayerInfoDtoFromJson(Map<String, dynamic> json) =>
    PlayerInfoDto(
      id: json['id'] as String,
      name: json['name'] as String,
      dateOfBirth: json['dateOfBirth'] as String?,
      role: json['role'] as String?,
      battingStyle: json['battingStyle'] as String?,
      bowlingStyle: json['bowlingStyle'] as String?,
      placeOfBirth: json['placeOfBirth'] as String?,
      country: json['country'] as String,
      playerImg: json['playerImg'] as String?,
      stats: (json['stats'] as List<dynamic>)
          .map((e) => PlayerStatDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PlayerInfoDtoToJson(PlayerInfoDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'dateOfBirth': instance.dateOfBirth,
      'role': instance.role,
      'battingStyle': instance.battingStyle,
      'bowlingStyle': instance.bowlingStyle,
      'placeOfBirth': instance.placeOfBirth,
      'country': instance.country,
      'playerImg': instance.playerImg,
      'stats': instance.stats,
    };

PlayerStatDto _$PlayerStatDtoFromJson(Map<String, dynamic> json) =>
    PlayerStatDto(
      fn: json['fn'] as String,
      matchType: json['matchtype'] as String,
      stat: json['stat'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$PlayerStatDtoToJson(PlayerStatDto instance) =>
    <String, dynamic>{
      'fn': instance.fn,
      'matchtype': instance.matchType,
      'stat': instance.stat,
      'value': instance.value,
    };

PlayerInfoResponseDto _$PlayerInfoResponseDtoFromJson(
  Map<String, dynamic> json,
) => PlayerInfoResponseDto(
  apikey: json['apikey'] as String,
  data: PlayerInfoDto.fromJson(json['data'] as Map<String, dynamic>),
  status: json['status'] as String,
  info: PlayerInfoDto.fromJson(json['info'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PlayerInfoResponseDtoToJson(
  PlayerInfoResponseDto instance,
) => <String, dynamic>{
  'apikey': instance.apikey,
  'data': instance.data,
  'status': instance.status,
  'info': instance.info,
};
