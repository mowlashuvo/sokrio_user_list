import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

@freezed
class UserEntity with _$UserEntity {
  const factory UserEntity({
    int? page,
    int? perPage,
    int? total,
    int? totalPages,
    @Default([]) List<UserDataEntity> data,
    SupportEntity? support,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, dynamic> json) => _$UserEntityFromJson(json);
}

@freezed
class UserDataEntity with _$UserDataEntity {
  const factory UserDataEntity({
    int? id,
    String? email,
    String? firstName,
    String? lastName,
    String? avatar,
  }) = _UserDataEntity;

  factory UserDataEntity.fromJson(Map<String, dynamic> json) => _$UserDataEntityFromJson(json);
}

@freezed
class SupportEntity with _$SupportEntity {
  const factory SupportEntity({
    String? url,
    String? text,
  }) = _SupportEntity;

  factory SupportEntity.fromJson(Map<String, dynamic> json) => _$SupportEntityFromJson(json);
}
