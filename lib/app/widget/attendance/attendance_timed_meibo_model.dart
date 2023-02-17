import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shusekibo/app/widget/attendance/attendance_status_model.dart';

part 'attendance_timed_meibo_model.freezed.dart';
part 'attendance_timed_meibo_model.g.dart';

List<AttendanceTimedMeiboModel> attendanceTimedMeiboListFromJson(
        List<dynamic> data,) =>
    List<AttendanceTimedMeiboModel>.from(
      data.map(
        (x) => AttendanceTimedMeiboModel.fromJson(x as Map<String, dynamic>),
      ),
    );

AttendanceTimedMeiboModel attendanceTimedMeiboFromJson(String str) =>
    AttendanceTimedMeiboModel.fromJson(
        json.decode(str) as Map<String, dynamic>,);

@freezed
class AttendanceTimedMeiboModel with _$AttendanceTimedMeiboModel {
  const factory AttendanceTimedMeiboModel({
    @JsonKey(name: 'StudentKihonId', disallowNullValue: false)
        int? studentKihonId,
    @JsonKey(name: 'StudentSeq', disallowNullValue: false) String? studentSeq,
    @JsonKey(name: 'Gakunen', disallowNullValue: false) String? gakunen,
    @JsonKey(name: 'ClassName', disallowNullValue: false) String? className,
    @JsonKey(name: 'StudentNumber', disallowNullValue: false)
        String? studentNumber,
    @JsonKey(name: 'PhotoImageFlg', disallowNullValue: false)
        bool? photoImageFlg,
    @JsonKey(name: 'Name', disallowNullValue: false) String? name,
    @JsonKey(name: 'GenderCode', disallowNullValue: false) String? genderCode,
    @JsonKey(name: 'PhotoUrl', disallowNullValue: false) String? photoUrl,
    @JsonKey(name: 'JokyoList', disallowNullValue: false)
        List<AttendanceStatusModel>? jokyoList,
  }) = _AttendanceTimedMeiboModel;
  const AttendanceTimedMeiboModel._();

  factory AttendanceTimedMeiboModel.fromJson(Map<String, dynamic> json) =>
      _$AttendanceTimedMeiboModelFromJson(json);
}

extension NewJson on AttendanceTimedMeiboModel {
  Map<String, dynamic> toNewJson() => {
        'SeitoSeq': studentSeq,
        'StudentKihonId': studentKihonId,
        'StudentTsushoName': name,
        'ShukketsuJigenModelList': jokyoList == null
            ? '[]'
            : jokyoList?.map((v) => v.toNewJson()).toList(),
      };
}
