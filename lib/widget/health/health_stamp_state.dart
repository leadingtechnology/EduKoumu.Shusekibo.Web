import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shusekibo/shared/http/app_exception.dart';

import 'package:shusekibo/widget/health/health_stamp_model.dart';

part 'health_stamp_state.freezed.dart';

@freezed
class HealthStampState with _$HealthStampState {
  const factory HealthStampState.loading() = _Loading;
  const factory HealthStampState.loaded(
    List<HealthStampModel> registStamp,
    List<HealthStampModel> unegistStamp,
  ) = _Loaded;
  const factory HealthStampState.error(AppException error) = _Error;
}
