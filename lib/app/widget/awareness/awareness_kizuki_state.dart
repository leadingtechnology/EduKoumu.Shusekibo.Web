import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shusekibo/shared/http/app_exception.dart';

part 'awareness_kizuki_state.freezed.dart';

@freezed
class AwarenessKizukiState with _$AwarenessKizukiState {
  const factory AwarenessKizukiState.blank() = _Blank;
  const factory AwarenessKizukiState.loading() = _Loading;
  const factory AwarenessKizukiState.loaded() = _Loaded;
  const factory AwarenessKizukiState.error(AppException error) = _Error;
}
