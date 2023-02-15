import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shusekibo/shared/http/app_exception.dart';


part 'attendance_reason_state.freezed.dart';

@freezed
class AttendanceReasonState with _$AttendanceReasonState {
  const factory AttendanceReasonState.loading() = _Loading;
  const factory AttendanceReasonState.loaded() = _Loaded;
  const factory AttendanceReasonState.error(AppException error) = _Error;
}
