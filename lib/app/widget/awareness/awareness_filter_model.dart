import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'awareness_filter_model.freezed.dart';
part 'awareness_filter_model.g.dart';

List<AwarenessFilterModel> awarenessFilterListFromJson(List<dynamic> data) =>
    List<AwarenessFilterModel>.from(data.map((x) => AwarenessFilterModel.fromJson(x as Map<String, dynamic>)));

AwarenessFilterModel awarenessFilterFromJson(String str) => AwarenessFilterModel.fromJson(json.decode(str) as Map<String, dynamic>);

@freezed
class AwarenessFilterModel with _$AwarenessFilterModel {
  const factory AwarenessFilterModel({

    @JsonKey(name: 'DantaiId', disallowNullValue: false) int? dantaiId,
    @JsonKey(name: 'OrganizationKbn', disallowNullValue: false) String? organizationKbn,
    @JsonKey(name: 'DantaiName', disallowNullValue: false) String? dantaiName,
    @JsonKey(name: 'GakunenCode', disallowNullValue: false) String? gakunenCode,
    @JsonKey(name: 'GakunenRyakusho', disallowNullValue: false) String? gakunenRyakusho,
    @JsonKey(name: 'ClassId', disallowNullValue: false) int? classId,
    @JsonKey(name: 'ClassCode', disallowNullValue: false) String? classCode,
    @JsonKey(name: 'ClassName', disallowNullValue: false) String? className,
    @JsonKey(name: 'BeginDate', disallowNullValue: false) DateTime? beginDate,
    @JsonKey(name: 'EndDate', disallowNullValue: false) DateTime? endDate,
  }) = _AwarenessFilterModel;
  const AwarenessFilterModel._();

  factory AwarenessFilterModel.fromJson(Map<String, dynamic> json) => _$AwarenessFilterModelFromJson(json);
}
