// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extra_filter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ExtraFilterModel _$$_ExtraFilterModelFromJson(Map<String, dynamic> json) =>
    _$_ExtraFilterModel(
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
      jigenIdx: json['JigenIdx'] as int?,
      jigenRyaku: json['JigenRyaku'] as String?,
    );

Map<String, dynamic> _$$_ExtraFilterModelToJson(_$_ExtraFilterModel instance) =>
    <String, dynamic>{
      'TargetDate': instance.targetDate?.toIso8601String(),
      'JapanDate': instance.japanDate,
      'BeginDate': instance.beginDate?.toIso8601String(),
      'EndDate': instance.endDate?.toIso8601String(),
      'JigenIdx': instance.jigenIdx,
      'JigenRyaku': instance.jigenRyaku,
    };
