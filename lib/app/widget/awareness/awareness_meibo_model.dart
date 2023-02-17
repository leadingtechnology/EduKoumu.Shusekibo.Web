import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'awareness_meibo_model.freezed.dart';
part 'awareness_meibo_model.g.dart';

List<AwarenessMeiboModel> awarenessMeiboListFromJson(List<dynamic> data) =>
    List<AwarenessMeiboModel>.from(data.map((x) => AwarenessMeiboModel.fromJson(x as Map<String, dynamic>)));

AwarenessMeiboModel awarenessMeiboFromJson(String str) => AwarenessMeiboModel.fromJson(json.decode(str) as Map<String, dynamic>);



@freezed
class AwarenessMeiboModel with _$AwarenessMeiboModel {
  const factory AwarenessMeiboModel({

    @JsonKey(name: 'Gakunen', disallowNullValue: false) String? gakunen,
    @JsonKey(name: 'ShozokuId', disallowNullValue: false) int? shozokuId,
    @JsonKey(name: 'ClassName', disallowNullValue: false) String? className,
    @JsonKey(name: 'ShussekiNo', disallowNullValue: false) String? shussekiNo,
    @JsonKey(name: 'StudentKihonId', disallowNullValue: false) String? studentKihonId,
    @JsonKey(name: 'StudentId', disallowNullValue: false) int? studentId,
    @JsonKey(name: 'StudentName', disallowNullValue: false) String? studentName,
    @JsonKey(name: 'PhotoUrl', disallowNullValue: false) String? photoUrl,
    @JsonKey(name: 'GenderCode', disallowNullValue: false) String? genderCode,
    @JsonKey(name: 'KizukiCount', disallowNullValue: false) int? kizukiCount,
    @JsonKey(name: 'SelectFlag', disallowNullValue: false) bool? selectFlag,
    @JsonKey(name: 'ChangedFlag', disallowNullValue: false) bool? changedFlag,
  }) = _AwarenessMeiboModel;
  const AwarenessMeiboModel._();

  factory AwarenessMeiboModel.fromJson(Map<String, dynamic> json) => _$AwarenessMeiboModelFromJson(json);
}

