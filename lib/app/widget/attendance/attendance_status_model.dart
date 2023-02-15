import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance_status_model.freezed.dart';
part 'attendance_status_model.g.dart';

List<AttendanceStatusModel> attendanceStatusListFromJson(List<dynamic> data) =>
    List<AttendanceStatusModel>.from(
      data.map(
        (x) => AttendanceStatusModel.fromJson(x as Map<String, dynamic>),
      ),
    );

AttendanceStatusModel attendanceStatusFromJson(String str) =>
    AttendanceStatusModel.fromJson(json.decode(str) as Map<String, dynamic>);

@freezed
class AttendanceStatusModel with _$AttendanceStatusModel {
  const factory AttendanceStatusModel({
    @JsonKey(name: 'Date', disallowNullValue: false) DateTime? jokyoDate,
    @JsonKey(name: 'JigenIdx', disallowNullValue: false) int? jigenIdx,
    @JsonKey(name: 'Ryaku', disallowNullValue: false) String? ryaku,
    @JsonKey(name: 'ShukketsuBunrui', disallowNullValue: false)
        String? shukketsuBunrui,
    @JsonKey(name: 'ShukketsuKbn', disallowNullValue: false)
        String? shukketsuKbn,
    @JsonKey(name: 'Jiyu1', disallowNullValue: false) String? jiyu1,
    @JsonKey(name: 'Jiyu2', disallowNullValue: false) String? jiyu2,
    @JsonKey(name: 'IsEditable', disallowNullValue: false) bool? isEditable,
  }) = _AttendanceStatusModel;
  const AttendanceStatusModel._();

  factory AttendanceStatusModel.fromJson(Map<String, dynamic> json) =>
      _$AttendanceStatusModelFromJson(json);
}
