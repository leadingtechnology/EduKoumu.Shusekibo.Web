import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shusekibo/shared/http/app_exception.dart';

part 'home_attendance_state.freezed.dart';

@freezed
class HomeAttendanceState with _$HomeAttendanceState {
  const factory HomeAttendanceState.loading() = _Loading;
  const factory HomeAttendanceState.loaded() = _Loaded;
  const factory HomeAttendanceState.error(AppException error) = _Error;
}
