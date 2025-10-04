import 'package:yolo247/core/assets/assets.gen.dart';
import 'package:yolo247/core/models/match.dart';
import 'package:yolo247/core/models/player.dart';
import 'package:yolo247/core/models/player_stats.dart';
import 'package:yolo247/core/models/team.dart';

class MockData {
  // Mock Teams
  static final List<Team> mockTeams = [
    Team.create(
      name: 'India',
      playerIds: ['player_1', 'player_2', 'player_3', 'player_4', 'player_5'],
    ),
    Team.create(
      name: 'Pakistan',
      playerIds: ['player_6', 'player_7', 'player_8', 'player_9', 'player_10'],
    ),
    Team.create(
      name: 'Australia',
      playerIds: [
        'player_11',
        'player_12',
        'player_13',
        'player_14',
        'player_15',
      ],
    ),
    Team.create(
      name: 'England',
      playerIds: [
        'player_16',
        'player_17',
        'player_18',
        'player_19',
        'player_20',
      ],
    ),
  ];

  // Mock Players
  static final List<Player> mockPlayers = [
    // India Players
    Player.create(name: 'Rohit Sharma', role: 'Batsman', teamId: 'team_1'),
    Player.create(name: 'Virat Kohli', role: 'Batsman', teamId: 'team_1'),
    Player.create(name: 'KL Rahul', role: 'Batsman', teamId: 'team_1'),
    Player.create(name: 'Jasprit Bumrah', role: 'Bowler', teamId: 'team_1'),
    Player.create(
      name: 'Ravindra Jadeja',
      role: 'All-rounder',
      teamId: 'team_1',
    ),

    // Pakistan Players
    Player.create(name: 'Babar Azam', role: 'Batsman', teamId: 'team_2'),
    Player.create(
      name: 'Mohammad Rizwan',
      role: 'Wicket-keeper',
      teamId: 'team_2',
    ),
    Player.create(name: 'Shaheen Afridi', role: 'Bowler', teamId: 'team_2'),
    Player.create(name: 'Haris Rauf', role: 'Bowler', teamId: 'team_2'),
    Player.create(name: 'Shadab Khan', role: 'All-rounder', teamId: 'team_2'),

    // Australia Players
    Player.create(name: 'Steve Smith', role: 'Batsman', teamId: 'team_3'),
    Player.create(name: 'David Warner', role: 'Batsman', teamId: 'team_3'),
    Player.create(name: 'Pat Cummins', role: 'Bowler', teamId: 'team_3'),
    Player.create(name: 'Mitchell Starc', role: 'Bowler', teamId: 'team_3'),
    Player.create(name: 'Glenn Maxwell', role: 'All-rounder', teamId: 'team_3'),

    // England Players
    Player.create(name: 'Joe Root', role: 'Batsman', teamId: 'team_4'),
    Player.create(name: 'Ben Stokes', role: 'All-rounder', teamId: 'team_4'),
    Player.create(name: 'Jofra Archer', role: 'Bowler', teamId: 'team_4'),
    Player.create(name: 'Jos Buttler', role: 'Wicket-keeper', teamId: 'team_4'),
    Player.create(name: 'Moeen Ali', role: 'All-rounder', teamId: 'team_4'),
  ];

  // Mock Matches
  static final List<Match> mockMatches = [
    Match.create(
      teamA: 'India',
      teamB: 'Pakistan',
      bowlingTeamName: 'Pakistan',
      battingTeamId: 'team_1',
      bowlingTeamId: 'team_2',
      totalOvers: 20,
    ),
    Match.create(
      teamA: 'Australia',
      teamB: 'England',
      bowlingTeamName: 'England',
      battingTeamId: 'team_3',
      bowlingTeamId: 'team_4',
      totalOvers: 20,
    ),
  ];

  // Mock Player Stats
  static final List<PlayerStats> mockPlayerStats = [
    PlayerStats.create('player_1').copyWith(
      totalMatches: 1,
      totalRuns: 48,
      totalBalls: 32,
      totalFours: 6,
      totalSixes: 2,
      bestRuns: 48,
      averageRuns: 48.0,
      strikeRate: 150.0,
    ),
    PlayerStats.create('player_2').copyWith(
      totalMatches: 1,
      totalRuns: 30,
      totalBalls: 24,
      totalFours: 3,
      totalSixes: 1,
      bestRuns: 30,
      averageRuns: 30.0,
      strikeRate: 125.0,
    ),
    PlayerStats.create('player_8').copyWith(
      totalMatches: 1,
      totalWickets: 1,
      totalOvers: 3,
      totalRunsConceded: 27,
      bestWickets: 1,
      economyRate: 7.36,
    ),
    PlayerStats.create('player_9').copyWith(
      totalMatches: 1,
      totalWickets: 2,
      totalOvers: 4,
      totalRunsConceded: 34,
      bestWickets: 2,
      economyRate: 8.50,
    ),
  ];

  // Match Scoring Screen Mock Data
  static final Map<String, dynamic> matchScoringData = {
    "match": {
      "teamA": "India",
      "teamAFlag": Assets.images.indiaFlag,
      "teamB": "Pakistan",
      "teamBFlag": Assets.images.pakistanFlag,
      "scoreA": "142/3",
      "scoreB": "138/8",
      "overs": "15.4",
      "runRate": "9.05",
      "target": "145",
      "crr": "8.76",
    },
    "batsmen": [
      {
        "name": "Rohit",
        "runs": 48,
        "balls": 32,
        "fours": 6,
        "sixes": 2,
        "strike_rate": 150.0,
      },
      {
        "name": "Rahul",
        "runs": 30,
        "balls": 24,
        "fours": 3,
        "sixes": 1,
        "strike_rate": 125.0,
      },
    ],
    "bowlers": [
      {
        "name": "Shaheen",
        "overs": 3.4,
        "runs": 27,
        "wickets": 1,
        "economy": 7.36,
      },
      {"name": "Rauf", "overs": 4.0, "runs": 34, "wickets": 2, "economy": 8.50},
    ],
    "ball_history": [
      {"over": 15.1, "description": "1 run"},
      {"over": 15.2, "description": "4 runs"},
      {"over": 15.3, "description": "2 runs"},
      {"over": 15.4, "description": "Wicket"},
    ],
    "run_rate_chart": [10.5, 9.8, 9.1, 8.7],
  };

  // Static Text Constants
  static const String appTitle = 'Cricket Score Counter';
  static const String appSubtitle = 'Track Every Ball';
  static const String startNewMatch = 'Start New Match';
  static const String newMatch = 'New Match';
  static const String matchHistory = 'Match History';
  static const String teams = 'Teams';
  static const String playerStats = 'Player Stats';
  static const String matchSummary = 'Match Summary';
  static const String matchScoring = 'Match Scoring';
  static const String teamManagement = 'Team Management';
  static const String createEditTeam = 'Create/Edit Team';
  static const String editTeams = 'Edit Teams';
  static const String teamName = 'Team Name';
  static const String players = 'Players';
  static const String addPlayer = 'Add Player';
  static const String save = 'Save';
  static const String cancel = 'Cancel';
  static const String add = 'Add';
  static const String enterPlayerName = 'Enter player name';
  static const String teamSavedSuccessfully = 'Team saved successfully!';
  static const String playerAddedSuccessfully = 'Player added successfully!';
  static const String ballControls = 'Ball Controls';
  static const String scoreCard = 'Score Card';
  static const String overs = 'Overs';
  static const String crr = 'CRR';
  static const String target = 'Target';
  static const String vs = 'VS';
  static const String ball = 'Ball';
  static const String run = 'run';
  static const String runs = 'runs';
  static const String wicket = 'Wicket';
  static const String wide = 'Wide';
  static const String noBall = 'No Ball';
  static const String byes = 'Byes';
  static const String legByes = 'Leg Byes';

  // Error Messages
  static const String failedToLoadTeams = 'Failed to load teams';
  static const String failedToCreateTeam = 'Failed to create team';
  static const String failedToUpdateTeam = 'Failed to update team';
  static const String failedToDeleteTeam = 'Failed to delete team';
  static const String failedToLoadPlayers = 'Failed to load players';
  static const String failedToAddPlayer = 'Failed to add player';
  static const String failedToUpdatePlayer = 'Failed to update player';
  static const String failedToDeletePlayer = 'Failed to delete player';
  static const String failedToLoadMatches = 'Failed to load matches';
  static const String failedToStartMatch = 'Failed to start match';
  static const String failedToAddBallEvent = 'Failed to add ball event';
  static const String failedToUndoBallEvent = 'Failed to undo ball event';
  static const String failedToCompleteMatch = 'Failed to complete match';
  static const String failedToLoadPlayerStats = 'Failed to load player stats';
  static const String failedToUpdatePlayerStats =
      'Failed to update player stats';

  // Success Messages
  static const String teamCreatedSuccessfully = 'Team created successfully!';
  static const String teamUpdatedSuccessfully = 'Team updated successfully!';
  static const String teamDeletedSuccessfully = 'Team deleted successfully!';
  static const String playerUpdatedSuccessfully =
      'Player updated successfully!';
  static const String playerDeletedSuccessfully =
      'Player deleted successfully!';
  static const String matchStartedSuccessfully = 'Match started successfully!';
  static const String matchCompletedSuccessfully =
      'Match completed successfully!';
  static const String playerStatsUpdatedSuccessfully =
      'Player stats updated successfully!';

  // Player Roles
  static const List<String> playerRoles = [
    'Batsman',
    'Bowler',
    'All-rounder',
    'Wicket-keeper',
  ];

  // Special Ball Events
  static const List<String> specialBallEvents = [
    'Wide',
    'No Ball',
    'Wicket',
    'Byes',
    'Leg Byes',
  ];

  // Run Options
  static const List<int> runOptions = [0, 1, 2, 3, 4, 5, 6];

  // Table Headers
  static const List<String> batsmanHeaders = [
    'Player',
    'R',
    'B',
    '4s',
    '6s',
    'SR',
  ];
  static const List<String> bowlerHeaders = ['Bowler', 'O', 'R', 'W', 'ER'];
}
