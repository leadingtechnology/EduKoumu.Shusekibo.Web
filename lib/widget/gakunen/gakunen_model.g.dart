// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gakunen_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GakunenModel _$$_GakunenModelFromJson(Map<String, dynamic> json) =>
    _$_GakunenModel(
      organizationId: json['OrganizationId'] as int?,
      gakunenCode: json['GakunenCode'] as String?,
      gakunenName: json['GakunenName'] as String?,
      gakunenRyakusho: json['GakunenRyakusho'] as String?,
      kateiKbn: json['KateiKbn'] as String?,
      zaisekiAgeLowLimit: json['ZaisekiAgeLowLimit'] as int?,
      isTantoGakunen: json['IsTantoGakunen'] as bool?,
      id: json['Id'] as int?,
      code: json['Code'] as String?,
      name: json['Name'] as String?,
    );

Map<String, dynamic> _$$_GakunenModelToJson(_$_GakunenModel instance) =>
    <String, dynamic>{
      'OrganizationId': instance.organizationId,
      'GakunenCode': instance.gakunenCode,
      'GakunenName': instance.gakunenName,
      'GakunenRyakusho': instance.gakunenRyakusho,
      'KateiKbn': instance.kateiKbn,
      'ZaisekiAgeLowLimit': instance.zaisekiAgeLowLimit,
      'IsTantoGakunen': instance.isTantoGakunen,
      'Id': instance.id,
      'Code': instance.code,
      'Name': instance.name,
    };
