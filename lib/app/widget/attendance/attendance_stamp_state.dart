import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shusekibo/shared/http/app_exception.dart';

import 'package:shusekibo/app/widget/attendance/attendance_stamp_model.dart';

part 'attendance_stamp_state.freezed.dart';

@freezed
class AttendanceStampState with _$AttendanceStampState {
  const factory AttendanceStampState.loading() = _Loading;
  const factory AttendanceStampState.loaded() = _Loaded;
  const factory AttendanceStampState.error(AppException error) = _Error;
}
