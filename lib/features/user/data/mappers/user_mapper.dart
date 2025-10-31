import '../../domain/entities/user_entity.dart';
import '../models/user_model.dart';

extension UserModelMapper on UserModel {
  UserEntity toEntity() => UserEntity(
    page: page,
    perPage: perPage,
    total: total,
    totalPages: totalPages,
    data: data?.map((e) => e.toEntity()).toList() ?? [],
    support: support?.toEntity(),
  );
}

extension UserDataModelMapper on UserDataModel {
  UserDataEntity toEntity() => UserDataEntity(
    id: id,
    email: email,
    firstName: firstName,
    lastName: lastName,
    avatar: avatar,
  );
}

extension SupportModelMapper on SupportModel {
  SupportEntity toEntity() => SupportEntity(
    url: url,
    text: text,
  );
}
