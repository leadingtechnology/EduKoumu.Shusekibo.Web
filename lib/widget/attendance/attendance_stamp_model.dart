import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance_stamp_model.freezed.dart';
part 'attendance_stamp_model.g.dart';

List<AttendanceStampModel> attendanceStampListFromJson(List<dynamic> data) =>
    List<AttendanceStampModel>.from(data.map((x) => AttendanceStampModel.fromJson(x as Map<String, dynamic>)));

AttendanceStampModel attendanceStampFromJson(String str) => AttendanceStampModel.fromJson(json.decode(str) as Map<String, dynamic>);



@freezed
class AttendanceStampModel with _$AttendanceStampModel {
  const AttendanceStampModel._();
  const factory AttendanceStampModel({

    @JsonKey(name: 'ShukketsuJokyoCd', disallowNullValue: false) String? shukketsuJokyoCd,
    @JsonKey(name: 'ShukketsuBunrui', disallowNullValue: false) String? shukketsuBunrui,
    @JsonKey(name: 'ShukketsuKbn', disallowNullValue: false) String? shukketsuKbn,
    @JsonKey(name: 'ShukketsuJokyoNmSeishiki', disallowNullValue: false) String? shukketsuJokyoNmSeishiki,
    @JsonKey(name: 'ShukketsuJokyoNmRyaku', disallowNullValue: false) String? shukketsuJokyoNmRyaku,
    @JsonKey(name: 'ShukketsuJokyoNmTsu', disallowNullValue: false) String? shukketsuJokyoNmTsu,
    @JsonKey(name: 'ShukketsuJokyoKey', disallowNullValue: false) String? shukketsuJokyoKey,
  }) = _AttendanceStampModel;

  factory AttendanceStampModel.fromJson(Map<String, dynamic> json) => _$AttendanceStampModelFromJson(json);
}
