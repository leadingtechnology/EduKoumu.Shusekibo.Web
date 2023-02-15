// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AttendanceStatusModel _$$_AttendanceStatusModelFromJson(
        Map<String, dynamic> json) =>
    _$_AttendanceStatusModel(
      jokyoDate:
          json['Date'] == null ? null : DateTime.parse(json['Date'] as String),
      jigenIdx: json['JigenIdx'] as int?,
      ryaku: json['Ryaku'] as String?,
      shukketsuBunrui: json['ShukketsuBunrui'] as String?,
      shukketsuKbn: json['ShukketsuKbn'] as String?,
      jiyu1: json['Jiyu1'] as String?,
      jiyu2: json['Jiyu2'] as String?,
      isEditable: json['IsEditable'] as bool?,
    );

Map<String, dynamic> _$$_AttendanceStatusModelToJson(
        _$_AttendanceStatusModel instance) =>
    <String, dynamic>{
      'Date': instance.jokyoDate?.toIso8601String(),
      'JigenIdx': instance.jigenIdx,
      'Ryaku': instance.ryaku,
      'ShukketsuBunrui': instance.shukketsuBunrui,
      'ShukketsuKbn': instance.shukketsuKbn,
      'Jiyu1': instance.jiyu1,
      'Jiyu2': instance.jiyu2,
      'IsEditable': instance.isEditable,
    };
