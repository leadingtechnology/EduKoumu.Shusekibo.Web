import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shusekibo/shared/http/app_exception.dart';

part 'timed_state.freezed.dart';

@freezed
class TimedState with _$TimedState {
  const factory TimedState.loading() = _Loading;
  const factory TimedState.loaded() = _Loaded;
  const factory TimedState.error(AppException error) = _Error;
}
