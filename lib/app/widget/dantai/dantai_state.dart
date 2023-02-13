import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shusekibo/shared/http/app_exception.dart';

import 'dantai_model.dart';

part 'dantai_state.freezed.dart';

@freezed
class DantaiState with _$DantaiState {
  const factory DantaiState.loading() = _Loading;
  const factory DantaiState.loaded() = _Loaded;
  const factory DantaiState.error(AppException error) = _Error;
}
