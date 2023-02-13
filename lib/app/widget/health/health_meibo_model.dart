import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shusekibo/app/widget/health/health_status_model.dart';

part 'health_meibo_model.freezed.dart';
part 'health_meibo_model.g.dart';

List<HealthMeiboModel> healthMeiboListFromJson(List<dynamic> data) =>
    List<HealthMeiboModel>.from(
        data.map((x) => HealthMeiboModel.fromJson(x as Map<String, dynamic>)),);

HealthMeiboModel healthMeiboFromJson(String str) =>
    HealthMeiboModel.fromJson(json.decode(str) as Map<String, dynamic>);

@freezed
class HealthMeiboModel with _$HealthMeiboModel {
  const factory HealthMeiboModel({
    @JsonKey(name: 'StudentKihonId', disallowNullValue: false) int? studentKihonId,
    @JsonKey(name: 'StudentSeq', disallowNullValue: false) String? studentSeq,
    @JsonKey(name: 'Gakunen', disallowNullValue: false) String? gakunen,
    @JsonKey(name: 'ClassName', disallowNullValue: false) String? className,
    @JsonKey(name: 'StudentNumber', disallowNullValue: false) String? studentNumber,
    @JsonKey(name: 'PhotoImageFlg', disallowNullValue: false) bool? photoImageFlg,
    @JsonKey(name: 'Name', disallowNullValue: false) String? name,
    @JsonKey(name: 'GenderCode', disallowNullValue: false) String? genderCode,
    @JsonKey(name: 'PhotoUrl', disallowNullValue: false) String? photoUrl,
    @JsonKey(name: 'JokyoList', disallowNullValue: false) List<HealthStatusModel>? jokyoList,
  }) = _HealthMeiboModel;
  const HealthMeiboModel._();

  factory HealthMeiboModel.fromJson(Map<String, dynamic> json) => _$HealthMeiboModelFromJson(json);
}

extension NewJson on HealthMeiboModel {
  Map<String, dynamic> toNewJson() => {
        'SeitoSeq': studentSeq,
        'StudentKihonId': studentKihonId,
        'KenkoKansatsuModelList': jokyoList == null
            ? '[]'
            : jokyoList?.map((v) => v.toNewJson()).toList(),
      };
}
