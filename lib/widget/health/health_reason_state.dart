import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shusekibo/shared/http/app_exception.dart';

import 'package:shusekibo/widget/health/health_reason_model.dart';

part 'health_reason_state.freezed.dart';

@freezed
class HealthReasonState with _$HealthReasonState {
  const factory HealthReasonState.loading() = _Loading;
  const factory HealthReasonState.loaded(List<HealthReasonModel> reason1List,
      List<HealthReasonModel> reason2List,) = _Loaded;
  const factory HealthReasonState.error(AppException error) = _Error;
}
