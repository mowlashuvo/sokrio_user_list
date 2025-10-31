// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$UserEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function() refresh,
    required TResult Function(String? query) search,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function()? refresh,
    TResult? Function(String? query)? search,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function()? refresh,
    TResult Function(String? query)? search,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserLoadEvent value) load,
    required TResult Function(UserRefreshEvent value) refresh,
    required TResult Function(UserSearchEvent value) search,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserLoadEvent value)? load,
    TResult? Function(UserRefreshEvent value)? refresh,
    TResult? Function(UserSearchEvent value)? search,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserLoadEvent value)? load,
    TResult Function(UserRefreshEvent value)? refresh,
    TResult Function(UserSearchEvent value)? search,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEventCopyWith<$Res> {
  factory $UserEventCopyWith(UserEvent value, $Res Function(UserEvent) then) =
      _$UserEventCopyWithImpl<$Res, UserEvent>;
}

/// @nodoc
class _$UserEventCopyWithImpl<$Res, $Val extends UserEvent>
    implements $UserEventCopyWith<$Res> {
  _$UserEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$UserLoadEventImplCopyWith<$Res> {
  factory _$$UserLoadEventImplCopyWith(
    _$UserLoadEventImpl value,
    $Res Function(_$UserLoadEventImpl) then,
  ) = __$$UserLoadEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserLoadEventImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$UserLoadEventImpl>
    implements _$$UserLoadEventImplCopyWith<$Res> {
  __$$UserLoadEventImplCopyWithImpl(
    _$UserLoadEventImpl _value,
    $Res Function(_$UserLoadEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UserLoadEventImpl implements UserLoadEvent {
  const _$UserLoadEventImpl();

  @override
  String toString() {
    return 'UserEvent.load()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UserLoadEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function() refresh,
    required TResult Function(String? query) search,
  }) {
    return load();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function()? refresh,
    TResult? Function(String? query)? search,
  }) {
    return load?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function()? refresh,
    TResult Function(String? query)? search,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserLoadEvent value) load,
    required TResult Function(UserRefreshEvent value) refresh,
    required TResult Function(UserSearchEvent value) search,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserLoadEvent value)? load,
    TResult? Function(UserRefreshEvent value)? refresh,
    TResult? Function(UserSearchEvent value)? search,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserLoadEvent value)? load,
    TResult Function(UserRefreshEvent value)? refresh,
    TResult Function(UserSearchEvent value)? search,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class UserLoadEvent implements UserEvent {
  const factory UserLoadEvent() = _$UserLoadEventImpl;
}

/// @nodoc
abstract class _$$UserRefreshEventImplCopyWith<$Res> {
  factory _$$UserRefreshEventImplCopyWith(
    _$UserRefreshEventImpl value,
    $Res Function(_$UserRefreshEventImpl) then,
  ) = __$$UserRefreshEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserRefreshEventImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$UserRefreshEventImpl>
    implements _$$UserRefreshEventImplCopyWith<$Res> {
  __$$UserRefreshEventImplCopyWithImpl(
    _$UserRefreshEventImpl _value,
    $Res Function(_$UserRefreshEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UserRefreshEventImpl implements UserRefreshEvent {
  const _$UserRefreshEventImpl();

  @override
  String toString() {
    return 'UserEvent.refresh()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UserRefreshEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function() refresh,
    required TResult Function(String? query) search,
  }) {
    return refresh();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function()? refresh,
    TResult? Function(String? query)? search,
  }) {
    return refresh?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function()? refresh,
    TResult Function(String? query)? search,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserLoadEvent value) load,
    required TResult Function(UserRefreshEvent value) refresh,
    required TResult Function(UserSearchEvent value) search,
  }) {
    return refresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserLoadEvent value)? load,
    TResult? Function(UserRefreshEvent value)? refresh,
    TResult? Function(UserSearchEvent value)? search,
  }) {
    return refresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserLoadEvent value)? load,
    TResult Function(UserRefreshEvent value)? refresh,
    TResult Function(UserSearchEvent value)? search,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(this);
    }
    return orElse();
  }
}

abstract class UserRefreshEvent implements UserEvent {
  const factory UserRefreshEvent() = _$UserRefreshEventImpl;
}

/// @nodoc
abstract class _$$UserSearchEventImplCopyWith<$Res> {
  factory _$$UserSearchEventImplCopyWith(
    _$UserSearchEventImpl value,
    $Res Function(_$UserSearchEventImpl) then,
  ) = __$$UserSearchEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? query});
}

/// @nodoc
class __$$UserSearchEventImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$UserSearchEventImpl>
    implements _$$UserSearchEventImplCopyWith<$Res> {
  __$$UserSearchEventImplCopyWithImpl(
    _$UserSearchEventImpl _value,
    $Res Function(_$UserSearchEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? query = freezed}) {
    return _then(
      _$UserSearchEventImpl(
        query: freezed == query
            ? _value.query
            : query // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$UserSearchEventImpl implements UserSearchEvent {
  const _$UserSearchEventImpl({this.query});

  @override
  final String? query;

  @override
  String toString() {
    return 'UserEvent.search(query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserSearchEventImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserSearchEventImplCopyWith<_$UserSearchEventImpl> get copyWith =>
      __$$UserSearchEventImplCopyWithImpl<_$UserSearchEventImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function() refresh,
    required TResult Function(String? query) search,
  }) {
    return search(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function()? refresh,
    TResult? Function(String? query)? search,
  }) {
    return search?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function()? refresh,
    TResult Function(String? query)? search,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserLoadEvent value) load,
    required TResult Function(UserRefreshEvent value) refresh,
    required TResult Function(UserSearchEvent value) search,
  }) {
    return search(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserLoadEvent value)? load,
    TResult? Function(UserRefreshEvent value)? refresh,
    TResult? Function(UserSearchEvent value)? search,
  }) {
    return search?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserLoadEvent value)? load,
    TResult Function(UserRefreshEvent value)? refresh,
    TResult Function(UserSearchEvent value)? search,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(this);
    }
    return orElse();
  }
}

abstract class UserSearchEvent implements UserEvent {
  const factory UserSearchEvent({final String? query}) = _$UserSearchEventImpl;

  String? get query;

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserSearchEventImplCopyWith<_$UserSearchEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserState {
  UserStatus get status => throw _privateConstructorUsedError;
  List<UserDataEntity> get data => throw _privateConstructorUsedError;
  bool get hasReachedMax => throw _privateConstructorUsedError;
  bool get isLoadingMore => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserStateCopyWith<UserState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res, UserState>;
  @useResult
  $Res call({
    UserStatus status,
    List<UserDataEntity> data,
    bool hasReachedMax,
    bool isLoadingMore,
    String? error,
    String? message,
  });
}

/// @nodoc
class _$UserStateCopyWithImpl<$Res, $Val extends UserState>
    implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? data = null,
    Object? hasReachedMax = null,
    Object? isLoadingMore = null,
    Object? error = freezed,
    Object? message = freezed,
  }) {
    return _then(
      _value.copyWith(
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as UserStatus,
            data: null == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as List<UserDataEntity>,
            hasReachedMax: null == hasReachedMax
                ? _value.hasReachedMax
                : hasReachedMax // ignore: cast_nullable_to_non_nullable
                      as bool,
            isLoadingMore: null == isLoadingMore
                ? _value.isLoadingMore
                : isLoadingMore // ignore: cast_nullable_to_non_nullable
                      as bool,
            error: freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                      as String?,
            message: freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserStateImplCopyWith<$Res>
    implements $UserStateCopyWith<$Res> {
  factory _$$UserStateImplCopyWith(
    _$UserStateImpl value,
    $Res Function(_$UserStateImpl) then,
  ) = __$$UserStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    UserStatus status,
    List<UserDataEntity> data,
    bool hasReachedMax,
    bool isLoadingMore,
    String? error,
    String? message,
  });
}

/// @nodoc
class __$$UserStateImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$UserStateImpl>
    implements _$$UserStateImplCopyWith<$Res> {
  __$$UserStateImplCopyWithImpl(
    _$UserStateImpl _value,
    $Res Function(_$UserStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? data = null,
    Object? hasReachedMax = null,
    Object? isLoadingMore = null,
    Object? error = freezed,
    Object? message = freezed,
  }) {
    return _then(
      _$UserStateImpl(
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as UserStatus,
        data: null == data
            ? _value._data
            : data // ignore: cast_nullable_to_non_nullable
                  as List<UserDataEntity>,
        hasReachedMax: null == hasReachedMax
            ? _value.hasReachedMax
            : hasReachedMax // ignore: cast_nullable_to_non_nullable
                  as bool,
        isLoadingMore: null == isLoadingMore
            ? _value.isLoadingMore
            : isLoadingMore // ignore: cast_nullable_to_non_nullable
                  as bool,
        error: freezed == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as String?,
        message: freezed == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$UserStateImpl implements _UserState {
  const _$UserStateImpl({
    this.status = UserStatus.initial,
    final List<UserDataEntity> data = const [],
    this.hasReachedMax = false,
    this.isLoadingMore = false,
    this.error,
    this.message,
  }) : _data = data;

  @override
  @JsonKey()
  final UserStatus status;
  final List<UserDataEntity> _data;
  @override
  @JsonKey()
  List<UserDataEntity> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  @JsonKey()
  final bool hasReachedMax;
  @override
  @JsonKey()
  final bool isLoadingMore;
  @override
  final String? error;
  @override
  final String? message;

  @override
  String toString() {
    return 'UserState(status: $status, data: $data, hasReachedMax: $hasReachedMax, isLoadingMore: $isLoadingMore, error: $error, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.hasReachedMax, hasReachedMax) ||
                other.hasReachedMax == hasReachedMax) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    const DeepCollectionEquality().hash(_data),
    hasReachedMax,
    isLoadingMore,
    error,
    message,
  );

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserStateImplCopyWith<_$UserStateImpl> get copyWith =>
      __$$UserStateImplCopyWithImpl<_$UserStateImpl>(this, _$identity);
}

abstract class _UserState implements UserState {
  const factory _UserState({
    final UserStatus status,
    final List<UserDataEntity> data,
    final bool hasReachedMax,
    final bool isLoadingMore,
    final String? error,
    final String? message,
  }) = _$UserStateImpl;

  @override
  UserStatus get status;
  @override
  List<UserDataEntity> get data;
  @override
  bool get hasReachedMax;
  @override
  bool get isLoadingMore;
  @override
  String? get error;
  @override
  String? get message;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserStateImplCopyWith<_$UserStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
