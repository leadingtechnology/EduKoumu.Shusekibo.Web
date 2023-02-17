import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shusekibo/app/widget/attendance/attendance_status_model.dart';

part 'attendance_meibo_model.freezed.dart';
part 'attendance_meibo_model.g.dart';

List<AttendanceMeiboModel> attendanceMeiboListFromJson(List<dynamic> data) =>
    List<AttendanceMeiboModel>.from(data
        .map((x) => AttendanceMeiboModel.fromJson(x as Map<String, dynamic>)));

AttendanceMeiboModel attendanceMeiboFromJson(String str) =>
    AttendanceMeiboModel.fromJson(json.decode(str) as Map<String, dynamic>);

@freezed
class AttendanceMeiboModel with _$AttendanceMeiboModel {
  const factory AttendanceMeiboModel({
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
  }) = _AttendanceMeiboModel;
  const AttendanceMeiboModel._();

  factory AttendanceMeiboModel.fromJson(Map<String, dynamic> json) =>
      _$AttendanceMeiboModelFromJson(json);
}

extension NewJson on AttendanceMeiboModel {
  Map<String, dynamic> toNewJson() => {
        'SeitoSeq': studentSeq,
        'StudentKihonId': studentKihonId,
        'ShozokuNameTsusho': name,
        'ShukketsuModelList': jokyoList == null
            ? '[]'
            : jokyoList?.map((v) => v.toNewJson()).toList(),
      };
}
