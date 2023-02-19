import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance_timed_status_model.freezed.dart';
part 'attendance_timed_status_model.g.dart';

List<AttendanceTimedStatusModel> attendanceTimedStatusListFromJson(
        List<dynamic> data) =>
    List<AttendanceTimedStatusModel>.from(
      data.map(
        (x) => AttendanceTimedStatusModel.fromJson(x as Map<String, dynamic>),
      ),
    );

AttendanceTimedStatusModel attendanceTimedStatusFromJson(String str) =>
    AttendanceTimedStatusModel.fromJson(json.decode(str) as Map<String, dynamic>);

@freezed
class AttendanceTimedStatusModel with _$AttendanceTimedStatusModel {
  const factory AttendanceTimedStatusModel({
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
  }) = _AttendanceTimedStatusModel;
  const AttendanceTimedStatusModel._();

  factory AttendanceTimedStatusModel.fromJson(Map<String, dynamic> json) =>
      _$AttendanceTimedStatusModelFromJson(json);
}

extension NewJson on AttendanceTimedStatusModel {
  Map<String, dynamic> toNewJson() => {
        'JigenIdx': jigenIdx,
        'ShukketsuBunrui': shukketsuBunrui,
        'ShukketsuKbn': shukketsuKbn,
        'Jiyu1': jiyu1,
        'Jiyu2': jiyu2,
      };
}
