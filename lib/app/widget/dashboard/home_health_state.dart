import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shusekibo/shared/http/app_exception.dart';

part 'home_health_state.freezed.dart';

@freezed
class HomeHealthState with _$HomeHealthState {
  const factory HomeHealthState.loading() = _Loading;
  const factory HomeHealthState.loaded() = _Loaded;
  const factory HomeHealthState.error(AppException error) = _Error;
}
