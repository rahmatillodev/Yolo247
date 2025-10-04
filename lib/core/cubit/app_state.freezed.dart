// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AppState {
  List<Team> get teams => throw _privateConstructorUsedError;
  List<Player> get players => throw _privateConstructorUsedError;
  List<Match> get matches => throw _privateConstructorUsedError;
  List<PlayerStats> get playerStats => throw _privateConstructorUsedError;
  Match? get currentMatch => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  String? get successMessage => throw _privateConstructorUsedError;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppStateCopyWith<AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res, AppState>;
  @useResult
  $Res call({
    List<Team> teams,
    List<Player> players,
    List<Match> matches,
    List<PlayerStats> playerStats,
    Match? currentMatch,
    bool isLoading,
    String? errorMessage,
    String? successMessage,
  });
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res, $Val extends AppState>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? teams = null,
    Object? players = null,
    Object? matches = null,
    Object? playerStats = null,
    Object? currentMatch = freezed,
    Object? isLoading = null,
    Object? errorMessage = freezed,
    Object? successMessage = freezed,
  }) {
    return _then(
      _value.copyWith(
            teams: null == teams
                ? _value.teams
                : teams // ignore: cast_nullable_to_non_nullable
                      as List<Team>,
            players: null == players
                ? _value.players
                : players // ignore: cast_nullable_to_non_nullable
                      as List<Player>,
            matches: null == matches
                ? _value.matches
                : matches // ignore: cast_nullable_to_non_nullable
                      as List<Match>,
            playerStats: null == playerStats
                ? _value.playerStats
                : playerStats // ignore: cast_nullable_to_non_nullable
                      as List<PlayerStats>,
            currentMatch: freezed == currentMatch
                ? _value.currentMatch
                : currentMatch // ignore: cast_nullable_to_non_nullable
                      as Match?,
            isLoading: null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
            errorMessage: freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
            successMessage: freezed == successMessage
                ? _value.successMessage
                : successMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AppStateImplCopyWith<$Res>
    implements $AppStateCopyWith<$Res> {
  factory _$$AppStateImplCopyWith(
    _$AppStateImpl value,
    $Res Function(_$AppStateImpl) then,
  ) = __$$AppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<Team> teams,
    List<Player> players,
    List<Match> matches,
    List<PlayerStats> playerStats,
    Match? currentMatch,
    bool isLoading,
    String? errorMessage,
    String? successMessage,
  });
}

/// @nodoc
class __$$AppStateImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$AppStateImpl>
    implements _$$AppStateImplCopyWith<$Res> {
  __$$AppStateImplCopyWithImpl(
    _$AppStateImpl _value,
    $Res Function(_$AppStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? teams = null,
    Object? players = null,
    Object? matches = null,
    Object? playerStats = null,
    Object? currentMatch = freezed,
    Object? isLoading = null,
    Object? errorMessage = freezed,
    Object? successMessage = freezed,
  }) {
    return _then(
      _$AppStateImpl(
        teams: null == teams
            ? _value._teams
            : teams // ignore: cast_nullable_to_non_nullable
                  as List<Team>,
        players: null == players
            ? _value._players
            : players // ignore: cast_nullable_to_non_nullable
                  as List<Player>,
        matches: null == matches
            ? _value._matches
            : matches // ignore: cast_nullable_to_non_nullable
                  as List<Match>,
        playerStats: null == playerStats
            ? _value._playerStats
            : playerStats // ignore: cast_nullable_to_non_nullable
                  as List<PlayerStats>,
        currentMatch: freezed == currentMatch
            ? _value.currentMatch
            : currentMatch // ignore: cast_nullable_to_non_nullable
                  as Match?,
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
        successMessage: freezed == successMessage
            ? _value.successMessage
            : successMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$AppStateImpl implements _AppState {
  const _$AppStateImpl({
    final List<Team> teams = const [],
    final List<Player> players = const [],
    final List<Match> matches = const [],
    final List<PlayerStats> playerStats = const [],
    this.currentMatch = null,
    this.isLoading = false,
    this.errorMessage = null,
    this.successMessage = null,
  }) : _teams = teams,
       _players = players,
       _matches = matches,
       _playerStats = playerStats;

  final List<Team> _teams;
  @override
  @JsonKey()
  List<Team> get teams {
    if (_teams is EqualUnmodifiableListView) return _teams;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_teams);
  }

  final List<Player> _players;
  @override
  @JsonKey()
  List<Player> get players {
    if (_players is EqualUnmodifiableListView) return _players;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_players);
  }

  final List<Match> _matches;
  @override
  @JsonKey()
  List<Match> get matches {
    if (_matches is EqualUnmodifiableListView) return _matches;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_matches);
  }

  final List<PlayerStats> _playerStats;
  @override
  @JsonKey()
  List<PlayerStats> get playerStats {
    if (_playerStats is EqualUnmodifiableListView) return _playerStats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_playerStats);
  }

  @override
  @JsonKey()
  final Match? currentMatch;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String? errorMessage;
  @override
  @JsonKey()
  final String? successMessage;

  @override
  String toString() {
    return 'AppState(teams: $teams, players: $players, matches: $matches, playerStats: $playerStats, currentMatch: $currentMatch, isLoading: $isLoading, errorMessage: $errorMessage, successMessage: $successMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppStateImpl &&
            const DeepCollectionEquality().equals(other._teams, _teams) &&
            const DeepCollectionEquality().equals(other._players, _players) &&
            const DeepCollectionEquality().equals(other._matches, _matches) &&
            const DeepCollectionEquality().equals(
              other._playerStats,
              _playerStats,
            ) &&
            (identical(other.currentMatch, currentMatch) ||
                other.currentMatch == currentMatch) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.successMessage, successMessage) ||
                other.successMessage == successMessage));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_teams),
    const DeepCollectionEquality().hash(_players),
    const DeepCollectionEquality().hash(_matches),
    const DeepCollectionEquality().hash(_playerStats),
    currentMatch,
    isLoading,
    errorMessage,
    successMessage,
  );

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppStateImplCopyWith<_$AppStateImpl> get copyWith =>
      __$$AppStateImplCopyWithImpl<_$AppStateImpl>(this, _$identity);
}

abstract class _AppState implements AppState {
  const factory _AppState({
    final List<Team> teams,
    final List<Player> players,
    final List<Match> matches,
    final List<PlayerStats> playerStats,
    final Match? currentMatch,
    final bool isLoading,
    final String? errorMessage,
    final String? successMessage,
  }) = _$AppStateImpl;

  @override
  List<Team> get teams;
  @override
  List<Player> get players;
  @override
  List<Match> get matches;
  @override
  List<PlayerStats> get playerStats;
  @override
  Match? get currentMatch;
  @override
  bool get isLoading;
  @override
  String? get errorMessage;
  @override
  String? get successMessage;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppStateImplCopyWith<_$AppStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
