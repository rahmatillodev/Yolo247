# Development Guidelines

## Project Structure

```
lib/
├── src/                    # Main source code directory
│   ├── core/              # Core functionality and utilities
│   │   ├── base/         # Base classes and interfaces
│   │   ├── config/       # Configuration files
│   │   ├── constant/     # App-wide constants
│   │   ├── di/          # Dependency injection
│   │   ├── navigation/   # Navigation related code
│   │   ├── network/      # Network-related code
│   │   ├── persistent_storage/ # Persistent storage management
│   │   ├── utils/        # Utility functions
│   │   └── widgets/      # Shared widgets
│   │
│   ├── features/         # Feature-based modules
│   │   ├── app/         # App initialization
│   │   ├── auth/        # Authentication feature
│   │   ├── home/        # Home feature
│   │   ├── initializer/ # App initialization
│   │   ├── profile/     # Profile feature
│   │   ├── reports/     # Reports feature
│   │   ├── search/      # Search feature
│   │   └── main_page.dart # Main page widget
│   │
│   └── main.dart        # Main entry point

```

## Feature Module Structure

Each feature follows a modular structure:

```
feature_name/
├── data/               # Data layer
│   ├── DTOs/          # Data Transfer Objects
│   │   ├── request/   # Request DTOs
│   │   └── response/  # Response DTOs
│   ├── data_source/   # Data sources (local/remote)
│   │   ├── feature_data_source.dart
│   │   └── feature_data_source_impl.dart
│   └── repository/    # Repository implementations
│       └── feature_repository_impl.dart
│
├── domain/            # Domain layer
│   ├── entities/      # Business entities
│   └── repository/    # Repository interfaces
│       └── feature_repository.dart
│
└── presentation/      # Presentation layer
    ├── bloc/         # State management
    │   ├── feature_bloc.dart
    │   ├── feature_event.dart
    │   ├── feature_state.dart
    │   └── feature_bloc.freezed.dart
    ├── pages/        # Screens
    └── widgets/      # Feature-specific widgets
```

## Core Components

### 1. AI Module (`core/ai/`)
- Location: `lib/src/core/ai/`
- Purpose: AI-related functionality and services
- Contains: AI service implementations, models, and utilities

### 2. Base Module (`core/base/`)
- Location: `lib/src/core/base/`
- Purpose: Base classes and interfaces
- Contains: Base repositories, exceptions, and common interfaces

### 3. Configuration (`core/config/`)
- Location: `lib/src/core/config/`
- Purpose: App configuration
- Contains: Environment configurations, API endpoints, etc.

### 4. Dependency Injection (`core/di/`)
- Location: `lib/src/core/di/`
- Purpose: Dependency injection setup
- Contains: Factory classes for creating dependencies

### 5. Navigation (`core/navigation/`)
- Location: `lib/src/core/navigation/`
- Purpose: Navigation management
- Contains: Routes, navigation service

### 6. Network (`core/network/`)
- Location: `lib/src/core/network/`
- Purpose: Network communication
- Contains: API clients, interceptors, network utilities

### 7. Persistent Storage (`core/persistent_storage/`)
- Location: `lib/src/core/persistent_storage/`
- Purpose: Manage persistent storage operations
- Contains: Token storage, user preferences, and other persistent data management

### 8. Shared Widgets (`core/widgets/`)
- Location: `lib/src/core/widgets/`
- Purpose: Reusable UI components
- Contains: Common widgets used across features

## Feature Development Guidelines

### Creating a New Feature

1. **Create Feature Structure**
   ```bash
   mkdir -p lib/src/features/new_feature/{data,domain,presentation}
   mkdir -p lib/src/features/new_feature/data/{DTOs,data_source,repository}
   mkdir -p lib/src/features/new_feature/domain/{entities,repository}
   mkdir -p lib/src/features/new_feature/presentation/{bloc,pages,widgets}
   ```

2. **Implement Data Layer**
   - Create DTOs using JsonSerializable:
     ```dart
     @JsonSerializable()
     class FeatureDto {
       @JsonKey(name: 'field_name')
       final String? field;

       FeatureDto({
         required this.field,
       });

       factory FeatureDto.fromJson(Map<String, dynamic> json) =>
           _$FeatureDtoFromJson(json);

       Map<String, dynamic> toJson() => _$FeatureDtoToJson(this);
     }
     ```
   - Implement data sources:
     ```dart
     abstract class FeatureDataSource {
       Future<ResponseDto> method(params);
     }

     class FeatureDataSourceImpl extends FeatureDataSource {
       final ExternalService _service;

       FeatureDataSourceImpl(this._service);

       @override
       Future<Dto> method(params) async {
         try {
           final result = await _service.method(params);
           return Dto.fromJson(result.data);
         } on DataSourceException {
           rethrow;
         }
       }
     }
     ```
   - Implement repositories:
     ```dart
     abstract class FeatureRepository {
       Future<Either<String, Entity>> method(params);
     }

     class FeatureRepositoryImpl extends FeatureRepository {
       final FeatureDataSource _dataSource;

       FeatureRepositoryImpl(this._dataSource);

       @override
       Future<Either<String, Entity>> method(params) async {
         try {
           final result = await _dataSource.method(params);
           return right(result.toEntity);
         } on DataSourceException catch (e) {
           return left(e.message);
         } catch (e) {
           rethrow;
         }
       }
     }
     ```

3. **Implement Domain Layer**
   - Define entities
   - Create repository interfaces

4. **Implement Presentation Layer**
   - Create BLoC using freezed:
     ```dart
     @freezed
     class FeatureState with _$FeatureState {
       const factory FeatureState({
         @Default(false) bool isLoading,
         @Default(null) String? errorMessage,
         @Default(null) String? successMessage,
         @Default(null) Entity? data,
       }) = _FeatureState;
     }

     class FeatureBloc extends Bloc<FeatureEvent, FeatureState> {
       final FeatureRepository _repository;

       FeatureBloc(this._repository) : super(const FeatureState()) {
         on<FeatureEvent>((event, emit) async {
           await event.map(
             method: (e) => _onMethod(e, emit),
           );
         });
       }

       Future<void> _onMethod(_Method event, Emitter<FeatureState> emit) async {
         emit(state.copyWith(isLoading: true));
         
         final result = await _repository.method(event.params);
         
         result.fold(
           (error) => emit(state.copyWith(
             isLoading: false,
             errorMessage: error,
           )),
           (data) => emit(state.copyWith(
             isLoading: false,
             data: data,
           )),
         );
       }
     }
     ```
   - Add pages and widgets

### Dependency Injection

```dart
final class FeatureRepositoryFactory extends AsyncDependencyFactory<FeatureRepository> {
  @override
  Future<FeatureRepository> create() async {
    final service = ExternalService();
    final dataSource = FeatureDataSourceImpl(service);
    return FeatureRepositoryImpl(dataSource);
  }
}
```

## Code Style and Best Practices

1. **Naming Conventions**
   - Files: `snake_case.dart`
   - Classes: `PascalCase`
   - Variables: `camelCase`
   - Constants: `SCREAMING_SNAKE_CASE`

2. **Documentation**
   - Document all public APIs
   - Use meaningful variable names
   - Add comments for complex logic

3. **Error Handling**
   - Use Either type for repository methods
   - Handle DataSourceException specifically
   - Rethrow other exceptions
   - Log errors appropriately

## Git Workflow

1. **Branch Naming**
   - Feature: `feature/feature-name`
   - Bugfix: `bugfix/bug-name`
   - Hotfix: `hotfix/issue-name`

2. **Commit Messages**
   - Use conventional commits
   - Format: `type(scope): description`
   - Types: feat, fix, docs, style, refactor, test, chore

## Performance Guidelines

1. **Memory Management**
   - Dispose controllers and streams
   - Use const constructors where possible
   - Implement proper state cleanup

2. **Network Optimization**
   - Implement caching
   - Use pagination for large datasets
   - Optimize image loading

3. **UI Performance**
   - Use const widgets
   - Implement proper widget rebuilding
   - Optimize animations 