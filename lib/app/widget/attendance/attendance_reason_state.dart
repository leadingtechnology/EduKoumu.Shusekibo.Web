import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shusekibo/shared/http/app_exception.dart';

import 'package:shusekibo/app/widget/attendance/attendance_reason_model.dart';

part 'attendance_reason_state.freezed.dart';

@freezed
class AttendanceReasonState with _$AttendanceReasonState {
  const factory AttendanceReasonState.loading() = _Loading;
  const factory AttendanceReasonState.loaded(
      List<AttendanceReasonModel> reason1List,
      List<AttendanceReasonModel> reason2List,) = _Loaded;
  const factory AttendanceReasonState.error(AppException error) = _Error;
}
