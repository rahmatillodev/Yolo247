# Cricket Score Counter App

A comprehensive Flutter application for tracking cricket matches, managing teams, and maintaining player statistics. Built with modern Flutter architecture using BLoC pattern for state management.

## Features

### 🏏 Core Functionality
- **Live Match Scoring**: Real-time score tracking with ball-by-ball updates
- **Team Management**: Create and manage cricket teams with player rosters
- **Player Statistics**: Comprehensive player performance tracking
- **Match History**: Complete match records with detailed statistics
- **Offline Support**: Fully functional without internet connection

### 📱 Screens
1. **Splash Screen**: App loading with animated logo
2. **Welcome Screen**: Introduction and getting started
3. **Home Screen**: Main navigation hub with quick access to features
4. **New Match**: Setup new matches with team selection and parameters
5. **Match Scoring**: Live scoring interface with real-time updates
6. **Match History**: View all completed matches
7. **Match Details**: Detailed match statistics and player performance
8. **Team Management**: Create, edit, and manage teams
9. **Create/Edit Team**: Add players and configure team settings
10. **Player Stats**: Individual player performance metrics
11. **Match Summary**: Post-match summary with key highlights

### 🎨 Design Features
- **Yolo247 Brand Colors**: Custom color scheme with cricket field aesthetics
- **Responsive Design**: Optimized for all screen sizes using ScreenUtil
- **Smooth Animations**: Engaging transitions and micro-interactions
- **Modern UI**: Clean, intuitive interface following Material Design principles

## Technical Architecture

### 🏗️ Project Structure
```
lib/
├── core/
│   ├── bloc/           # State management (BLoC pattern)
│   ├── constants/      # App constants and text
│   ├── models/         # Data models
│   ├── theme/          # App theme, colors, and fonts
│   └── assets/         # Asset management
├── features/           # Feature-based modules
│   ├── splash/         # Splash screen
│   ├── welcome/        # Welcome screen
│   ├── home/           # Home screen
│   ├── new_match/      # New match setup
│   ├── match_scoring/  # Live scoring
│   ├── match_history/  # Match history
│   ├── match_details/  # Match details
│   ├── team_management/# Team management
│   ├── create_edit_team/# Team creation/editing
│   ├── player_stats/   # Player statistics
│   └── match_summary/  # Match summary
└── main.dart          # App entry point
```

### 🔧 Dependencies
- **flutter_bloc**: State management
- **flutter_screenutil**: Responsive design
- **fl_chart**: Data visualization
- **flutter_animate**: Animations
- **shared_preferences**: Data persistence
- **json_annotation**: JSON serialization
- **equatable**: Value equality
- **uuid**: Unique ID generation
- **intl**: Internationalization

### 📊 Data Models
- **Team**: Team information and player lists
- **Player**: Individual player data
- **Match**: Match details and scoring
- **PlayerStats**: Player performance statistics
- **BallEvent**: Individual ball events

## Getting Started

### Prerequisites
- Flutter SDK (3.8.1 or higher)
- Dart SDK
- Android Studio / VS Code
- Android/iOS device or emulator

### Installation
1. Clone the repository
2. Navigate to the project directory
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Generate required files:
   ```bash
   flutter packages pub run build_runner build
   ```
5. Run the app:
   ```bash
   flutter run
   ```

## Usage

### Creating Teams
1. Navigate to "Teams" from the home screen
2. Tap "Add New Team"
3. Enter team name and add players
4. Save the team

### Starting a Match
1. Go to "New Match" from the home screen
2. Select batting and bowling teams
3. Set the number of overs
4. Tap "Start Match"

### Live Scoring
1. Use the scoring panel to record ball events
2. Tap run buttons (0-6) for regular balls
3. Use checkboxes for special events (Wide, No Ball, Wicket, etc.)
4. View real-time statistics and run rate chart
5. Complete the match when finished

### Viewing Statistics
1. Access "Player Stats" to see individual performance
2. Check "Match History" for completed matches
3. View detailed match information by tapping on matches

## Features in Detail

### Live Scoring System
- **Ball-by-ball tracking**: Record every delivery with runs, wickets, and extras
- **Real-time updates**: Instant score updates and statistics
- **Special events**: Support for wides, no balls, byes, leg byes, and wickets
- **Undo functionality**: Reverse last ball event if needed
- **Batsman swapping**: Change strike during the match

### Statistics Tracking
- **Player performance**: Runs, balls faced, strike rate, fours, sixes
- **Bowling stats**: Overs bowled, runs conceded, wickets taken, economy rate
- **Match summaries**: Best batsman, best bowler, key statistics
- **Historical data**: Complete match history with detailed records

### Team Management
- **Flexible rosters**: Add/remove players from teams
- **Player roles**: Assign specific roles (batsman, bowler, all-rounder, wicket-keeper)
- **Team statistics**: Track team performance across matches

## Customization

### Brand Colors
The app uses Yolo247 brand colors defined in `lib/core/theme/app_colors.dart`:
- Primary: Dark Green (#1B5E20)
- Secondary: Gold (#FFD700)
- Field Green: Cricket field colors
- Custom gradients and accent colors

### Typography
Custom font styles defined in `lib/core/theme/app_fonts.dart`:
- Responsive font sizes
- Cricket-specific text styles
- Consistent typography hierarchy

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Run tests and ensure code quality
5. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For support and questions, please contact the development team or create an issue in the repository.

---

**Cricket Score Counter** - Making cricket scoring effortless and enjoyable! 🏏