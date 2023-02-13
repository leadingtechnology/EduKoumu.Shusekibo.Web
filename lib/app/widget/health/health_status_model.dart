import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'health_status_model.freezed.dart';
part 'health_status_model.g.dart';

List<HealthStatusModel> healthStatusListFromJson(List<dynamic> data) =>
    List<HealthStatusModel>.from(
        data.map((x) => HealthStatusModel.fromJson(x as Map<String, dynamic>)));

HealthStatusModel healthStatusFromJson(String str) =>
    HealthStatusModel.fromJson(json.decode(str) as Map<String, dynamic>);

@freezed
class HealthStatusModel with _$HealthStatusModel {
  const factory HealthStatusModel({
    @JsonKey(name: 'Date', disallowNullValue: false) DateTime? kokyoDate,
    @JsonKey(name: 'JokyoCode', disallowNullValue: false) String? jokyoCode,
    @JsonKey(name: 'Ryaku', disallowNullValue: false) String? ryaku,
    @JsonKey(name: 'Jiyu1Code', disallowNullValue: false) String? jiyu1Code,
    @JsonKey(name: 'Jiyu1', disallowNullValue: false) String? jiyu1,
    @JsonKey(name: 'Jiyu2', disallowNullValue: false) String? jiyu2,
    @JsonKey(name: 'IsEditable', disallowNullValue: false) bool? isEditable,
  }) = _HealthStatusModel;
  const HealthStatusModel._();

  factory HealthStatusModel.fromJson(Map<String, dynamic> json) =>
      _$HealthStatusModelFromJson(json);
}

extension NewJson on HealthStatusModel {
  Map<String, dynamic> toNewJson() => {
        'KenkoKansatsuJokyoCd': jokyoCode,
        'KenkoKansatsuJiyuCd': jiyu1Code,
        'Jiyu1': jiyu1,
        'Jiyu2': jiyu2,
      };
}
