// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dantai_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DantaiModel _$$_DantaiModelFromJson(Map<String, dynamic> json) =>
    _$_DantaiModel(
      organizationBunrui: json['OrganizationBunrui'] as String?,
      organizationKbn: json['OrganizationKbn'] as String?,
      id: json['Id'] as int?,
      code: json['Code'] as String?,
      name: json['Name'] as String?,
    );

Map<String, dynamic> _$$_DantaiModelToJson(_$_DantaiModel instance) =>
    <String, dynamic>{
      'OrganizationBunrui': instance.organizationBunrui,
      'OrganizationKbn': instance.organizationKbn,
      'Id': instance.id,
      'Code': instance.code,
      'Name': instance.name,
    };
