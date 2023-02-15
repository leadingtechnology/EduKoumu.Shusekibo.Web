import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shusekibo/shared/http/app_exception.dart';

import 'attendance_meibo_model.dart';

part 'attendance_meibo_state.freezed.dart';

@freezed
class AttendanceMeiboState with _$AttendanceMeiboState {
  const factory AttendanceMeiboState.blank() = _Blank;
  const factory AttendanceMeiboState.loading() = _Loading;
  const factory AttendanceMeiboState.loaded() = _Loaded;
  const factory AttendanceMeiboState.error(AppException error) = _Error;
}
