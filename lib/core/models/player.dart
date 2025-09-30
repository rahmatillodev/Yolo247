import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'player.g.dart';

@JsonSerializable()
class Player extends Equatable {
  final String id;
  final String name;
  final String role;
  final String teamId;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Player({
    required this.id,
    required this.name,
    required this.role,
    required this.teamId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Player.create({
    required String name,
    required String role,
    required String teamId,
  }) {
    final now = DateTime.now();
    return Player(
      id: const Uuid().v4(),
      name: name,
      role: role,
      teamId: teamId,
      createdAt: now,
      updatedAt: now,
    );
  }

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerToJson(this);

  Player copyWith({
    String? id,
    String? name,
    String? role,
    String? teamId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Player(
      id: id ?? this.id,
      name: name ?? this.name,
      role: role ?? this.role,
      teamId: teamId ?? this.teamId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [id, name, role, teamId, createdAt, updatedAt];
}
