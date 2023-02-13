// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_health_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HomeHealthModel _$$_HomeHealthModelFromJson(Map<String, dynamic> json) =>
    _$_HomeHealthModel(
      className: json['ClassName'] as String?,
      zaiseki: json['Zaiseki'] as int?,
      shusseki: json['Shusseki'] as int?,
      tikoku: json['Tikoku'] as int?,
      sotai: json['Sotai'] as int?,
      kessekiShuttei: json['KessekiShuttei'] as int?,
      influenza: json['Influenza'] as int?,
      doneKenkoKansatsuFlg: json['DoneKenkoKansatsuFlg'] as bool?,
    );

Map<String, dynamic> _$$_HomeHealthModelToJson(_$_HomeHealthModel instance) =>
    <String, dynamic>{
      'ClassName': instance.className,
      'Zaiseki': instance.zaiseki,
      'Shusseki': instance.shusseki,
      'Tikoku': instance.tikoku,
      'Sotai': instance.sotai,
      'KessekiShuttei': instance.kessekiShuttei,
      'Influenza': instance.influenza,
      'DoneKenkoKansatsuFlg': instance.doneKenkoKansatsuFlg,
    };
