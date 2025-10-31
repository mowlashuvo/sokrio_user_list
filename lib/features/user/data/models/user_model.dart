import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user_entity.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    int? page,
    @JsonKey(name: 'per_page') int? perPage,
    int? total,
    @JsonKey(name: 'total_pages') int? totalPages,
    List<UserDataModel>? data,
    SupportModel? support,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  // Convert to Entity
  factory UserModel.fromEntity(UserEntity entity) => UserModel(
    page: entity.page,
    perPage: entity.perPage,
    total: entity.total,
    totalPages: entity.totalPages,
    data: entity.data.map((e) => UserDataModel.fromEntity(e)).toList(),
    support: entity.support == null ? null : SupportModel.fromEntity(entity.support!),
  );
}

@freezed
class UserDataModel with _$UserDataModel {
  const factory UserDataModel({
    int? id,
    String? email,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    String? avatar,
  }) = _UserDataModel;

  factory UserDataModel.fromJson(Map<String, dynamic> json) => _$UserDataModelFromJson(json);

  factory UserDataModel.fromEntity(UserDataEntity entity) => UserDataModel(
    id: entity.id,
    email: entity.email,
    firstName: entity.firstName,
    lastName: entity.lastName,
    avatar: entity.avatar,
  );
}

@freezed
class SupportModel with _$SupportModel {
  const factory SupportModel({
    String? url,
    String? text,
  }) = _SupportModel;

  factory SupportModel.fromJson(Map<String, dynamic> json) => _$SupportModelFromJson(json);

  factory SupportModel.fromEntity(SupportEntity entity) => SupportModel(
    url: entity.url,
    text: entity.text,
  );
}