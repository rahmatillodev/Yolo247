import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'match.g.dart';

@JsonSerializable()
class Match extends Equatable {
  final String id;
  final String battingTeamId;
  final String bowlingTeamId;
  final String teamA;
  final String teamB;
  final String bowlingTeamName;
  final int totalOvers;
  final String status;
  final DateTime startTime;
  final DateTime? endTime;
  final MatchScore battingTeamScore;
  final MatchScore bowlingTeamScore;
  final List<BallEvent> ballEvents;
  final String? winnerTeamId;
  final String? winReason;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Match({
    required this.id,
    required this.battingTeamId,
    required this.bowlingTeamId,
    required this.teamA,
    required this.teamB,
    required this.bowlingTeamName,
    required this.totalOvers,
    required this.status,
    required this.startTime,
    this.endTime,
    required this.battingTeamScore,
    required this.bowlingTeamScore,
    required this.ballEvents,
    this.winnerTeamId,
    this.winReason,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Match.create({
    required String battingTeamId,
    required String bowlingTeamId,
    required String teamA,
    required String teamB,
    required String bowlingTeamName,
    required int totalOvers,
  }) {
    final now = DateTime.now();
    return Match(
      id: const Uuid().v4(),
      battingTeamId: battingTeamId,
      bowlingTeamId: bowlingTeamId,
      teamA: teamA,
      teamB: teamB,
      bowlingTeamName: bowlingTeamName,
      totalOvers: totalOvers,
      status: 'in_progress',
      startTime: now,
      battingTeamScore: MatchScore.create(),
      bowlingTeamScore: MatchScore.create(),
      ballEvents: [],
      createdAt: now,
      updatedAt: now,
    );
  }

  factory Match.fromJson(Map<String, dynamic> json) => _$MatchFromJson(json);

  Map<String, dynamic> toJson() => _$MatchToJson(this);

  Match copyWith({
    String? id,
    String? battingTeamId,
    String? bowlingTeamId,
    String? teamA,
    String? teamB,
    String? bowlingTeamName,
    int? totalOvers,
    String? status,
    DateTime? startTime,
    DateTime? endTime,
    MatchScore? battingTeamScore,
    MatchScore? bowlingTeamScore,
    List<BallEvent>? ballEvents,
    String? winnerTeamId,
    String? winReason,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Match(
      id: id ?? this.id,
      battingTeamId: battingTeamId ?? this.battingTeamId,
      bowlingTeamId: bowlingTeamId ?? this.bowlingTeamId,
      teamA: teamA ?? this.teamA,
      teamB: teamB ?? this.teamB,
      bowlingTeamName: bowlingTeamName ?? this.bowlingTeamName,
      totalOvers: totalOvers ?? this.totalOvers,
      status: status ?? this.status,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      battingTeamScore: battingTeamScore ?? this.battingTeamScore,
      bowlingTeamScore: bowlingTeamScore ?? this.bowlingTeamScore,
      ballEvents: ballEvents ?? this.ballEvents,
      winnerTeamId: winnerTeamId ?? this.winnerTeamId,
      winReason: winReason ?? this.winReason,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  bool get isCompleted => status == 'completed';
  bool get isInProgress => status == 'in_progress';

  Match addBallEvent(BallEvent ballEvent) {
    final updatedBallEvents = [...ballEvents, ballEvent];
    final updatedBattingScore = _updateScoreFromBallEvent(ballEvent);

    return copyWith(
      ballEvents: updatedBallEvents,
      battingTeamScore: updatedBattingScore,
      updatedAt: DateTime.now(),
    );
  }

  Match undoLastBallEvent() {
    if (ballEvents.isEmpty) return this;

    final updatedBallEvents = ballEvents.sublist(0, ballEvents.length - 1);
    final updatedBattingScore = _recalculateScore(updatedBallEvents);

    return copyWith(
      ballEvents: updatedBallEvents,
      battingTeamScore: updatedBattingScore,
      updatedAt: DateTime.now(),
    );
  }

  Match completeMatch({
    required String winnerTeamId,
    required String winReason,
  }) {
    return copyWith(
      status: 'completed',
      endTime: DateTime.now(),
      winnerTeamId: winnerTeamId,
      winReason: winReason,
      updatedAt: DateTime.now(),
    );
  }

  MatchScore _updateScoreFromBallEvent(BallEvent ballEvent) {
    int newRuns = battingTeamScore.runs + ballEvent.runs;
    int newWickets = ballEvent.isWicket
        ? battingTeamScore.wickets + 1
        : battingTeamScore.wickets;
    double newOvers = _calculateOvers(ballEvents.length + 1);
    int newExtras =
        ballEvent.ballType == 'wide' || ballEvent.ballType == 'no_ball'
        ? battingTeamScore.extras + 1
        : battingTeamScore.extras;
    double newRunRate = newOvers > 0 ? newRuns / newOvers : 0.0;

    return MatchScore(
      runs: newRuns,
      wickets: newWickets,
      overs: newOvers,
      extras: newExtras,
      runRate: newRunRate,
    );
  }

  MatchScore _recalculateScore(List<BallEvent> events) {
    int totalRuns = 0;
    int totalWickets = 0;
    int totalExtras = 0;

    for (final event in events) {
      totalRuns += event.runs;
      if (event.isWicket) totalWickets++;
      if (event.ballType == 'wide' || event.ballType == 'no_ball') {
        totalExtras++;
      }
    }

    double overs = _calculateOvers(events.length);
    double runRate = overs > 0 ? totalRuns / overs : 0.0;

    return MatchScore(
      runs: totalRuns,
      wickets: totalWickets,
      overs: overs,
      extras: totalExtras,
      runRate: runRate,
    );
  }

  double _calculateOvers(int ballCount) {
    return ballCount / 6.0;
  }

  @override
  List<Object?> get props => [
    id,
    battingTeamId,
    bowlingTeamId,
    teamA,
    teamB,
    bowlingTeamName,
    totalOvers,
    status,
    startTime,
    endTime,
    battingTeamScore,
    bowlingTeamScore,
    ballEvents,
    winnerTeamId,
    winReason,
    createdAt,
    updatedAt,
  ];
}

@JsonSerializable()
class MatchScore extends Equatable {
  final int runs;
  final int wickets;
  final double overs;
  final int extras;
  final double runRate;

  const MatchScore({
    required this.runs,
    required this.wickets,
    required this.overs,
    required this.extras,
    required this.runRate,
  });

  factory MatchScore.create() {
    return const MatchScore(
      runs: 0,
      wickets: 0,
      overs: 0.0,
      extras: 0,
      runRate: 0.0,
    );
  }

  factory MatchScore.fromJson(Map<String, dynamic> json) =>
      _$MatchScoreFromJson(json);

  Map<String, dynamic> toJson() => _$MatchScoreToJson(this);

  MatchScore copyWith({
    int? runs,
    int? wickets,
    double? overs,
    int? extras,
    double? runRate,
  }) {
    return MatchScore(
      runs: runs ?? this.runs,
      wickets: wickets ?? this.wickets,
      overs: overs ?? this.overs,
      extras: extras ?? this.extras,
      runRate: runRate ?? this.runRate,
    );
  }

  @override
  List<Object?> get props => [runs, wickets, overs, extras, runRate];
}

@JsonSerializable()
class BallEvent extends Equatable {
  final String id;
  final int ballNumber;
  final int runs;
  final String ballType;
  final String? batsmanId;
  final String? bowlerId;
  final bool isWicket;
  final String? wicketType;
  final DateTime timestamp;

  const BallEvent({
    required this.id,
    required this.ballNumber,
    required this.runs,
    required this.ballType,
    this.batsmanId,
    this.bowlerId,
    required this.isWicket,
    this.wicketType,
    required this.timestamp,
  });

  factory BallEvent.create({
    required int ballNumber,
    required int runs,
    required String ballType,
    String? batsmanId,
    String? bowlerId,
    bool isWicket = false,
    String? wicketType,
  }) {
    return BallEvent(
      id: const Uuid().v4(),
      ballNumber: ballNumber,
      runs: runs,
      ballType: ballType,
      batsmanId: batsmanId,
      bowlerId: bowlerId,
      isWicket: isWicket,
      wicketType: wicketType,
      timestamp: DateTime.now(),
    );
  }

  factory BallEvent.fromJson(Map<String, dynamic> json) =>
      _$BallEventFromJson(json);

  Map<String, dynamic> toJson() => _$BallEventToJson(this);

  @override
  List<Object?> get props => [
    id,
    ballNumber,
    runs,
    ballType,
    batsmanId,
    bowlerId,
    isWicket,
    wicketType,
    timestamp,
  ];
}
