// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'awareness_filter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AwarenessFilterModel _$$_AwarenessFilterModelFromJson(
        Map<String, dynamic> json) =>
    _$_AwarenessFilterModel(
      dantaiId: json['DantaiId'] as int?,
      organizationKbn: json['OrganizationKbn'] as String?,
      dantaiName: json['DantaiName'] as String?,
      gakunenCode: json['GakunenCode'] as String?,
      gakunenRyakusho: json['GakunenRyakusho'] as String?,
      classId: json['ClassId'] as int?,
      classCode: json['ClassCode'] as String?,
      className: json['ClassName'] as String?,
      beginDate: json['BeginDate'] == null
          ? null
          : DateTime.parse(json['BeginDate'] as String),
      endDate: json['EndDate'] == null
          ? null
          : DateTime.parse(json['EndDate'] as String),
    );

Map<String, dynamic> _$$_AwarenessFilterModelToJson(
        _$_AwarenessFilterModel instance) =>
    <String, dynamic>{
      'DantaiId': instance.dantaiId,
      'OrganizationKbn': instance.organizationKbn,
      'DantaiName': instance.dantaiName,
      'GakunenCode': instance.gakunenCode,
      'GakunenRyakusho': instance.gakunenRyakusho,
      'ClassId': instance.classId,
      'ClassCode': instance.classCode,
      'ClassName': instance.className,
      'BeginDate': instance.beginDate?.toIso8601String(),
      'EndDate': instance.endDate?.toIso8601String(),
    };
