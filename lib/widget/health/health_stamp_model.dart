import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'health_stamp_model.freezed.dart';
part 'health_stamp_model.g.dart';

List<HealthStampModel> healthStampListFromJson(List<dynamic> data) =>
    List<HealthStampModel>.from(data.map((x) => HealthStampModel.fromJson(x as Map<String, dynamic>)));

HealthStampModel healthStampFromJson(String str) => HealthStampModel.fromJson(json.decode(str) as Map<String, dynamic>);

@freezed
class HealthStampModel with _$HealthStampModel {
  const HealthStampModel._();
  const factory HealthStampModel({

    @JsonKey(name: 'JokyoCd', disallowNullValue: false) String? jokyoCd,
    @JsonKey(name: 'Bunrui', disallowNullValue: false) String? bunrui,
    @JsonKey(name: 'Kubun', disallowNullValue: false) String? kubun,
    @JsonKey(name: 'JokyoNmSeishiki', disallowNullValue: false) String? jokyoNmSeishiki,
    @JsonKey(name: 'JokyoNmRyaku', disallowNullValue: false) String? jokyoNmRyaku,
    @JsonKey(name: 'JokyoNmTsu', disallowNullValue: false) String? jokyoNmTsu,
    @JsonKey(name: 'JokyoKey', disallowNullValue: false) String? jokyoKey,
    @JsonKey(name: 'ShukketsuBunrui', disallowNullValue: false) String? shukketsuBunrui,
    @JsonKey(name: 'ShukketsuKubun', disallowNullValue: false) String? shukketsuKubun,
  }) = _HealthStampModel;

  factory HealthStampModel.fromJson(Map<String, dynamic> json) => _$HealthStampModelFromJson(json);
}
