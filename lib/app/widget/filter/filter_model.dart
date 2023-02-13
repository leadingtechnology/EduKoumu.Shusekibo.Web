import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_model.freezed.dart';
part 'filter_model.g.dart';

List<FilterModel> filterListFromJson(List<dynamic> data) =>
    List<FilterModel>.from(
        data.map((x) => FilterModel.fromJson(x as Map<String, dynamic>)));

FilterModel filterFromJson(String str) =>
    FilterModel.fromJson(json.decode(str) as Map<String, dynamic>);

@freezed
class FilterModel with _$FilterModel {
  const factory FilterModel({

    @JsonKey(name: 'DantaiId', disallowNullValue: false) int? dantaiId,
    @JsonKey(name: 'OrganizationKbn', disallowNullValue: false) String? organizationKbn,
    @JsonKey(name: 'DantaiName', disallowNullValue: false) String? dantaiName,
    @JsonKey(name: 'GakunenCode', disallowNullValue: false) String? gakunenCode,
    @JsonKey(name: 'GakunenRyakusho', disallowNullValue: false) String? gakunenRyakusho,
    @JsonKey(name: 'kouryuGakkyu', disallowNullValue: false) bool? kouryuGakkyu,
    @JsonKey(name: 'ClassId', disallowNullValue: false) int? classId,
    @JsonKey(name: 'ClassCode', disallowNullValue: false) String? classCode,
    @JsonKey(name: 'ClassName', disallowNullValue: false) String? className,
    //
    @JsonKey(name: 'JigenIdx', disallowNullValue: false) int? jigenIdx,
    @JsonKey(name: 'JigenRyaku', disallowNullValue: false) String? jigenRyaku,
    @JsonKey(name: 'TargetDate', disallowNullValue: false) DateTime? targetDate,
    @JsonKey(name: 'JapanDate', disallowNullValue: false) String? japanDate,
    @JsonKey(name: 'BeginDate', disallowNullValue: false) DateTime? beginDate,
    @JsonKey(name: 'EndDate', disallowNullValue: false) DateTime? endDate,

  }) = _FilterModel;
  const FilterModel._();

  factory FilterModel.fromJson(Map<String, dynamic> json) => _$FilterModelFromJson(json);
}
