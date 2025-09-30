import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'team.g.dart';

@JsonSerializable()
class Team extends Equatable {
  final String id;
  final String name;
  final List<String> playerIds;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Team({
    required this.id,
    required this.name,
    required this.playerIds,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Team.create({required String name, List<String>? playerIds}) {
    final now = DateTime.now();
    return Team(
      id: const Uuid().v4(),
      name: name,
      playerIds: playerIds ?? [],
      createdAt: now,
      updatedAt: now,
    );
  }

  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);

  Map<String, dynamic> toJson() => _$TeamToJson(this);

  Team copyWith({
    String? id,
    String? name,
    List<String>? playerIds,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Team(
      id: id ?? this.id,
      name: name ?? this.name,
      playerIds: playerIds ?? this.playerIds,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Team addPlayer(String playerId) {
    return copyWith(
      playerIds: [...playerIds, playerId],
      updatedAt: DateTime.now(),
    );
  }

  Team removePlayer(String playerId) {
    return copyWith(
      playerIds: playerIds.where((id) => id != playerId).toList(),
      updatedAt: DateTime.now(),
    );
  }

  int get playerCount => playerIds.length;

  @override
  List<Object?> get props => [id, name, playerIds, createdAt, updatedAt];
}
