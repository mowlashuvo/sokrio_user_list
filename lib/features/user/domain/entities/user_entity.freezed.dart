// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) {
  return _UserEntity.fromJson(json);
}

/// @nodoc
mixin _$UserEntity {
  int? get page => throw _privateConstructorUsedError;
  int? get perPage => throw _privateConstructorUsedError;
  int? get total => throw _privateConstructorUsedError;
  int? get totalPages => throw _privateConstructorUsedError;
  List<UserDataEntity> get data => throw _privateConstructorUsedError;
  SupportEntity? get support => throw _privateConstructorUsedError;

  /// Serializes this UserEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserEntityCopyWith<UserEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEntityCopyWith<$Res> {
  factory $UserEntityCopyWith(
    UserEntity value,
    $Res Function(UserEntity) then,
  ) = _$UserEntityCopyWithImpl<$Res, UserEntity>;
  @useResult
  $Res call({
    int? page,
    int? perPage,
    int? total,
    int? totalPages,
    List<UserDataEntity> data,
    SupportEntity? support,
  });

  $SupportEntityCopyWith<$Res>? get support;
}

/// @nodoc
class _$UserEntityCopyWithImpl<$Res, $Val extends UserEntity>
    implements $UserEntityCopyWith<$Res> {
  _$UserEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
    Object? perPage = freezed,
    Object? total = freezed,
    Object? totalPages = freezed,
    Object? data = null,
    Object? support = freezed,
  }) {
    return _then(
      _value.copyWith(
            page: freezed == page
                ? _value.page
                : page // ignore: cast_nullable_to_non_nullable
                      as int?,
            perPage: freezed == perPage
                ? _value.perPage
                : perPage // ignore: cast_nullable_to_non_nullable
                      as int?,
            total: freezed == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as int?,
            totalPages: freezed == totalPages
                ? _value.totalPages
                : totalPages // ignore: cast_nullable_to_non_nullable
                      as int?,
            data: null == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as List<UserDataEntity>,
            support: freezed == support
                ? _value.support
                : support // ignore: cast_nullable_to_non_nullable
                      as SupportEntity?,
          )
          as $Val,
    );
  }

  /// Create a copy of UserEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SupportEntityCopyWith<$Res>? get support {
    if (_value.support == null) {
      return null;
    }

    return $SupportEntityCopyWith<$Res>(_value.support!, (value) {
      return _then(_value.copyWith(support: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserEntityImplCopyWith<$Res>
    implements $UserEntityCopyWith<$Res> {
  factory _$$UserEntityImplCopyWith(
    _$UserEntityImpl value,
    $Res Function(_$UserEntityImpl) then,
  ) = __$$UserEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? page,
    int? perPage,
    int? total,
    int? totalPages,
    List<UserDataEntity> data,
    SupportEntity? support,
  });

  @override
  $SupportEntityCopyWith<$Res>? get support;
}

/// @nodoc
class __$$UserEntityImplCopyWithImpl<$Res>
    extends _$UserEntityCopyWithImpl<$Res, _$UserEntityImpl>
    implements _$$UserEntityImplCopyWith<$Res> {
  __$$UserEntityImplCopyWithImpl(
    _$UserEntityImpl _value,
    $Res Function(_$UserEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
    Object? perPage = freezed,
    Object? total = freezed,
    Object? totalPages = freezed,
    Object? data = null,
    Object? support = freezed,
  }) {
    return _then(
      _$UserEntityImpl(
        page: freezed == page
            ? _value.page
            : page // ignore: cast_nullable_to_non_nullable
                  as int?,
        perPage: freezed == perPage
            ? _value.perPage
            : perPage // ignore: cast_nullable_to_non_nullable
                  as int?,
        total: freezed == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as int?,
        totalPages: freezed == totalPages
            ? _value.totalPages
            : totalPages // ignore: cast_nullable_to_non_nullable
                  as int?,
        data: null == data
            ? _value._data
            : data // ignore: cast_nullable_to_non_nullable
                  as List<UserDataEntity>,
        support: freezed == support
            ? _value.support
            : support // ignore: cast_nullable_to_non_nullable
                  as SupportEntity?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserEntityImpl implements _UserEntity {
  const _$UserEntityImpl({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    final List<UserDataEntity> data = const [],
    this.support,
  }) : _data = data;

  factory _$UserEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserEntityImplFromJson(json);

  @override
  final int? page;
  @override
  final int? perPage;
  @override
  final int? total;
  @override
  final int? totalPages;
  final List<UserDataEntity> _data;
  @override
  @JsonKey()
  List<UserDataEntity> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final SupportEntity? support;

  @override
  String toString() {
    return 'UserEntity(page: $page, perPage: $perPage, total: $total, totalPages: $totalPages, data: $data, support: $support)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserEntityImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.support, support) || other.support == support));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    page,
    perPage,
    total,
    totalPages,
    const DeepCollectionEquality().hash(_data),
    support,
  );

  /// Create a copy of UserEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserEntityImplCopyWith<_$UserEntityImpl> get copyWith =>
      __$$UserEntityImplCopyWithImpl<_$UserEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserEntityImplToJson(this);
  }
}

abstract class _UserEntity implements UserEntity {
  const factory _UserEntity({
    final int? page,
    final int? perPage,
    final int? total,
    final int? totalPages,
    final List<UserDataEntity> data,
    final SupportEntity? support,
  }) = _$UserEntityImpl;

  factory _UserEntity.fromJson(Map<String, dynamic> json) =
      _$UserEntityImpl.fromJson;

  @override
  int? get page;
  @override
  int? get perPage;
  @override
  int? get total;
  @override
  int? get totalPages;
  @override
  List<UserDataEntity> get data;
  @override
  SupportEntity? get support;

  /// Create a copy of UserEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserEntityImplCopyWith<_$UserEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserDataEntity _$UserDataEntityFromJson(Map<String, dynamic> json) {
  return _UserDataEntity.fromJson(json);
}

/// @nodoc
mixin _$UserDataEntity {
  int? get id => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;

  /// Serializes this UserDataEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserDataEntityCopyWith<UserDataEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDataEntityCopyWith<$Res> {
  factory $UserDataEntityCopyWith(
    UserDataEntity value,
    $Res Function(UserDataEntity) then,
  ) = _$UserDataEntityCopyWithImpl<$Res, UserDataEntity>;
  @useResult
  $Res call({
    int? id,
    String? email,
    String? firstName,
    String? lastName,
    String? avatar,
  });
}

/// @nodoc
class _$UserDataEntityCopyWithImpl<$Res, $Val extends UserDataEntity>
    implements $UserDataEntityCopyWith<$Res> {
  _$UserDataEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? avatar = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int?,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
            firstName: freezed == firstName
                ? _value.firstName
                : firstName // ignore: cast_nullable_to_non_nullable
                      as String?,
            lastName: freezed == lastName
                ? _value.lastName
                : lastName // ignore: cast_nullable_to_non_nullable
                      as String?,
            avatar: freezed == avatar
                ? _value.avatar
                : avatar // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserDataEntityImplCopyWith<$Res>
    implements $UserDataEntityCopyWith<$Res> {
  factory _$$UserDataEntityImplCopyWith(
    _$UserDataEntityImpl value,
    $Res Function(_$UserDataEntityImpl) then,
  ) = __$$UserDataEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? id,
    String? email,
    String? firstName,
    String? lastName,
    String? avatar,
  });
}

/// @nodoc
class __$$UserDataEntityImplCopyWithImpl<$Res>
    extends _$UserDataEntityCopyWithImpl<$Res, _$UserDataEntityImpl>
    implements _$$UserDataEntityImplCopyWith<$Res> {
  __$$UserDataEntityImplCopyWithImpl(
    _$UserDataEntityImpl _value,
    $Res Function(_$UserDataEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? avatar = freezed,
  }) {
    return _then(
      _$UserDataEntityImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
        firstName: freezed == firstName
            ? _value.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String?,
        lastName: freezed == lastName
            ? _value.lastName
            : lastName // ignore: cast_nullable_to_non_nullable
                  as String?,
        avatar: freezed == avatar
            ? _value.avatar
            : avatar // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDataEntityImpl implements _UserDataEntity {
  const _$UserDataEntityImpl({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  factory _$UserDataEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDataEntityImplFromJson(json);

  @override
  final int? id;
  @override
  final String? email;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? avatar;

  @override
  String toString() {
    return 'UserDataEntity(id: $id, email: $email, firstName: $firstName, lastName: $lastName, avatar: $avatar)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDataEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.avatar, avatar) || other.avatar == avatar));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, email, firstName, lastName, avatar);

  /// Create a copy of UserDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDataEntityImplCopyWith<_$UserDataEntityImpl> get copyWith =>
      __$$UserDataEntityImplCopyWithImpl<_$UserDataEntityImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDataEntityImplToJson(this);
  }
}

abstract class _UserDataEntity implements UserDataEntity {
  const factory _UserDataEntity({
    final int? id,
    final String? email,
    final String? firstName,
    final String? lastName,
    final String? avatar,
  }) = _$UserDataEntityImpl;

  factory _UserDataEntity.fromJson(Map<String, dynamic> json) =
      _$UserDataEntityImpl.fromJson;

  @override
  int? get id;
  @override
  String? get email;
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  String? get avatar;

  /// Create a copy of UserDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserDataEntityImplCopyWith<_$UserDataEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SupportEntity _$SupportEntityFromJson(Map<String, dynamic> json) {
  return _SupportEntity.fromJson(json);
}

/// @nodoc
mixin _$SupportEntity {
  String? get url => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;

  /// Serializes this SupportEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SupportEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SupportEntityCopyWith<SupportEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SupportEntityCopyWith<$Res> {
  factory $SupportEntityCopyWith(
    SupportEntity value,
    $Res Function(SupportEntity) then,
  ) = _$SupportEntityCopyWithImpl<$Res, SupportEntity>;
  @useResult
  $Res call({String? url, String? text});
}

/// @nodoc
class _$SupportEntityCopyWithImpl<$Res, $Val extends SupportEntity>
    implements $SupportEntityCopyWith<$Res> {
  _$SupportEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SupportEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? url = freezed, Object? text = freezed}) {
    return _then(
      _value.copyWith(
            url: freezed == url
                ? _value.url
                : url // ignore: cast_nullable_to_non_nullable
                      as String?,
            text: freezed == text
                ? _value.text
                : text // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SupportEntityImplCopyWith<$Res>
    implements $SupportEntityCopyWith<$Res> {
  factory _$$SupportEntityImplCopyWith(
    _$SupportEntityImpl value,
    $Res Function(_$SupportEntityImpl) then,
  ) = __$$SupportEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? url, String? text});
}

/// @nodoc
class __$$SupportEntityImplCopyWithImpl<$Res>
    extends _$SupportEntityCopyWithImpl<$Res, _$SupportEntityImpl>
    implements _$$SupportEntityImplCopyWith<$Res> {
  __$$SupportEntityImplCopyWithImpl(
    _$SupportEntityImpl _value,
    $Res Function(_$SupportEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SupportEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? url = freezed, Object? text = freezed}) {
    return _then(
      _$SupportEntityImpl(
        url: freezed == url
            ? _value.url
            : url // ignore: cast_nullable_to_non_nullable
                  as String?,
        text: freezed == text
            ? _value.text
            : text // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SupportEntityImpl implements _SupportEntity {
  const _$SupportEntityImpl({this.url, this.text});

  factory _$SupportEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$SupportEntityImplFromJson(json);

  @override
  final String? url;
  @override
  final String? text;

  @override
  String toString() {
    return 'SupportEntity(url: $url, text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SupportEntityImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, url, text);

  /// Create a copy of SupportEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SupportEntityImplCopyWith<_$SupportEntityImpl> get copyWith =>
      __$$SupportEntityImplCopyWithImpl<_$SupportEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SupportEntityImplToJson(this);
  }
}

abstract class _SupportEntity implements SupportEntity {
  const factory _SupportEntity({final String? url, final String? text}) =
      _$SupportEntityImpl;

  factory _SupportEntity.fromJson(Map<String, dynamic> json) =
      _$SupportEntityImpl.fromJson;

  @override
  String? get url;
  @override
  String? get text;

  /// Create a copy of SupportEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SupportEntityImplCopyWith<_$SupportEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
