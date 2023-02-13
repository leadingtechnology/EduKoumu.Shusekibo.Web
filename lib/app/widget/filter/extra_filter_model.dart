import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'extra_filter_model.freezed.dart';
part 'extra_filter_model.g.dart';

List<ExtraFilterModel> extraFilterListFromJson(List<dynamic> data) =>
    List<ExtraFilterModel>.from(
        data.map((x) => ExtraFilterModel.fromJson(x as Map<String, dynamic>)));

ExtraFilterModel extraFilterFromJson(String str) =>
    ExtraFilterModel.fromJson(json.decode(str) as Map<String, dynamic>);

@freezed
class ExtraFilterModel with _$ExtraFilterModel {
  const factory ExtraFilterModel({
    @JsonKey(name: 'TargetDate', disallowNullValue: false) DateTime? targetDate,
    @JsonKey(name: 'JapanDate', disallowNullValue: false) String? japanDate,
    @JsonKey(name: 'BeginDate', disallowNullValue: false) DateTime? beginDate,
    @JsonKey(name: 'EndDate', disallowNullValue: false) DateTime? endDate,
    @JsonKey(name: 'JigenIdx', disallowNullValue: false) int? jigenIdx,
    @JsonKey(name: 'JigenRyaku', disallowNullValue: false) String? jigenRyaku,
  }) = _ExtraFilterModel;
  const ExtraFilterModel._();

  factory ExtraFilterModel.fromJson(Map<String, dynamic> json) =>
      _$ExtraFilterModelFromJson(json);
}
