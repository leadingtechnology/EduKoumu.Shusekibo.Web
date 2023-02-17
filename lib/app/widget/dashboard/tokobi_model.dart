import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tokobi_model.freezed.dart';
part 'tokobi_model.g.dart';

List<TokobiModel> tokobiListFromJson(List<dynamic> data) =>
    List<TokobiModel>.from(
        data.map((x) => TokobiModel.fromJson(x as Map<String, dynamic>)));

TokobiModel tokobiFromJson(String str) =>
    TokobiModel.fromJson(json.decode(str) as Map<String, dynamic>);

@freezed
class TokobiModel with _$TokobiModel {
  const TokobiModel._();
  const factory TokobiModel({
    @JsonKey(name: 'Date', disallowNullValue: false) DateTime? tokobi,
    @JsonKey(name: 'YobiCd', disallowNullValue: false) String? yobiCd,
    @JsonKey(name: 'WeekName', disallowNullValue: false) String? weekName,
    @JsonKey(name: 'Jigen', disallowNullValue: false) int? jigen,
    @JsonKey(name: 'IsToday', disallowNullValue: false) bool? isToday,
    @JsonKey(name: 'IsEditable', disallowNullValue: false) bool? isEditable,
    @JsonKey(name: 'StampedCount', disallowNullValue: false) int? stampedCount,
    @JsonKey(name: 'TotalCount', disallowNullValue: false) int? totalCount,
  }) = _TokobiModel;

  factory TokobiModel.fromJson(Map<String, dynamic> json) =>
      _$TokobiModelFromJson(json);
}
