import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'health_reason_model.freezed.dart';
part 'health_reason_model.g.dart';

List<HealthReasonModel> healthReasonListFromJson(List<dynamic> data) =>
    List<HealthReasonModel>.from(data.map((x) => HealthReasonModel.fromJson(x as Map<String, dynamic>)));

HealthReasonModel healthReasonFromJson(String str) => HealthReasonModel.fromJson(json.decode(str) as Map<String, dynamic>);



@freezed
class HealthReasonModel with _$HealthReasonModel {
  const HealthReasonModel._();
  const factory HealthReasonModel({

    @JsonKey(name: 'JokyoCd', disallowNullValue: false) String? jokyoCd,
    @JsonKey(name: 'JiyuCd', disallowNullValue: false) String? jiyuCd,
    @JsonKey(name: 'JiyuNmSeishiki', disallowNullValue: false) String? jiyuNmSeishiki,
    @JsonKey(name: 'JiyuNmRyaku', disallowNullValue: false) String? jiyuNmRyaku,
    @JsonKey(name: 'KenkoFlg', disallowNullValue: false) bool? kenkoFlg,
    @JsonKey(name: 'DelFlg', disallowNullValue: false) bool? delFlg,
  }) = _HealthReasonModel;

  factory HealthReasonModel.fromJson(Map<String, dynamic> json) => _$HealthReasonModelFromJson(json);
}
