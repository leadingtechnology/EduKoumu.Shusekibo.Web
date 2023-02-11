import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_attendance_model.freezed.dart';
part 'home_attendance_model.g.dart';

List<HomeAttendanceModel> homeAttendanceListFromJson(List<dynamic> data) =>
    List<HomeAttendanceModel>.from(data.map((x) => HomeAttendanceModel.fromJson(x as Map<String, dynamic>)));

HomeAttendanceModel homeAttendanceFromJson(String str) => HomeAttendanceModel.fromJson(json.decode(str) as Map<String, dynamic>);

@freezed
class HomeAttendanceModel with _$HomeAttendanceModel {
  const HomeAttendanceModel._();
  const factory HomeAttendanceModel({

    @JsonKey(name: 'ClassName', disallowNullValue: false) String? className,
    @JsonKey(name: 'Zaiseki', disallowNullValue: false) int? zaiseki,
    @JsonKey(name: 'Shusseki', disallowNullValue: false) int? shusseki,
    @JsonKey(name: 'Tikoku', disallowNullValue: false) int? tikoku,
    @JsonKey(name: 'Sotai', disallowNullValue: false) int? sotai,
    @JsonKey(name: 'KessekiShuttei', disallowNullValue: false) int? kessekiShuttei,
    @JsonKey(name: 'Influenza', disallowNullValue: false) int? influenza,
    @JsonKey(name: 'DoneAttendanceFlg', disallowNullValue: false) bool? doneAttendanceFlg,
  }) = _HomeAttendanceModel;

  factory HomeAttendanceModel.fromJson(Map<String, dynamic> json) => _$HomeAttendanceModelFromJson(json);
}
