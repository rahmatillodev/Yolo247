import 'package:equatable/equatable.dart';

class PlayerEntity extends Equatable {
  final String id;
  final String name;
  final String country;
  final String? dateOfBirth;
  final String? role;
  final String? battingStyle;
  final String? bowlingStyle;
  final String? placeOfBirth;
  final String? playerImg;
  final List<PlayerStatEntity> stats;

  const PlayerEntity({
    required this.id,
    required this.name,
    required this.country,
    this.dateOfBirth,
    this.role,
    this.battingStyle,
    this.bowlingStyle,
    this.placeOfBirth,
    this.playerImg,
    required this.stats,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    country,
    dateOfBirth,
    role,
    battingStyle,
    bowlingStyle,
    placeOfBirth,
    playerImg,
    stats,
  ];
}

class PlayerStatEntity extends Equatable {
  final String function;
  final String matchType;
  final String stat;
  final String value;

  const PlayerStatEntity({
    required this.function,
    required this.matchType,
    required this.stat,
    required this.value,
  });

  @override
  List<Object?> get props => [function, matchType, stat, value];
}
