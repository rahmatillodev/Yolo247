class MatchHistoryModel {
  final String teamA;
  final String teamB;
  final String date;
  final String time;
  final String result;
  final String scoreA;
  final String scoreB;
  final List<Map<String, dynamic>>? battingA;
  final List<Map<String, dynamic>>? battingB;
  final List<Map<String, dynamic>>? bowlingA;
  final List<Map<String, dynamic>>? bowlingB;
  final dynamic teamAFlag;
  final dynamic teamBFlag;

  MatchHistoryModel({
    required this.teamA,
    required this.teamB,
    required this.date,
    required this.time,
    required this.result,
    required this.scoreA,
    required this.scoreB,
    this.battingA,
    this.battingB,
    this.bowlingA,
    this.bowlingB,
    this.teamAFlag,
    this.teamBFlag,
  });

  factory MatchHistoryModel.fromMap(Map<String, dynamic> map) {
    return MatchHistoryModel(
      teamA: map['teamA'] ?? '',
      teamB: map['teamB'] ?? '',
      date: map['date'] ?? '',
      time: map['time'] ?? '',
      result: map['result'] ?? '',
      scoreA: map['scoreA']?.toString() ?? '',
      scoreB: map['scoreB']?.toString() ?? '',
      battingA: (map['battingA'] as List?)?.map((e) => Map<String, dynamic>.from(e)).toList(),
      battingB: (map['battingB'] as List?)?.map((e) => Map<String, dynamic>.from(e)).toList(),
      bowlingA: (map['bowlingA'] as List?)?.map((e) => Map<String, dynamic>.from(e)).toList(),
      bowlingB: (map['bowlingB'] as List?)?.map((e) => Map<String, dynamic>.from(e)).toList(),
      teamAFlag: map['teamAFlag'],
      teamBFlag: map['teamBFlag'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'teamA': teamA,
      'teamB': teamB,
      'date': date,
      'time': time,
      'result': result,
      'scoreA': scoreA,
      'scoreB': scoreB,
      'battingA': battingA,
      'battingB': battingB,
      'bowlingA': bowlingA,
      'bowlingB': bowlingB,
      'teamAFlag': teamAFlag,
      'teamBFlag': teamBFlag,
    };
  }
}
