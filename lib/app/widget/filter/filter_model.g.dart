// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FilterModel _$$_FilterModelFromJson(Map<String, dynamic> json) =>
    _$_FilterModel(
      dantaiId: json['DantaiId'] as int?,
      organizationKbn: json['OrganizationKbn'] as String?,
      dantaiName: json['DantaiName'] as String?,
      gakunenCode: json['GakunenCode'] as String?,
      gakunenRyakusho: json['GakunenRyakusho'] as String?,
      kouryuGakkyu: json['kouryuGakkyu'] as bool?,
      classId: json['ClassId'] as int?,
      classCode: json['ClassCode'] as String?,
      className: json['ClassName'] as String?,
      jigenIdx: json['JigenIdx'] as int?,
      jigenRyaku: json['JigenRyaku'] as String?,
      targetDate: json['TargetDate'] == null
          ? null
          : DateTime.parse(json['TargetDate'] as String),
      japanDate: json['JapanDate'] as String?,
      beginDate: json['BeginDate'] == null
          ? null
          : DateTime.parse(json['BeginDate'] as String),
      endDate: json['EndDate'] == null
          ? null
          : DateTime.parse(json['EndDate'] as String),
    );

Map<String, dynamic> _$$_FilterModelToJson(_$_FilterModel instance) =>
    <String, dynamic>{
      'DantaiId': instance.dantaiId,
      'OrganizationKbn': instance.organizationKbn,
      'DantaiName': instance.dantaiName,
      'GakunenCode': instance.gakunenCode,
      'GakunenRyakusho': instance.gakunenRyakusho,
      'kouryuGakkyu': instance.kouryuGakkyu,
      'ClassId': instance.classId,
      'ClassCode': instance.classCode,
      'ClassName': instance.className,
      'JigenIdx': instance.jigenIdx,
      'JigenRyaku': instance.jigenRyaku,
      'TargetDate': instance.targetDate?.toIso8601String(),
      'JapanDate': instance.japanDate,
      'BeginDate': instance.beginDate?.toIso8601String(),
      'EndDate': instance.endDate?.toIso8601String(),
    };
