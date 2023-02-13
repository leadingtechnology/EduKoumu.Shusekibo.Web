import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shusekibo/shared/http/app_exception.dart';

import 'package:shusekibo/app/widget/dashboard/home_attendance_model.dart';

part 'home_attendance_state.freezed.dart';

@freezed
class HomeAttendanceState with _$HomeAttendanceState {
  const factory HomeAttendanceState.loading() = _Loading;
  const factory HomeAttendanceState.loaded(List<HomeAttendanceModel> list) = _Loaded;
  const factory HomeAttendanceState.error(AppException error) = _Error;
}
