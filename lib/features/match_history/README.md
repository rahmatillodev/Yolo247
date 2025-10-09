# Match History API Integration

This document describes the API integration for the Match History feature.

## API Endpoint

**Get All Matches List**
- URL: `https://api.cricapi.com/v1/matches`
- Method: GET
- API Key: `80a0e6bc-c7d4-41f2-bde0-71e5e040ce13`
- Parameters:
  - `apikey`: API key
  - `offset`: Pagination offset (default: 0)

## Architecture

The implementation follows Clean Architecture principles with the following layers:

### 1. Data Layer
- **DTOs**: `MatchHistoryDto`, `TeamInfoDto`, `ScoreDto`, `MatchHistoryResponseDto`
- **Data Source**: `MatchHistoryDataSource` (interface) and `MatchHistoryDataSourceImpl` (implementation)
- **Repository**: `MatchHistoryRepositoryImpl` (implementation)

### 2. Domain Layer
- **Entities**: `MatchHistoryEntity`, `TeamInfoEntity`, `ScoreEntity`
- **Repository Interface**: `MatchHistoryRepository`

### 3. Presentation Layer
- **BLoC**: `MatchHistoryBloc` with events and states
- **UI**: `MatchHistoryScreen` updated to use BLoC

## Current Implementation

### Real API Integration ✅
The app is now using real API data from the CricAPI service. The implementation includes:

- **Live Data**: Real match data fetched from `https://api.cricapi.com/v1/matches`
- **Error Handling**: Comprehensive error handling with retry functionality
- **Loading States**: Proper loading indicators during API calls
- **Data Mapping**: API response mapped to UI-compatible format

### Mock Data (Available for Testing)
Mock data is still available for testing purposes. To switch back to mock data:

1. Update `DependencyInjection.matchHistoryRepository` in `/lib/core/di/dependency_injection.dart`
2. Comment out the real API implementation and uncomment the mock:
   ```dart
   // Real API (commented out)
   // final httpClient = http.Client();
   // final dataSource = MatchHistoryDataSourceImpl(httpClient);
   // return MatchHistoryRepositoryImpl(dataSource);
   
   // Mock data
   return MockMatchHistoryRepository();
   ```

## Data Mapping

The API response is mapped to entities as follows:

- `id` → `MatchHistoryEntity.id`
- `name` → `MatchHistoryEntity.name`
- `matchType` → `MatchHistoryEntity.matchType`
- `status` → `MatchHistoryEntity.status`
- `venue` → `MatchHistoryEntity.venue`
- `date` → `MatchHistoryEntity.date`
- `dateTimeGMT` → `MatchHistoryEntity.dateTimeGMT`
- `teams` → `MatchHistoryEntity.teams`
- `teamInfo` → `MatchHistoryEntity.teamInfo`
- `score` → `MatchHistoryEntity.score`

## UI Compatibility

The existing UI (`HistoryCardWidget`) expects a `Map<String, dynamic>` format. The `MatchHistoryScreen` includes a conversion method `_convertEntityToMap()` that transforms the entity data to the expected format.

### Current Data Handling

#### Real API Data ✅
- **Match Information**: Team names, dates, times, venues, match types
- **Scores**: Real scores when available from API
- **Status**: Live match status from API
- **Team Flags**: Smart flag selection based on team names

#### Default Data (TBD)
- **Player Statistics**: Currently showing default player data
- **Detailed Scores**: Overs, extras, run rates (showing "TBD" when not available)
- **Player Performance**: Batting and bowling statistics

#### Team Flag Mapping
The app intelligently maps team names to appropriate flags:
- India → India Flag
- Australia → Australia Flag  
- England/United Kingdom → UK Flag
- Pakistan → Pakistan Flag
- Default → India Flag (fallback)

## Dependencies

- `http`: For API calls
- `dartz`: For functional programming (Either type)
- `flutter_bloc`: For state management
- `freezed`: For immutable classes
- `json_annotation`: For JSON serialization

## Testing

The implementation includes:
- Mock data service for testing
- Error handling with retry functionality
- Loading states
- Empty state handling

## Future Enhancements

1. **Detailed Match Data**: Integrate match details API for player statistics
2. **Team Flags**: Use actual team flag URLs from API
3. **Caching**: Implement local caching for offline support
4. **Pagination**: Add pagination support for large datasets
5. **Filtering**: Add filters for match type, date range, etc.
