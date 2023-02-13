// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Token _$$_TokenFromJson(Map<String, dynamic> json) => _$_Token(
      access_token: json['access_token'] as String?,
      token_type: json['token_type'] as String?,
      expires_in: json['expires_in'] as int?,
      TenantId: json['TenantId'] as String?,
      LoginId: json['LoginId'] as String?,
      Dantai: json['Dantai'] as String?,
      UserName: json['UserName'] as String?,
    );

Map<String, dynamic> _$$_TokenToJson(_$_Token instance) => <String, dynamic>{
      'access_token': instance.access_token,
      'token_type': instance.token_type,
      'expires_in': instance.expires_in,
      'TenantId': instance.TenantId,
      'LoginId': instance.LoginId,
      'Dantai': instance.Dantai,
      'UserName': instance.UserName,
    };
