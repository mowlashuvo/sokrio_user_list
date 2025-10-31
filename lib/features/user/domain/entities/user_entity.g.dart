// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserEntityImpl _$$UserEntityImplFromJson(Map<String, dynamic> json) =>
    _$UserEntityImpl(
      page: (json['page'] as num?)?.toInt(),
      perPage: (json['perPage'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
      totalPages: (json['totalPages'] as num?)?.toInt(),
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => UserDataEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      support: json['support'] == null
          ? null
          : SupportEntity.fromJson(json['support'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserEntityImplToJson(_$UserEntityImpl instance) =>
    <String, dynamic>{
      'page': instance.page,
      'perPage': instance.perPage,
      'total': instance.total,
      'totalPages': instance.totalPages,
      'data': instance.data,
      'support': instance.support,
    };

_$UserDataEntityImpl _$$UserDataEntityImplFromJson(Map<String, dynamic> json) =>
    _$UserDataEntityImpl(
      id: (json['id'] as num?)?.toInt(),
      email: json['email'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$$UserDataEntityImplToJson(
  _$UserDataEntityImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'avatar': instance.avatar,
};

_$SupportEntityImpl _$$SupportEntityImplFromJson(Map<String, dynamic> json) =>
    _$SupportEntityImpl(
      url: json['url'] as String?,
      text: json['text'] as String?,
    );

Map<String, dynamic> _$$SupportEntityImplToJson(_$SupportEntityImpl instance) =>
    <String, dynamic>{'url': instance.url, 'text': instance.text};
