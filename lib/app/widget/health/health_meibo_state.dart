import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shusekibo/shared/http/app_exception.dart';

part 'health_meibo_state.freezed.dart';

@freezed
class HealthMeiboState with _$HealthMeiboState {
  const factory HealthMeiboState.blank() = _Blank;
  const factory HealthMeiboState.loading() = _Loading;
  const factory HealthMeiboState.loaded() = _Loaded;
  const factory HealthMeiboState.error(AppException error) = _Error;
}
