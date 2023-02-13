import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shusekibo/shared/http/app_exception.dart';

part 'app_state.freezed.dart';

@freezed
class AppState with _$AppState {
  const factory AppState.loading() = _Loading;
  const factory AppState.loaded() = _Loaded;
  const factory AppState.error(AppException error) = _Error;
}
