# Cricket Score Counter App

A comprehensive Flutter application for tracking cricket matches, managing teams, and maintaining player statistics. Built with modern Flutter architecture using BLoC pattern for state management.

## 🏏 Features

### Core Functionality
- **Live Match Scoring**: Real-time score tracking with ball-by-ball updates
- **Team Management**: Create and manage cricket teams with player rosters
- **Player Statistics**: Comprehensive player performance tracking
- **Match History**: Complete match records with detailed statistics
- **Offline Support**: Fully functional without internet connection

### Screens
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

### Design Features
- **Yolo247 Brand Colors**: Custom color scheme with cricket field aesthetics
- **Responsive Design**: Optimized for all screen sizes using ScreenUtil
- **Smooth Animations**: Engaging transitions and micro-interactions
- **Modern UI**: Clean, intuitive interface following Material Design principles

## 🏗️ Technical Architecture

### Project Structure
```
lib/
├── core/
│   ├── cubit/           # State management (Cubit pattern)
│   ├── constants/       # App constants and text
│   ├── models/          # Data models
│   ├── theme/           # App theme, colors, and fonts
│   ├── routes/          # Navigation routes
│   ├── widgets/         # Shared widgets
│   ├── data/            # Mock data and constants
│   └── assets/          # Asset management
├── features/            # Feature-based modules
│   ├── splash/          # Splash screen
│   ├── welcome/         # Welcome screen
│   ├── home/            # Home screen
│   ├── new_match/       # New match setup
│   ├── match_scoring/   # Live scoring
│   ├── match_history/   # Match history
│   ├── match_details/   # Match details
│   ├── team_management/ # Team management
│   ├── create_edit_team/# Team creation/editing
│   ├── player_stats/    # Player statistics
│   └── match_summary/   # Match summary
└── main.dart           # App entry point
```

### Dependencies
- **flutter_bloc**: State management
- **flutter_screenutil**: Responsive design
- **fl_chart**: Data visualization
- **flutter_animate**: Animations
- **shared_preferences**: Data persistence
- **json_annotation**: JSON serialization
- **equatable**: Value equality
- **uuid**: Unique ID generation
- **intl**: Internationalization
- **google_fonts**: Typography

### Data Models
- **Team**: Team information and player lists
- **Player**: Individual player data
- **Match**: Match details and scoring
- **PlayerStats**: Player performance statistics
- **BallEvent**: Individual ball events

## 🚀 Getting Started

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

## 📱 Usage

### Creating Teams
1. Navigate to "Teams" from the home screen
2. Tap "Create Team"
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

## 🎨 Design System

### Colors
The app uses a comprehensive color system defined in `lib/core/theme/app_colors.dart`:

- **Primary Colors**: Cricket Blue (#1E3A8A), Light Blue (#3B82F6)
- **Secondary Colors**: Cricket Gold (#FFA726), Light Gold (#FFCC02)
- **Field Colors**: Cricket Field Green (#22C55E)
- **Dark Theme**: Dark Background (#0A0E27), Dark Surface (#1A1F3A)
- **Status Colors**: Success (#10B981), Warning (#F59E0B), Error (#EF4444)

### Typography
All fonts use GoogleFonts with ScreenUtil integration:

- **Primary Font**: Inter (GoogleFonts)
- **Special Fonts**: Kaushan Script, Afacad
- **Font Sizes**: All sizes use `.sp` extension for responsive scaling
- **Font Weights**: Light (300) to Black (900)

### Responsive Design
All dimensions use ScreenUtil for consistent scaling:

- **Width**: `.w` extension (e.g., `100.w`)
- **Height**: `.h` extension (e.g., `50.h`)
- **Font Size**: `.sp` extension (e.g., `16.sp`)

## 🔧 State Management

### Cubit Pattern
The app uses Cubit for state management with a single `AppCubit` that handles:

- **Teams**: CRUD operations for team management
- **Players**: CRUD operations for player management
- **Matches**: Match creation, scoring, and completion
- **Player Stats**: Statistics tracking and updates

### State Structure
```dart
class AppState {
  final List<Team> teams;
  final List<Player> players;
  final List<Match> matches;
  final List<PlayerStats> playerStats;
  final Match? currentMatch;
  final bool isLoading;
  final String? errorMessage;
  final String? successMessage;
}
```

### Data Persistence
- Uses SharedPreferences for local data storage
- Mock data is loaded when no data exists
- All CRUD operations are persisted automatically

## 📊 Mock Data

### Centralized Data Management
All mock data is centralized in `lib/core/data/mock_data.dart`:

- **Teams**: Pre-defined cricket teams (India, Pakistan, Australia, England)
- **Players**: Sample players with roles and team assignments
- **Matches**: Sample match data for testing
- **Player Stats**: Sample statistics for demonstration
- **Constants**: All text strings and UI constants

### Usage
```dart
// Access mock data
final teams = MockData.mockTeams;
final players = MockData.mockPlayers;
final matchData = MockData.matchScoringData;

// Access constants
final title = MockData.appTitle;
final errorMessage = MockData.failedToLoadTeams;
```

## 🛠️ Development Guidelines

### Code Organization
- **Feature-based structure**: Each feature has its own directory
- **Core utilities**: Shared code in `core/` directory
- **Consistent naming**: snake_case for files, PascalCase for classes
- **Proper imports**: Organized and grouped imports

### State Management Best Practices
- Use BlocBuilder for UI updates
- Handle loading and error states
- Provide user feedback for actions
- Use proper error handling

### UI/UX Guidelines
- Use ScreenUtil for all dimensions
- Follow Material Design principles
- Implement proper loading states
- Provide clear user feedback

## 🧪 Testing

### Running Tests
```bash
flutter test
```

### Test Coverage
- Unit tests for business logic
- Widget tests for UI components
- Integration tests for user flows

## 📦 Build and Deployment

### Android
```bash
flutter build apk --release
```

### iOS
```bash
flutter build ios --release
```

### Web
```bash
flutter build web --release
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Run tests and ensure code quality
5. Submit a pull request

### Code Style
- Follow Dart/Flutter conventions
- Use meaningful variable names
- Add comments for complex logic
- Ensure proper error handling

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🆘 Support

For support and questions, please contact the development team or create an issue in the repository.

## 🔄 Changelog

### Version 1.0.0
- Initial release with core functionality
- Team management system
- Live match scoring
- Player statistics tracking
- Responsive design implementation
- State management with Cubit
- Mock data integration

---

**Cricket Score Counter** - Making cricket scoring effortless and enjoyable! 🏏

## 📞 Contact

For any questions or support, please reach out to the development team.

---

*Built with ❤️ using Flutter*