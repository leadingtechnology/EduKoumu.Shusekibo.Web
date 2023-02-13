import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shusekibo/shared/http/app_exception.dart';

part 'health_stamp_state.freezed.dart';

@freezed
class HealthStampState with _$HealthStampState {
  const factory HealthStampState.loading() = _Loading;
  const factory HealthStampState.loaded() = _Loaded;
  const factory HealthStampState.error(AppException error) = _Error;
}
