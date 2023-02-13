import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'timed_model.freezed.dart';
part 'timed_model.g.dart';

List<TimedModel> timedListFromJson(List<dynamic> data) =>
    List<TimedModel>.from(data.map((x) => TimedModel.fromJson(x as Map<String, dynamic>)));

TimedModel timedFromJson(String str) => TimedModel.fromJson(json.decode(str) as Map<String, dynamic>);

@freezed
class TimedModel with _$TimedModel {
  const factory TimedModel({

    @JsonKey(name: 'YobiCd', disallowNullValue: false) String? yobiCd,
    @JsonKey(name: 'JigenIdx', disallowNullValue: false) int? jigenIdx,
    @JsonKey(name: 'Ryaku', disallowNullValue: false) String? ryaku,
    @JsonKey(name: 'NikkahyoShubetsuCode', disallowNullValue: false) String? nikkahyoShubetsuCode,
  }) = _TimedModel;
  const TimedModel._();

  factory TimedModel.fromJson(Map<String, dynamic> json) => _$TimedModelFromJson(json);
}
