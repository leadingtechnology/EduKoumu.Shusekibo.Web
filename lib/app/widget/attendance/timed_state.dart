import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shusekibo/shared/http/app_exception.dart';
import 'package:shusekibo/app/widget/attendance/timed_model.dart';

part 'timed_state.freezed.dart';

@freezed
class TimedState with _$TimedState {
  const factory TimedState.loading() = _Loading;
  const factory TimedState.loaded(List<TimedModel> dantaiList) = _Loaded;
  const factory TimedState.error(AppException error) = _Error;
}
