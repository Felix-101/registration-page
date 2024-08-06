// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      status: json['status'] as bool?,
      text: json['text'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      time: json['time'] as String?,
      method: json['method'] as String?,
      endpoint: json['endpoint'] as String?,
      error: json['error'] as List<dynamic>?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'status': instance.status,
      'text': instance.text,
      'data': instance.data,
      'time': instance.time,
      'method': instance.method,
      'endpoint': instance.endpoint,
      'error': instance.error,
    };

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      accessToken: json['access_token'] as String?,
      emailVerified: (json['email_verified'] as num?)?.toInt(),
      phoneNoVerified: (json['phone_no_verified'] as num?)?.toInt(),
      usernameAdded: (json['username_added'] as num?)?.toInt(),
      phoneNoAdded: (json['phone_no_added'] as num?)?.toInt(),
      kyclevel: (json['kyclevel'] as num?)?.toInt(),
      pinAdded: (json['pin_added'] as num?)?.toInt(),
      isLogin2FaActive: (json['is_login_2fa_active'] as num?)?.toInt(),
      the2FaType: (json['the_2fa_type'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'access_token': instance.accessToken,
      'email_verified': instance.emailVerified,
      'phone_no_verified': instance.phoneNoVerified,
      'username_added': instance.usernameAdded,
      'phone_no_added': instance.phoneNoAdded,
      'kyclevel': instance.kyclevel,
      'pin_added': instance.pinAdded,
      'is_login_2fa_active': instance.isLogin2FaActive,
      'the_2fa_type': instance.the2FaType,
    };
