import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'awareness_bunrui_model.freezed.dart';
part 'awareness_bunrui_model.g.dart';

List<AwarenessBunruiModel> awarenessBunruiListFromJson(List<dynamic> data) =>
    List<AwarenessBunruiModel>.from(data
        .map((x) => AwarenessBunruiModel.fromJson(x as Map<String, dynamic>)));

AwarenessBunruiModel awarenessBunruiFromJson(String str) =>
    AwarenessBunruiModel.fromJson(json.decode(str) as Map<String, dynamic>);

@freezed
class AwarenessBunruiModel with _$AwarenessBunruiModel {
  const factory AwarenessBunruiModel({
    @JsonKey(name: 'Id', disallowNullValue: false) int? id,
    @JsonKey(name: 'Code', disallowNullValue: false) String? code,
    @JsonKey(name: 'Name', disallowNullValue: false) String? name,
    @JsonKey(name: 'ShortName', disallowNullValue: false) String? shortName,
  }) = _AwarenessBunruiModel;
  const AwarenessBunruiModel._();

  factory AwarenessBunruiModel.fromJson(Map<String, dynamic> json) =>
      _$AwarenessBunruiModelFromJson(json);
}
