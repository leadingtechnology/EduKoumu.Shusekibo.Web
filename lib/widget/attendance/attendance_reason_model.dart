import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance_reason_model.freezed.dart';
part 'attendance_reason_model.g.dart';

List<AttendanceReasonModel> attendanceReasonListFromJson(List<dynamic> data) =>
    List<AttendanceReasonModel>.from(data.map((x) => AttendanceReasonModel.fromJson(x as Map<String, dynamic>)));

AttendanceReasonModel attendanceReasonFromJson(String str) => AttendanceReasonModel.fromJson(json.decode(str) as Map<String, dynamic>);

@freezed
class AttendanceReasonModel with _$AttendanceReasonModel {
  const AttendanceReasonModel._();
  const factory AttendanceReasonModel({

    @JsonKey(name: 'ShukketsuJokyoCd', disallowNullValue: false) String? shukketsuJokyoCd,
    @JsonKey(name: 'ShukketsuJiyuCd', disallowNullValue: false) String? shukketsuJiyuCd,
    @JsonKey(name: 'Hyoujijun', disallowNullValue: false) String? hyoujijun,
    @JsonKey(name: 'ShukketsuJiyuNmSeishiki', disallowNullValue: false) String? shukketsuJiyuNmSeishiki,
    @JsonKey(name: 'ShukketsuJiyuNmRyaku', disallowNullValue: false) String? shukketsuJiyuNmRyaku,
  }) = _AttendanceReasonModel;

  factory AttendanceReasonModel.fromJson(Map<String, dynamic> json) => _$AttendanceReasonModelFromJson(json);
}

